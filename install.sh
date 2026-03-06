#!/bin/bash
# session-memory-for-claude installer
# Installs slash commands globally to ~/.claude/commands/
# session-memories/ is created per-project at runtime

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.claude/commands"

echo "Installing session-memory-for-claude globally..."

mkdir -p "$TARGET_DIR"
cp "$SCRIPT_DIR/.claude/commands/"*.md "$TARGET_DIR/"

echo ""
echo "Done! Installed to: $TARGET_DIR"
echo ""
echo "Slash commands are now available in every project."
echo "session-memories/ will be created per-project when you first run /save-session."
echo ""
echo "Commands:"
echo "  /save-session          - Save current session"
echo "  /remind-last-session   - Load last session"
echo "  /remind-custom [name]  - Load specific session"
echo "  /remember-forever [msg]- Save permanent memory"
echo "  /session-config [days] - Set retention period"
