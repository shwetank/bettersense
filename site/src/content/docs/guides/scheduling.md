---
title: Scheduling routines
description: How to wire up bettersense skills to run on a cadence — using the /schedule skill or OS-level cron.
---

Claude Code skills are stateless — they fire when invoked, not automatically. Cadence requires an external scheduler. This guide covers both paths: the `/schedule` skill (inside Claude Code) and OS-level cron as a fallback.

## Honest constraints to set expectations

Before wiring up schedules, three things to know:

1. **Output lives inside Claude Code (or a log file).** No mobile push, no email, no SMS by default. Claude Code is desktop/CLI/IDE.
2. **If you close Claude Code on Friday and don't open it until Tuesday**, the Friday `wins-due` output sits unread.
3. **Cadence reliability scales with how often you open Claude Code.** Daily users get the full benefit. Weekly users see things drift.

**The fix:** pair every schedule with a calendar reminder in the system you *do* check. The calendar grabs your attention; Claude Code does the work.

---

## Path 1: The `/schedule` skill

`/schedule` is a separate Claude Code plugin — not built-in. Install it from Anthropic's marketplace if it's not already present:

```
/plugin marketplace add anthropic/schedule
```

Then set up the recurring skills you want. Run each command once in Claude Code:

### Weekly Friday — wins nudge

```
/schedule "Every Friday at 4pm, run /bettersense:wins-due and post the list"
```

Pair with a Friday 4pm calendar event: **"Open Claude Code → log this week's wins"**.

### Weekly Monday — stakeholder due-list

```
/schedule "Every Monday at 9am, run /bettersense:stakeholder-due and post the list"
```

Pair with a Monday 9am calendar block: **"Open Claude Code → review stakeholder due-list"**.

### Monthly — self-reflection

```
/schedule "On the first Monday of every month at 10am, run /bettersense:self-reflect"
```

Pair with a recurring monthly calendar event.

### Quarterly — team health diagnosis

```
/schedule "On the first Monday of every quarter at 10am, run /bettersense:team-diagnosis"
```

Run this *before* drafting the next quarter's plan — the diagnosis often surfaces what the plan should address.

### Quarterly — report growth plan reviews

```
/schedule "On the first Monday of every quarter at 11am, review growth plans for each report"
```

Less natural-language-flexible; adjust the phrasing for your team size.

### Weekly — product pulse (daily-ish for fast-moving products)

```
/schedule "Every weekday at 8am, run /bettersense:product-pulse for the default area"
```

For slower-moving products, weekly is fine:

```
/schedule "Every Monday at 8:30am, run /bettersense:product-pulse for the onboarding area"
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

## Path 2: OS-level scheduling fallback {#os-level-fallback}

If `/schedule` isn't available, use cron (macOS/Linux) or Task Scheduler (Windows) to invoke Claude Code headlessly.

### macOS / Linux (cron)

Edit your crontab:

```bash
crontab -e
```

Add entries like these:

```cron
# Friday 4pm — wins nudge
0 16 * * 5  claude -p "run /bettersense:wins-due and post the list" >> ~/bettersense-logs/wins-due.log 2>&1

# Monday 9am — stakeholder due-list
0 9 * * 1  claude -p "run /bettersense:stakeholder-due and post the list" >> ~/bettersense-logs/stakeholder-due.log 2>&1

# First of the month at 10am — self-reflection
0 10 1 * *  claude -p "run /bettersense:self-reflect" >> ~/bettersense-logs/self-reflect.log 2>&1
```

Create the log directory first:

```bash
mkdir -p ~/bettersense-logs
```

### macOS (launchd — more reliable than cron)

Create a plist at `~/Library/LaunchAgents/ai.bettersense.wins-due.plist`:

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
    <string>run /bettersense:wins-due and post the list</string>
  </array>
  <key>StartCalendarInterval</key>
  <dict>
    <key>Weekday</key>
    <integer>5</integer>
    <key>Hour</key>
    <integer>16</integer>
    <key>Minute</key>
    <integer>0</integer>
  </dict>
  <key>StandardOutPath</key>
  <string>/Users/YOUR_USERNAME/bettersense-logs/wins-due.log</string>
</dict>
</plist>
```

Load it:

```bash
launchctl load ~/Library/LaunchAgents/ai.bettersense.wins-due.plist
```

---

## Verify your schedules

List active schedules (if using the `/schedule` plugin):

```
/schedule list
```

Or check your crontab:

```bash
crontab -l
```

Test a skill manually before relying on the schedule:

```
/bettersense:wins-due
/bettersense:stakeholder-due
```
