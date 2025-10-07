```markdown
# Daily auto-commit workflow (keep GitHub green)

What this does
- A GitHub Actions workflow runs once per day and updates the file `activity/last-activity.txt` with the current UTC timestamp.
- When there is a change the workflow commits and pushes using a Personal Access Token (PAT) so the commit author is you — making contributions appear on your graph.

Files included
- .github/workflows/daily-commit.yml
- scripts/update_activity.sh

Required repository secrets
1. GITHUB_PAT — a Personal Access Token with repo (or appropriate) scope if you want the commits attributed to your account.
2. GIT_NAME — your display name (how you want the commit author to appear).
3. GIT_EMAIL — an email associated with your GitHub account (or your GitHub no-reply email) so the commit counts on your contributions.

Setup (quick)
Option A — create and push via the command line (git + gh)
1. Create the repo on GitHub (web UI) or with gh:
   - Web UI: Click New -> Repository, name it (example: daily-green-commits), choose Public/Private, Create repository.
   - gh CLI: gh repo create nurhikam/daily-green-commits --public --confirm
2. Locally:
   git clone https://github.com/nurhikam/daily-green-commits.git
   cd daily-green-commits
   mkdir -p .github/workflows scripts
   (create the files above inside those paths)
   chmod +x scripts/update_activity.sh
   git add .
   git commit -m "chore: add daily commit workflow"
   git push -u origin main

Option B — create files in the GitHub web UI
- Create repository, then use Add file -> Create new file for each file path above and paste the contents.

Add secrets
- In repo: Settings → Secrets and variables → Actions → New repository secret
  - Add GITHUB_PAT (the PAT you created)
  - Add GIT_NAME (your name)
  - Add GIT_EMAIL (your GitHub-associated email or username@users.noreply.github.com)

Test
- Go to Actions → Daily green commit → Run workflow (workflow_dispatch) to test immediately.
- Confirm a commit appears on the default branch and that activity/last-activity.txt shows the timestamp.

Notes & alternatives
- If you prefer not to use a PAT, you can modify the workflow to use GITHUB_TOKEN (commits will be authored by the github-actions bot and typically won’t show on your personal contributions graph). To do that, set persist-credentials: true in checkout and push with git push origin HEAD:$BRANCH.
- Make sure the email in GIT_EMAIL is associated with your GitHub account so commits count on your contributions graph.
```
