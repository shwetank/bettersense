---
title: Scheduling routines
description: How to wire up bettersense skills to run on a cadence — using Claude Code's built-in scheduling, or OS-level scheduling on macOS, Linux, and Windows.
---

Claude Code skills are stateless — they fire when invoked, not automatically. Cadence requires a scheduler. This guide covers the options from simplest to most hands-on: Claude Code's built-in Desktop scheduled tasks, OS-level scheduling (cron, launchd, systemd, Task Scheduler), and the session-scoped `/loop` tool.

## Honest constraints to set expectations

Before wiring up schedules, three things to know:

1. **Output lives inside Claude Code (or a log file).** No mobile push, no email, no SMS by default. Claude Code is desktop/CLI/IDE.
2. **Desktop tasks only fire while Claude Code is running.** If you close it Friday afternoon and don't reopen until Tuesday, the Friday task fires when you next resume that session — or not at all if the session expired.
3. **Cadence reliability scales with how often you open Claude Code.** Daily users get the full benefit. Weekly users see things drift.

**The fix:** pair every schedule with a calendar reminder in the system you *do* check. The calendar grabs your attention; Claude Code does the work.

---

## Path 1: Claude Code built-in scheduling (recommended)

Requires **Claude Code v2.1.72 or later**. Check with `claude --version`.

Claude Code has native scheduling built in — no plugins to install. You describe what you want to schedule in plain language, and Claude creates a cron-based task that fires between your turns. Desktop tasks have full access to your local files (including the `~/bettersense-work-reflections/` directory) and are restored when you resume a session with `claude --resume`.

### Weekly Friday — wins nudge

In Claude Code, say:

```
Schedule a task to run every Friday at 4pm: run /bettersense:wins-due and show me the list
```

Pair with a Friday 4pm calendar event: **"Open Claude Code → log this week's wins"**.

### Weekly Monday — stakeholder due-list

```
Schedule a task to run every Monday at 9am: run /bettersense:stakeholder-due and show me the list
```

### Monthly — self-reflection

```
Schedule a task to run on the first Monday of every month at 10am: run /bettersense:self-reflect
```

`self-reflect` picks cadence-appropriate questions and walks through them. If you miss a month, no harm done — the next run picks up.

### Quarterly — team health diagnosis

```
Schedule a task to run on the first Monday of every quarter at 10am: run /bettersense:team-diagnosis
```

Run this *before* drafting the next quarter's plan — the diagnosis often surfaces what the plan should address.

### Sunday evening — patterns watch

```
Schedule a task to run every Sunday at 7pm: run /bettersense:patterns-watch
```

Most useful after 4+ weeks of logging (patterns need volume).

### Weekly or daily — product pulse

```
Schedule a task to run every Monday at 8am: run /bettersense:product-pulse for the default area
```

For fast-moving products or launch windows, daily:

```
Schedule a task to run every weekday at 8am: run /bettersense:product-pulse for the default area
```

### Monthly — pulse synthesis

```
Schedule a task to run on the first Monday of every month at 11am: run /bettersense:pulse-synthesize over the last 30 days for the default area
```

### Managing your tasks

```
what scheduled tasks do I have?
cancel the wins-due task
```

Claude Code also exposes `CronList` and `CronDelete` tools directly. Tasks expire after 7 days if not touched; recreate them before they expire, or use OS-level scheduling (below) for permanent, session-independent cadences.

---

## Path 2: `/loop` for in-session polling

`/loop` is a built-in skill for session-scoped, repeating prompts — think polling a deployment or watching a PR. It fires while the session is open and stops when you close it. This makes it **not ideal** for bettersense's weekly/monthly cadences, but useful for active work sessions:

```
/loop 10m run /bettersense:product-pulse for the default area and summarize changes
```

You can also let Claude pick the interval (omit the time), or run a bare `/loop` to use Claude's built-in maintenance prompt. See the [Claude Code scheduling docs](https://code.claude.com/docs/en/scheduled-tasks) for the full `/loop` reference.

---

## Path 3: OS-level scheduling

For cadences that need to run regardless of whether Claude Code is open — or if you're on an older version that doesn't support built-in scheduling — use your OS's native scheduler to invoke `claude` headlessly.

Create the log directory first:

```bash
# macOS / Linux / WSL
mkdir -p ~/bettersense-logs

# Windows (PowerShell)
New-Item -ItemType Directory -Force "$HOME\bettersense-logs"
```

---

### macOS / Linux / WSL — cron

Edit your crontab:

```bash
crontab -e
```

Add entries using the format `minute hour day month weekday`:

```bash
# Friday 4pm — wins nudge
0 16 * * 5  claude -p "run /bettersense:wins-due" >> ~/bettersense-logs/wins-due.log 2>&1

# Monday 9am — stakeholder due-list
0 9 * * 1  claude -p "run /bettersense:stakeholder-due" >> ~/bettersense-logs/stakeholder-due.log 2>&1

# First of the month at 10am — self-reflection
0 10 1 * *  claude -p "run /bettersense:self-reflect" >> ~/bettersense-logs/self-reflect.log 2>&1
```

