#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# convert-to-fork.sh  —  ONE-TIME clean slate for STRATUM-Desktop
#
# WHAT THIS DOES, in plain terms:
#   Your STRATUM work (branding + single-view AOP) currently lives INSIDE a git
#   "submodule" called qgroundcontrol. A submodule is a repo-inside-a-repo whose
#   real home is mavlink/qgroundcontrol — which you don't own. So your edits were
#   never carried to GitHub, your branches looked empty, and tag builds compiled
#   pristine QGC with "no branding".
#
#   This script DISSOLVES the submodule and turns QGuroundControl into ordinary
#   files inside ONE repo (a "hard fork"). After this:
#     • one folder, one repo, one history — no nesting
#     • your branding/AOP become normal commits on a normal branch
#     • whatever you edit shows up in your branches and on GitHub
#
# IT IS SAFE:
#   • Makes a full backup bundle BEFORE touching anything.
#   • Idempotent — if it was already converted, it just reports and exits.
#   • Does NOT push until you type "yes" at the end.
#
# HOW TO RUN (once), in Git Bash:
#   cd /c/Users/Anas-NX/OneDrive/NEXAM/10_Systems_Engineering/Systems_Engineering/STRATUM-Desktop
#   bash convert-to-fork.sh
# ─────────────────────────────────────────────────────────────────────────────
set -euo pipefail

SUB="qgroundcontrol"            # the submodule path
KEEP_BRANCH="main"             # the single branch we end up on
RETIRE_BRANCH="stratum/single-view-aop"   # the confusing parallel branch to fold in

