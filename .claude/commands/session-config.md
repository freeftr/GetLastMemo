Configure the session memory retention period.

## Input
`$ARGUMENTS` — number of days to retain (e.g., `30`)

## Steps

1. If `$ARGUMENTS` is empty or not a number, show the current setting:
   - If `session-memories/.config.json` exists, read and display the current `retention_days` value
   - If not, show "Current default: 10 days"
   - Say "To change, use `/session-config 30`"

2. If a number is provided, verify it's 1 or greater. If 0 or less, say "Please set at least 1 day."

3. If the `session-memories/` directory doesn't exist, say "No session history yet. Please run `/save-session` first." and stop.

4. Save `session-memories/.config.json` in this format:
   ```json
   {
     "retention_days": {number},
     "updated_at": "{current date YYYY-MM-DD}"
   }
   ```

5. Clean up expired session files based on the new setting:
   - Exclude `forever.md` and `.config.json`
   - Delete files older than `retention_days` from today
   - List any deleted files

6. End with "Retention period set to {N} days."
