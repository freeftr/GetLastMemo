Save the current session as a markdown file in the session-memories directory.

## Steps

1. Create the `session-memories/` directory if it doesn't exist.

2. Generate a filename using the current date and time:
   ```
   Format: YYYY-MM-DD_HH-MM-SS.md
   Example: 2025-03-06_14-30-00.md
   ```
   Get the current time using `date '+%Y-%m-%d_%H-%M-%S'`.

3. If `session-memories/.config.json` exists, read the `retention_days` value and delete session files older than that period (excluding forever.md).
   If the config file doesn't exist, use a default of 10 days.

4. Write the session file using the template below. Fill it in based on what actually happened in this conversation:

```markdown
# Session Memory
**Date**: {today's date}
**Started**: {estimated session start time}
**Saved**: {current time}

---

## What was done
<!-- Actually completed tasks -->

## What to do next
<!-- Incomplete tasks, things to continue -->

## Important notes
<!-- Error fixes, key decisions, caveats -->

## Key context for next session
<!-- Context needed immediately in the next session: file paths, variable names, APIs, progress status, etc. -->
```

5. After saving, if `session-memories/forever.md` exists, display its contents as a reminder.

6. Show a completion message with the file path.