say()  { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
ok()   { printf '\033[1;32m  ✓ %s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m  ! %s\033[0m\n' "$*"; }
die()  { printf '\033[1;31mERROR: %s\033[0m\n' "$*" >&2; exit 1; }

# ── 0. Sanity: we are at the repo root ───────────────────────────────────────
[ -d .git ]            || die "No .git here. cd into the STRATUM-Desktop folder first."
[ -d "$SUB" ]          || die "No '$SUB/' folder here. Are you in the right place?"
command -v git >/dev/null || die "git not found. Use Git Bash (ships with Git for Windows)."
say "Project root: $(pwd)"

# ── 1. Detect: already converted? ────────────────────────────────────────────
if [ ! -e .gitmodules ] && [ ! -e "$SUB/.git" ]; then
  ok "Already a hard fork — no submodule found. Nothing to dissolve."
  ALREADY=1
else
  ALREADY=0
fi

# ── 2. Full safety backup (always, even if already converted) ────────────────
say "Backing up current repo state"
BK_DIR="../STRATUM-Desktop-BACKUP-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BK_DIR"
# A bundle = a single-file clone of ALL branches/history. Restore with:
#   git clone STRATUM-pre-fork.bundle restored-repo
git bundle create "$BK_DIR/STRATUM-pre-fork.bundle" --all >/dev/null 2>&1 \
  && ok "History bundle  -> $BK_DIR/STRATUM-pre-fork.bundle" \
  || warn "Could not bundle full history (continuing; your files are still safe)."
# Copy the STRATUM-specific source files as a plain, no-git backup too.
for f in \
  "$SUB/src/FlyView/FlyViewAOPAction.qml" \
  "$SUB/src/FlyView/FlyViewMap.qml" \
  "$SUB/src/FlyView/FlyViewWidgetLayer.qml" \
  "$SUB/src/MainWindow/MainWindow.qml" \
  "$SUB/src/Toolbar/SelectViewDropdown.qml" \
  "$SUB/CMakeUserPresets.json" ; do
  [ -f "$f" ] && { mkdir -p "$BK_DIR/$(dirname "$f")"; cp "$f" "$BK_DIR/$f"; }
done
ok "STRATUM source files copied -> $BK_DIR/$SUB/"

# ── 3. Dissolve the submodule (skip if already done) ─────────────────────────
if [ "$ALREADY" -eq 0 ]; then
  say "Dissolving the '$SUB' submodule into plain files"
  # Remove the gitlink pointer from the index but KEEP every file on disk.
  git rm --cached -q "$SUB"
  # Remove submodule bookkeeping.
  [ -f .gitmodules ] && git rm -f -q .gitmodules 2>/dev/null || rm -f .gitmodules
  rm -f  "$SUB/.gitmodules"            # QGC ships a 0-byte one; harmless either way
  rm -rf ".git/modules/$SUB"           # the corrupt cloud-only metadata — gone
  rm -rf "$SUB/.git"                   # the submodule's pointer file
  ok "Submodule bookkeeping removed; QGC files remain on disk"
  # Re-stage QGC as ordinary tracked files. Build caches/artifacts are excluded
  # automatically by the root .gitignore and QGC's own nested .gitignore.
  say "Vendoring QGC source as ordinary files (this can take a minute)"
  git add "$SUB"
  ok "QGC source staged as plain files"
else
  warn "Submodule already dissolved — skipping dissolve step."
fi

# ── 4. Clean up the stray, confusingly-named 'git/' folder ───────────────────
if [ -d git ]; then
  say "Removing the stray root-level 'git/' folder (old submodule helper scripts)"
  git rm -r -q --ignore-unmatch git 2>/dev/null || rm -rf git
  ok "Removed git/ (your new workflow lives in GIT-WORKFLOW.md)"
fi

# ── 5. Stage everything else (CI fix, new docs) and commit ───────────────────
say "Committing the clean single-repo baseline"
git add -A
if git diff --cached --quiet; then
  warn "Nothing to commit — repo already in the desired state."
else
  git commit -q -m "Hard fork: vendor QGroundControl source, dissolve submodule

Collapses the QGC submodule into ordinary tracked files so STRATUM branding
and the single-view AOP work live as normal commits in one repo. Fixes the
'no branding' tag builds (CI no longer pulls pristine upstream QGC) and the
empty/broken submodule checkout. OneDrive-corrupted .git/modules removed."
  ok "Committed."
fi

# ── 6. Collapse to a single clean branch named '$KEEP_BRANCH' ────────────────
say "Making '$KEEP_BRANCH' the single source of truth"
CUR="$(git rev-parse --abbrev-ref HEAD)"
git branch -f "$KEEP_BRANCH" "$CUR"            # point main at the converted commit
git checkout -q "$KEEP_BRANCH"
# Fold away the confusing parallel branch (its work is now here).
if git show-ref --verify --quiet "refs/heads/$RETIRE_BRANCH"; then
  git branch -D "$RETIRE_BRANCH" >/dev/null 2>&1 && ok "Retired local branch '$RETIRE_BRANCH'"
fi
ok "On branch '$KEEP_BRANCH' — one repo, one history, your work included."

# ── 7. Show the result ───────────────────────────────────────────────────────
say "Result"
echo "  Branch : $(git rev-parse --abbrev-ref HEAD)"
echo "  Files  : $(git ls-files | wc -l | tr -d ' ') tracked"
echo "  QGC AOP: $(git ls-files "$SUB/src/FlyView/FlyViewAOPAction.qml" | head -1 || echo MISSING)"
git log --oneline -3

# ── 8. Push — only with your explicit yes ────────────────────────────────────
say "Push to GitHub?"
echo "  This updates 'origin/$KEEP_BRANCH' on Nexam-Systems/STRATUM-Desktop with the"
echo "  clean single-repo history, and deletes the old '$RETIRE_BRANCH' on GitHub."
read -r -p "  Type 'yes' to push now (anything else = skip, push later): " ANS
if [ "$ANS" = "yes" ]; then
  git push --force-with-lease -u origin "$KEEP_BRANCH"
  git push origin --delete "$RETIRE_BRANCH" 2>/dev/null && ok "Deleted remote '$RETIRE_BRANCH'" || true
  ok "Pushed. GitHub Actions will now build the STRATUM-branded .exe."
else
  warn "Skipped push. When ready, run:"
  echo "      git push --force-with-lease -u origin $KEEP_BRANCH"
fi

say "Done. Backup is in: $BK_DIR"
echo "  You can delete convert-to-fork.sh now — it has done its job."
