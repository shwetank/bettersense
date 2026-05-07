---
title: Scheduling routines
description: How to wire up bettersense skills to run on a cadence — using the Claude Code Desktop app's built-in Routines, or OS-level scheduling on macOS, Linux, and Windows.
---

Claude Code skills are stateless — they fire when invoked, not automatically. Cadence requires a scheduler. This guide covers the options in order of recommendation.

## Which scheduler to use

Claude Code offers three scheduling mechanisms. Only two work for bettersense:

| | Desktop Routines | OS-level | Session tasks | Cloud routines |
|---|---|---|---|---|
| Works with bettersense | ✅ | ✅ | ⚠️ weekly only | ❌ |
| Local file access | Yes | Yes | Yes | **No** |
| Biweekly / monthly cadence | ✅ | ✅ | ❌ expires in 7 days | ❌ |
| Fires without app open | No | Yes | No | Yes |
| Setup | Desktop app UI | Manual config | Ask Claude (CLI) | `schedule` skill |

**Use Desktop Routines** if you use the Claude Code Desktop app — simplest setup, any cadence, no expiry.

**Use OS-level scheduling** if you use Claude Code in the terminal, want tasks to fire even when the app is closed, or need monthly/quarterly cadences without the Desktop app.

**Do not use cloud routines** — they run on Anthropic's servers and cannot read `~/bettersense-work-reflections/`.

**Session-scoped tasks** (created by asking Claude to schedule something in a CLI session) expire after **7 days**. A biweekly task expires before its second firing. A monthly task expires before it ever fires. Avoid for bettersense cadences.

---

## Path 1: Claude Code Desktop Routines (recommended)

Requires the **Claude Code Desktop app** (not the CLI). Opens in the app at Routines → New routine → Local.

Desktop Routines run on your machine with full access to `~/bettersense-work-reflections/`. They persist indefinitely (no expiry), fire while the Desktop app is open, and support any cadence. The app will catch up on missed runs when it next opens — if your computer slept through Monday's pulse check, it runs once when you wake up.

### Create a routine

1. Open the Claude Code Desktop app
2. Click **Routines** in the sidebar
3. Click **New routine → Local**
4. Fill in:
   - **Name**: e.g. `wins-nudge`
   - **Instructions**: what Claude should do (see table below)
   - **Schedule**: choose a preset, or ask Claude in a Desktop session for custom intervals
5. Set the working folder to your bettersense repo or home directory
6. Save, then click **Run now** to catch any permission prompts before the first scheduled run

### Routine reference

| Routine | Recommended cadence | Instructions |
|---|---|---|
| Wins nudge | Weekly, Friday 4pm | `Run /wins-due and show me the list` |
| Stakeholder due-list | Weekly, Monday 9am | `Run /stakeholder-due and show me the list` |
| Self-reflection | Monthly, first Monday 10am | `Run /self-reflect` |
| Patterns watch | Weekly, Sunday 6pm | `Run /patterns-watch` |
| Product pulse | Weekly Monday 8am (or daily) | `Run /product-pulse for the default area` |
| Pulse synthesis | Monthly, first Monday 11am | `Run /pulse-synthesize over the last 30 days for the default area` |
| Team health diagnosis | Quarterly, first Monday 10am | `Run /team-diagnosis` |
| Growth plan review | Quarterly, first Monday 11am | `Run /report-career-architect for each report and surface the plan review prompts` |
| Managing-down synthesis | Monthly, 15th 10am | `Run /stakeholder-synthesize over managing-down for the last 30 days` |

For schedules not in the preset picker (biweekly, monthly, quarterly), ask Claude in any Desktop session: *"Set my wins-nudge routine to run every other Monday at 9am."*

### Managing routines

From the Routines list, click any routine to pause, edit, run immediately, or review history. You can also ask Claude in a Desktop session: *"show me my scheduled routines"* or *"pause the pulse routine."*

:::note[Plugin namespace]
If you installed via `--plugin-dir`, skill names need the `bettersense:` prefix — e.g. `/bettersense:wins-due`. The standalone symlink/copy install uses bare names.
:::

---

## Path 2: `/loop` for in-session polling

`/loop` is a built-in skill for session-scoped, repeating prompts. It fires while the session is open and stops when you close it — not suitable for bettersense's weekly/monthly cadences, but useful during active work sessions:

```
/loop 10m run /bettersense:product-pulse for the default area and summarize any changes
```

