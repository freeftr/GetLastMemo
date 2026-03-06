Append the user's input to session-memories/forever.md. This file never expires and is referenced in every session.

## Input
`$ARGUMENTS` — content to remember permanently

## Steps

1. If `$ARGUMENTS` is empty, show the current contents of `forever.md` and say "Please provide content to remember. Example: `/remember-forever Always use TypeScript strict mode`"

2. If the `session-memories/` directory doesn't exist, say "No session history yet. Please run `/save-session` first." and stop.

3. If `session-memories/forever.md` doesn't exist, create it with this header:
   ```markdown
   # Permanent Notes
   > This file never expires. Referenced in every session.

   ---
   ```

4. Append the content with the current date/time:
   ```markdown
   ### Added {YYYY-MM-DD HH:MM}
   {$ARGUMENTS content}

   ```

5. Display the full contents of `forever.md` to confirm all accumulated entries.

6. End with "Added to permanent memory. This will be referenced in all future sessions."
