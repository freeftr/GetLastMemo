Load and display the most recent session file from the session-memories directory.

## Steps

1. Check if the `session-memories/` directory exists.
   If not, say "No saved sessions yet. Use /save-session to save your current session."

2. Find the most recent file in `session-memories/` (excluding `forever.md`) with the `YYYY-MM-DD_HH-MM-SS.md` filename format:
   ```bash
   ls session-memories/*.md 2>/dev/null | grep -v forever.md | sort | tail -1
   ```

3. If no files are found, say "No session records found."

4. Read and display the full contents of the file.

5. If `session-memories/forever.md` exists, display it after a separator:
   ```
   ---
   ## Permanent Notes (forever.md)
   {forever.md contents}
   ```

6. End with "Previous session loaded. Let's continue where we left off!"
