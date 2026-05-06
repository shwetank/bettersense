---
title: Scheduling routines
description: How to wire up bettersense skills to run on a cadence — using the /schedule skill, or OS-level scheduling on macOS, Linux, and Windows.
---

Claude Code skills are stateless — they fire when invoked, not automatically. Cadence requires an external scheduler. This guide covers all paths: the `/schedule` skill (inside Claude Code), cron (macOS/Linux), systemd timers (Linux), launchd (macOS), and Task Scheduler (Windows).

## Honest constraints to set expectations

Before wiring up schedules, three things to know:

1. **Output lives inside Claude Code (or a log file).** No mobile push, no email, no SMS by default. Claude Code is desktop/CLI/IDE.
2. **If you close Claude Code on Friday and don't open it until Tuesday**, the Friday `wins-due` output sits unread.
3. **Cadence reliability scales with how often you open Claude Code.** Daily users get the full benefit. Weekly users see things drift.

**The fix:** pair every schedule with a calendar reminder in the system you *do* check. The calendar grabs your attention; Claude Code does the work.

---

## Path 1: The `/schedule` skill (all platforms)

`/schedule` is a separate Claude Code plugin — not built-in. Install it from Anthropic's marketplace if it's not already present:

```
/plugin marketplace add anthropic/schedule
```

Once installed, set up the recurring skills you want. Run each command once in Claude Code:

### Weekly Friday — wins nudge

```
/schedule "Every Friday at 4pm, run /bettersense:wins-due and post the list"
```

Pair with a Friday 4pm calendar event: **"Open Claude Code → log this week's wins"**.

### Weekly Monday — stakeholder due-list

```
/schedule "Every Monday at 9am, run /bettersense:stakeholder-due and post the list"
```

### Monthly — self-reflection

```
/schedule "On the first Monday of every month at 10am, run /bettersense:self-reflect"
```

### Quarterly — team health diagnosis

```
/schedule "On the first Monday of every quarter at 10am, run /bettersense:team-diagnosis"
```

Run this *before* drafting the next quarter's plan — the diagnosis often surfaces what the plan should address.

### Weekly or daily — product pulse

```
/schedule "Every Monday at 8am, run /bettersense:product-pulse for the default area"
```

### Monthly — pulse synthesis

```
/schedule "On the first Monday of every month at 11am, run /bettersense:pulse-synthesize over the last 30 days for default area"
```

### Sunday evening — patterns watch

```
/schedule "Every Sunday at 7pm, run /bettersense:patterns-watch"
```

---

## Path 2: OS-level scheduling fallback

If `/schedule` isn't available, use your OS's native scheduler to invoke Claude Code headlessly.

Create the log directory first (if using log output):

```bash
# macOS / Linux
mkdir -p ~/bettersense-logs

# Windows (PowerShell)
New-Item -ItemType Directory -Force "$HOME\bettersense-logs"
```

---

### macOS / Linux — cron

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

Verify cron is running and `claude` is in the PATH that cron sees:

```bash
which claude           # get the full path
crontab -l             # list current entries
```

If `claude` isn't found by cron, use the absolute path (e.g. `/usr/local/bin/claude` or wherever `which claude` points).

---

### macOS — launchd (alternative to cron)

launchd is more reliable than cron on macOS (survives sleep/wake, respects login sessions). Create a plist at `~/Library/LaunchAgents/ai.bettersense.wins-due.plist`:

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

Replace `/usr/local/bin/claude` with the output of `which claude`, and `YOUR_USERNAME` with your macOS username.

Load it:

```bash
launchctl load ~/Library/LaunchAgents/ai.bettersense.wins-due.plist

# Verify it's loaded:
launchctl list | grep bettersense
```

Duplicate the file for each skill you want scheduled, changing the `Label`, `ProgramArguments`, `StartCalendarInterval`, and `StandardOutPath`.

---

### Linux — systemd user timers (alternative to cron)

Systemd timers are more observable than cron — you can check status, see last run time, and view logs.

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

**Option B: XML import**

Save this as `bettersense-wins-due.xml` and adjust the time:

```xml
<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <Triggers>
    <CalendarTrigger>
      <StartBoundary>2025-01-01T16:00:00</StartBoundary>
      <ScheduleByWeek>
        <WeeksInterval>1</WeeksInterval>
        <DaysOfWeek><Friday /></DaysOfWeek>
      </ScheduleByWeek>
    </CalendarTrigger>
  </Triggers>
  <Actions>
    <Exec>
      <Command>claude</Command>
      <Arguments>-p "run /bettersense:wins-due"</Arguments>
    </Exec>
  </Actions>
</Task>
```

Import it:

```powershell
Register-ScheduledTask -Xml (Get-Content "bettersense-wins-due.xml" -Raw) -TaskName "bettersense-wins-due"
```

**Option C: Task Scheduler GUI**

1. Open Task Scheduler (`taskschd.msc`)
2. Create Basic Task → name it "bettersense wins nudge"
3. Trigger: Weekly, Friday, 4:00 PM
4. Action: Start a program → Program: `claude`, Arguments: `-p "run /bettersense:wins-due"`
5. Finish

**Verify Windows schedules:**

```powershell
Get-ScheduledTask | Where-Object { $_.TaskName -like 'bettersense*' }
```

---

## Platform reference table

| Feature | macOS | Linux | Windows |
|---|---|---|---|
| `/schedule` plugin | ✅ | ✅ | ✅ |
| cron | ✅ | ✅ | ❌ (use Task Scheduler) |
| launchd | ✅ | ❌ | ❌ |
| systemd timers | ❌ | ✅ | ❌ (WSL only) |
| Task Scheduler | ❌ | ❌ | ✅ |

For WSL users on Windows: use the Linux (cron or systemd) instructions above inside your WSL environment.