Verify cron is running and `claude` is in the PATH cron sees:

```bash
which claude           # get the full path
crontab -l             # list current entries
```

If `claude` isn't found by cron, use the absolute path (e.g. `/usr/local/bin/claude`).

---

### macOS — launchd (alternative to cron)

launchd survives sleep/wake cycles and respects login sessions better than cron. Create a plist at `~/Library/LaunchAgents/ai.bettersense.wins-due.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>ai.bettersense.wins-due</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/local/bin/claude</string>
    <string>-p</string>
    <string>run /bettersense:wins-due</string>
  </array>
  <key>StartCalendarInterval</key>
  <dict>
    <key>Weekday</key><integer>5</integer>
    <key>Hour</key><integer>16</integer>
    <key>Minute</key><integer>0</integer>
  </dict>
  <key>StandardOutPath</key>
  <string>/Users/YOUR_USERNAME/bettersense-logs/wins-due.log</string>
  <key>RunAtLoad</key>
  <false/>
</dict>
</plist>
```

Replace `/usr/local/bin/claude` with the output of `which claude`, and `YOUR_USERNAME` with your macOS username. Load it:

```bash
launchctl load ~/Library/LaunchAgents/ai.bettersense.wins-due.plist

# Verify it's loaded:
launchctl list | grep bettersense
```

Duplicate the file for each skill you want scheduled, changing the `Label`, `ProgramArguments`, `StartCalendarInterval`, and `StandardOutPath`.

---

### Linux — systemd user timers (alternative to cron)

Systemd timers are more observable than cron — you can check status, last run time, and logs.

Create a service file at `~/.config/systemd/user/bettersense-wins.service`:

```ini
[Unit]
Description=bettersense wins nudge

[Service]
Type=oneshot
ExecStart=/usr/local/bin/claude -p "run /bettersense:wins-due"
StandardOutput=append:%h/bettersense-logs/wins-due.log
StandardError=append:%h/bettersense-logs/wins-due.log
```

Create a timer file at `~/.config/systemd/user/bettersense-wins.timer`:

```ini
[Unit]
Description=Run bettersense wins nudge every Friday

[Timer]
OnCalendar=Fri *-*-* 16:00:00
Persistent=true

[Install]
WantedBy=timers.target
```

Enable and start:

```bash
systemctl --user daemon-reload
systemctl --user enable --now bettersense-wins.timer

# Check status:
systemctl --user status bettersense-wins.timer
systemctl --user list-timers
```

Use `%h` in the service file (expands to your home directory) rather than `~`.

---

### Windows — Task Scheduler

**Option A: PowerShell (command line)**

```powershell
# Create the log directory
New-Item -ItemType Directory -Force "$HOME\bettersense-logs"

# Register a weekly Friday wins nudge
$action = New-ScheduledTaskAction `
    -Execute "claude" `
    -Argument "-p `"run /bettersense:wins-due`""

$trigger = New-ScheduledTaskTrigger `
    -Weekly -DaysOfWeek Friday -At "4:00PM"

$settings = New-ScheduledTaskSettingsSet `
    -StartWhenAvailable -RunOnlyIfNetworkAvailable

Register-ScheduledTask `
    -TaskName "bettersense-wins-due" `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Description "bettersense weekly wins nudge" `
    -RunLevel Limited
```

Repeat for each skill, changing `-TaskName`, `-Argument`, and `-Trigger`.

**Option B: Task Scheduler GUI**

1. Open Task Scheduler (`taskschd.msc`)
2. Create Basic Task → name it "bettersense wins nudge"
3. Trigger: Weekly, Friday, 4:00 PM
4. Action: Start a program → Program: `claude`, Arguments: `-p "run /bettersense:wins-due"`
5. Finish

**Verify Windows schedules:**

```powershell
Get-ScheduledTask | Where-Object { $_.TaskName -like 'bettersense*' }
```

For WSL users on Windows: use the Linux (cron or systemd) instructions above inside your WSL environment.

---

## Choosing the right approach

| | Built-in scheduling | `/loop` | OS-level |
|---|---|---|---|
| Requires Claude Code open | No (fires on resume) | Yes (session only) | No |
| Persists across restarts | Yes (7-day window) | No | Yes (permanent) |
| Local file access | Yes | Yes | Yes |
| Min version | v2.1.72+ | v2.1.72+ | Any |
| Platforms | All | All | All |
| Setup | Ask Claude | Ask Claude | Manual config |

**Use built-in scheduling** for most bettersense routines — it's the simplest path if you're on v2.1.72+.  
**Use `/loop`** for in-session monitoring during active work (checking a build, watching a PR).  
**Use OS-level scheduling** if you want tasks to fire whether or not you have Claude Code open, or if you're on an older version.
