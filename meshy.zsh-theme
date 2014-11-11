# ZSH Theme based upon "bira" in "oh-my-zsh".

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local open_hook='%{$fg[magenta]%}╭─%{$reset_color%}'
local close_hook='%{$fg[magenta]%}╰─%{$reset_color%}'

PROMPT="
${open_hook}${user_host} ${current_dir}  ${git_branch}
${close_hook}%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
