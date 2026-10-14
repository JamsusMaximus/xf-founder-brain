#!/bin/sh
# Claude Code reads .claude/skills; Codex reads .agents/skills. Edit .claude/skills, then run this.
cd "$(dirname "$0")/.." || exit 1
rm -rf .agents/skills && mkdir -p .agents && cp -R .claude/skills .agents/skills
echo "Synced .claude/skills to .agents/skills"
