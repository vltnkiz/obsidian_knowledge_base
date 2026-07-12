VAULT_DIR="/home/valentin/Desktop/knowledge_base/"
SSH_KEY="/home/valentin/.ssh/id_ed25519"

cd "$VAULT_DIR" || exit 1

# If there are no changes, do nothing
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  exit 0
fi

git add -A
git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M')" || true

if [ -f "$SSH_KEY" ]; then
  export GIT_SSH_COMMAND="ssh -i $SSH_KEY -o IdentitiesOnly=yes -o StrictHostKeyChecking=no"
fi

# Push the current branch (safe if you rename main)
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
git push origin "$BRANCH"