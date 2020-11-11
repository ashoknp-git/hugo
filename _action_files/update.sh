if [[ $(git status --porcelain --untracked-files=no) ]]
then
  git config --global user.email "github-actions[bot]@users.noreply.github.com"
  git config --global user.name "github-actions[bot]"

  git fetch && git rebase --autostash
  git add -A
  git commit -m "[Bot] Update from upstream" --allow-empty
  git push -f
fi
