# Add to .bashrc:
# if [ -f ~/.config/.bash_config ]; then source ~/.config/.bash_config fi

# Links from WSL to Windows
CDPATH=~/.paths

export PATH="$PATH:~/ngc-cli"
export PATH="$HOME/.local/nvim-linux-x86_64/bin:$PATH"

# >>>>> Helper Functions >>>>>
rl() {
    source ~/.bashrc
    echo ".bashrc has been refreshed."
}
map() {
    local alias_name="$1"
    shift
    local cmd="$*"
    alias "$alias_name"="$cmd"
}
# <<<<< Helper Functions <<<<<

# >>>>> Aliases >>>>>
map cdh "cd ~"
map cdr "cd ~/repos"
map cdc "cd ~/.config"
map cdn "cd ~/.config/nvim"

map ga   "git add"
map gaa  "git add ."
map gc   "git commit -m"
map gp   "git pull"                # Pull changes from remote branch, i.e. `feature_branch` pulls from `origin/feature_branch`
map gpm  "git pull origin main"    # Pull changes from remote main
map gP   "git push"
map gPn  "git push -u origin HEAD" # Publish new branch using same name as locally
map gch  "git checkout"
map gchm "git checkout main"
map gchn "git checkout -b"         # Pass in name of the new branch as argument
map gf   "git fetch"
map gm   "git merge"
map gs   "git status"
map gd   "git diff"
map gb   "git branch"
map grf  "git checkout HEAD~1 --"  # {file}, Revert committed changes to file
map grs  "git restore --staged"    # {file}, Unstage specified file, keep changes
map grc  "git revert HEAD"         # Revert latest commit
map grP  "git revert HEAD"         # Revert latest push
map gr   "git restore"             # {file}, Restore file to last committed state (Discard local file changes)

gRc() {
    # Discard all local changes (only unstaged and untracked)
    git reset --hard
    git clean -fd
}
gRb() {
    # Restore state of local branch to remote
    git fetch origin
    git reset --hard
}
# <<<<< Aliases <<<<<

# >>>>> benlubas/venv_wrapper >>>>>
# Usage
# $ mkvenv myvirtualenv # creates venv under ~/.virtualenvs/
# $ venv myvirtualenv   # activates venv
# $ deactivate          # deactivates venv
# $ rmvenv myvirtualenv # removes venv
export VENV_HOME="$HOME/.virtualenvs"
[[ -d $VENV_HOME ]] || mkdir $VENV_HOME

lsvenv() {
  ls -1 $VENV_HOME
}

venv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      source "$VENV_HOME/$1/bin/activate"
  fi
}

mkvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      python3 -m venv $VENV_HOME/$1
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      rm -r $VENV_HOME/$1
  fi
}
# <<<<< benlubas/venv_wrapper <<<<<
