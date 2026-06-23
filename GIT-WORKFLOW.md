# STRATUM-Desktop — How the repo works now

This replaces the old `git/` helper folder. Read it once; it is short.

## The mental model

One folder. One repository. One history. **There is no submodule anymore.**
The entire QGroundControl source lives inside this repo as ordinary files, with
your STRATUM branding and single-view AOP changes sitting right alongside it as
normal commits. Whatever you edit is what gets committed, pushed, and built.

That is the whole point of the hard fork: the thing that used to silently throw
your work away — the `qgroundcontrol` submodule, whose real home was upstream
`mavlink/qgroundcontrol` — is gone.

## Daily work (the only loop you need)

You are always on the `main` branch unless you deliberately make another one.

```bash
# 1. edit files in your editor (e.g. qgroundcontrol/src/FlyView/...)

# 2. see what changed
git status

# 3. save your work into history
git add -A
git commit -m "Short description of what you changed"

# 4. send it to GitHub (also triggers a cloud build — see below)
git push
```

That is 99% of your git life. Edit, commit, push.

## When to make a branch

Only when you want to try something risky without disturbing `main`:

```bash
git checkout -b try-new-toolbar     # start an experiment
# ...edit, commit...
git push -u origin try-new-toolbar  # cloud-build it in isolation
```

If you like it: `git checkout main && git merge try-new-toolbar`.
If you don't: `git checkout main && git branch -D try-new-toolbar`. No harm done.

For most of your work you do **not** need branches at all. Commit to `main`.

## CI/CD — what it actually does (you don't build locally)

"CI/CD" here just means: **GitHub builds the Windows `.exe` for you in the cloud
every time you push.** You don't need MSVC, Qt, or Ninja installed to get a build.

There are two automated workflows in `.github/workflows/`:

- **`ci-build.yml`** — runs on *every push*. It proves your code still compiles.
  Green check = it builds. Red X = something is broken. Find the result under the
  repo's **Actions** tab on GitHub; the compiled `.exe` is attached at the bottom
  of the run as a downloadable **artifact** (kept 7 days).

- **`build-on-tag.yml`** — runs when you publish a version tag like `v0.2.0`. It
  builds a release `.exe` and attaches it to the GitHub **Release** for that tag
  (kept 14 days). This is how you cut a shareable version.

To cut a release without touching the command line, use GitHub's web UI:
**Releases → Draft a new release → choose a tag like `v0.2.0` → Publish.**
The build starts automatically; the `.exe` appears on the release page when done.

Both workflows now check out the vendored files with `submodules: false`. That is
deliberate — it is the fix that stopped tag builds from compiling pristine,
unbranded QGC.

## One caution about OneDrive

Git and a live file-syncer both think they own the hidden `.git` folder, and they
corrupt each other — that was the original source of your `.git/modules` errors.
You have paused OneDrive, which removes the immediate danger. The durable fix,
when you have a quiet moment, is to move this folder onto plain local disk
(e.g. `C:\dev\STRATUM-Desktop`) and let **GitHub**, not OneDrive, be your backup.
Nothing in your daily workflow changes if you do.