See the [Claude Code scheduling docs](https://code.claude.com/docs/en/scheduled-tasks) for the full `/loop` reference.

---

## Path 3: OS-level scheduling

For cadences that need to fire whether or not Claude Code is open — or if you use Claude Code in the terminal rather than the Desktop app — use your OS's native scheduler to invoke `claude` headlessly.

Create the log directory first:

```bash
# macOS / Linux / WSL
mkdir -p ~/bettersense-logs

# Windows (PowerShell)
New-Item -ItemType Directory -Force "$HOME\bettersense-logs"
```

---

### macOS / Linux / WSL — cron

```bash
crontab -e
```

```bash
# Friday 4pm — wins nudge
0 16 * * 5  claude -p "run /bettersense:wins-due" >> ~/bettersense-logs/wins-due.log 2>&1

# Monday 9am — stakeholder due-list
0 9 * * 1  claude -p "run /bettersense:stakeholder-due" >> ~/bettersense-logs/stakeholder-due.log 2>&1

# First Monday of each month at 10am — self-reflection
# (cron can't express "first Monday" directly; use a wrapper script or accept approximate timing)
0 10 1-7 * 1  claude -p "run /bettersense:self-reflect" >> ~/bettersense-logs/self-reflect.log 2>&1

# Sunday 6pm — patterns watch
0 18 * * 0  claude -p "run /bettersense:patterns-watch" >> ~/bettersense-logs/patterns-watch.log 2>&1

# Monday 8am — product pulse
0 8 * * 1  claude -p "run /bettersense:product-pulse" >> ~/bettersense-logs/product-pulse.log 2>&1
```

If `claude` isn't found by cron, use the absolute path (`which claude` to find it).

---

### macOS — launchd (alternative to cron)

launchd survives sleep/wake cycles better than cron. Create a plist at `~/Library/LaunchAgents/ai.bettersense.wins-due.plist`:

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
  <key>RunAtLoad</key><false/>
</dict>
</plist>
```

Replace `/usr/local/bin/claude` with `which claude` output and `YOUR_USERNAME` with your macOS username. Load it:

```bash
launchctl load ~/Library/LaunchAgents/ai.bettersense.wins-due.plist
launchctl list | grep bettersense  # verify
```

Duplicate the file for each skill, changing `Label`, `ProgramArguments`, `StartCalendarInterval`, and `StandardOutPath`.

---

### Linux — systemd user timers

More observable than cron — check status, last run time, and logs.

`~/.config/systemd/user/bettersense-wins.service`:

```ini
[Unit]
Description=bettersense wins nudge

[Service]
Type=oneshot
ExecStart=/usr/local/bin/claude -p "run /bettersense:wins-due"
StandardOutput=append:%h/bettersense-logs/wins-due.log
StandardError=append:%h/bettersense-logs/wins-due.log
```

`~/.config/systemd/user/bettersense-wins.timer`:

```ini
[Unit]
Description=Run bettersense wins nudge every Friday

[Timer]
OnCalendar=Fri *-*-* 16:00:00
Persistent=true

[Install]
WantedBy=timers.target
```

```bash
systemctl --user daemon-reload
systemctl --user enable --now bettersense-wins.timer
systemctl --user list-timers  # verify
```

Use `%h` (expands to home directory) rather than `~` inside systemd unit files.

---

### Windows — Task Scheduler

```powershell
New-Item -ItemType Directory -Force "$HOME\bettersense-logs"

$action = New-ScheduledTaskAction `
    -Execute "claude" `
    -Argument "-p `"run /bettersense:wins-due`""

$trigger = New-ScheduledTaskTrigger `
    -Weekly -DaysOfWeek Friday -At "4:00PM"

$settings = New-ScheduledTaskSettingsSet `
    -StartWhenAvailable -RunOnlyIfNetworkAvailable

Register-ScheduledTask `
    -TaskName "bettersense-wins-due" `
    -Action $action -Trigger $trigger -Settings $settings `
    -Description "bettersense weekly wins nudge"
```

Repeat for each skill. Verify:

```powershell
Get-ScheduledTask | Where-Object { $_.TaskName -like 'bettersense*' }
```

For WSL users: use the Linux (cron or systemd) instructions above inside your WSL environment.

---

## Honest constraints

Regardless of scheduling approach:

- **Output lives in Claude Code or a log file.** No mobile push, no email, no SMS.
- **Tasks only fire while the app/terminal is running.** The Desktop app catches up missed runs on wake; OS-level schedulers do not.
- **Cadence reliability scales with how often you open Claude Code.** Daily users get the full benefit. Weekly users see things drift.

Pair each scheduled task with a calendar reminder in whatever system you actually check. The calendar grabs your attention; Claude Code does the work.
