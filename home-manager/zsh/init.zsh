bindkey -e

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line

# ghq + fzf
function fzf-src() {
  local selected_dir=$(ghq list -p | fzf --ansi --preview 'bat --color=always --style plain {}/README.md' --preview-window down)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-src
bindkey '^]' fzf-src

# checkout pr branch
function checkout-pull-request() {
    GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 4 | awk '{print $1}' | xargs gh pr checkout
}
function prr() {
    local pr_number=$(GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 4 | awk '{print $1}' | tr -d '#')
    [[ -z "$pr_number" ]] && return
    local branch=$(gh pr view $pr_number --json headRefName -q .headRefName)
    git fetch origin $branch
    if git worktree list | grep -q "\\[$branch\\]"; then
        git wt -D $branch
    fi
    git branch --track $branch origin/$branch
    git wt $branch
}
function prre() {
    local branch=$(git branch --show-current)
    git wt -D $branch
}

function cd-worktree() {
    cd $(git-wt | fzf | awk '{print $1}')
}
zle -N cd-worktree
bindkey '^''' cd-worktree

# list issues
function list-issues() {
    GH_FORCE_TTY=100% gh issue list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh issue view {1}' --header-lines 3
}

# ignore: add patterns to .git/info/exclude
function ignore() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: ignore <pattern> [pattern ...]" >&2
    echo "       ignore -l" >&2
    return 1
  fi
  if [[ ! -d .git ]]; then
    echo "Error: .git directory not found" >&2
    return 1
  fi
  if [[ "$1" == "-l" || "$1" == "--list" ]]; then
    cat .git/info/exclude 2>/dev/null
    return
  fi
  mkdir -p .git/info
  for pattern in "$@"; do
    echo "$pattern" >> .git/info/exclude
    echo "Added: $pattern"
  done
}

# uuid
function uuid() {
    python -c "import uuid; print(uuid.uuid4(), end='')" | tee /dev/tty | pbcopy
}

# select & print aws profile name
function spro() {
    aws configure list-profiles | grep -v "^profile " | fzf --ansi | tr -d '\n'
}
# select & copy aws profile name
function cpro() {
    spro | pbcopy
}

eval "$(git wt --init zsh)"
