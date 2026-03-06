Load and display a specific session file.

## Input
`$ARGUMENTS` — filename to load (e.g., `2025-03-06_14-30-00` or `2025-03-06_14-30-00.md`)

## Steps

1. If `$ARGUMENTS` is empty, show the list of available sessions:
   ```bash
   ls session-memories/*.md 2>/dev/null | grep -v forever.md | sort -r
   ```
   Then say "Please provide a filename. Example: `/remind-custom 2025-03-06_14-30-00`"

2. If `$ARGUMENTS` doesn't have the `.md` extension, append it:
   `session-memories/{filename}.md`

3. Check if the file exists.
   If not, say "File not found: {filename}" and list the available session files.

4. Read and display the full contents of the file.

5. If `session-memories/forever.md` exists, display it after a separator:
   ```
   ---
   ## Permanent Notes (forever.md)
   {forever.md contents}
   ```

6. End with "Session '{filename}' loaded."
