#!/bin/bash

VAULT_DIR="/home/valentin/Desktop/knowledge_base/"

cd "$VAULT_DIR" || exit 1

# If there are no changes, do nothing
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  exit 0
fi

git add .
git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M')"
git push origin main
