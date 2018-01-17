local ret_status="%(?:%{$fg_bold[yellow]%}λ :%{$fg_bold[yellow]%}λ )"

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT='%{$fg[magenta]%} %* %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info) %{$ret_status%} %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
