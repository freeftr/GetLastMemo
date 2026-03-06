# GetLastMemo for Claude Code

> Save and restore Claude Code session memory across conversations using slash commands

When using Claude Code in the CLI, your context is lost when the session ends.
This tool **saves your session progress, TODOs, and key context as markdown** so you can pick up right where you left off.

---

## Features

| Command | Description |
|---------|-------------|
| `/save-session` | Save the current session as a markdown file |
| `/remind-last-session` | Load the most recent session memory |
| `/remind-custom [filename]` | Load a specific session file |
| `/remember-forever [content]` | Save permanent notes referenced in every session |
| `/session-config [days]` | Configure session retention period |

---

## Installation

Install once, use in **every project**.

```bash
git clone https://github.com/freeftr/GetLastMemo.git
cd GetLastMemo
./install.sh
```

This copies the command files to `~/.claude/commands/`.

### Manual install

```bash
mkdir -p ~/.claude/commands
cp .claude/commands/*.md ~/.claude/commands/
```

---

## Directory Structure

```
~/.claude/commands/                  <- Global install (one-time)
  save-session.md
  remind-last-session.md
  remind-custom.md
  remember-forever.md
  session-config.md

{each project}/session-memories/     <- Per-project, auto-created
  .config.json                       <- Retention period config
  forever.md                         <- Permanent notes
  2025-03-06_14-30-00.md             <- Session files
  ...
```

`session-memories/` is automatically created when you first run `/save-session`.

---

## Usage

### Starting a session
```
/remind-last-session
```
> Instantly recall what you did last time and what's next

### Ending a session
```
/save-session
```
> Claude summarizes the session and saves it as `session-memories/2025-03-06_18-00-00.md`

### Loading a specific session
```
/remind-custom 2025-03-01_10-00-00
```

### Saving permanent notes
```
/remember-forever Always use Node.js 22 LTS. pnpm required.
```
> Appended to `forever.md`. Always displayed with `/save-session` and `/remind-last-session`

### Changing retention period
```
/session-config 30
```
> Keep the last 30 days of sessions (default: 10 days)

---

## Session File Format

```markdown
# Session Memory
**Date**: 2025-03-06
**Saved**: 18:00:00

---

## What was done
- Implemented user auth API endpoints
- Fixed JWT token validation bug

## What to do next
- Implement email verification flow
- Write tests (auth.test.ts)

## Important notes
- DB_HOST env var is managed in .env.local
- Users table migration not yet applied

## Key context for next session
- Working file: src/api/auth/login.ts
- Current branch: feature/user-auth
- Stuck on: refresh token rotation logic
```

---

## Configuration

`session-memories/.config.json`:

```json
{
  "retention_days": 10,
  "updated_at": "2025-03-06"
}
```

- `retention_days`: How long to keep session files (days). Change with `/session-config`
- Expired sessions are auto-deleted when `/save-session` runs

---

## Retention Policy

- Session files older than `retention_days` are automatically deleted
- `forever.md` is excluded from auto-deletion
- You can freely delete any files manually

---

## Tips

- **Start routine**: Always begin with `/remind-last-session` when opening Claude Code
- **End routine**: Run `/save-session` before wrapping up
- **Team projects**: Add `session-memories/` to `.gitignore` to keep memories local
- **Per-project config**: Each project can have its own `retention_days` setting

---

## Contributing

PRs and issues are welcome!

---

## License

MIT
