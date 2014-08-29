# Opens the github page for the current git repository in your browser
#
#  - use the -b parameter to go to a github branch
#
function gh() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     return;
  fi

  giturl=${giturl/://}
  giturl=${giturl/git\@/https://}

  if [ "$1" != "-b" ]
    then
     open $giturl &
     return;
  fi

  giturl=${giturl/\.git/\/tree/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl$branch
  open $giturl &
}

echo " function: gh - opens a git repository in the browser"
