# ZSH Theme based upon "bira" in "oh-my-zsh".

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local open_hook='%{$fg[magenta]%}☷☳☱☵%{$reset_color%}'
local close_hook='%{$fg[magenta]%}☴☰☲☶%{$reset_color%}'
local key_exists='$(if [ -e ~/.ssh/id_rsa ]; then echo "%{$fg[green]%}☰";else echo "%{$fg[red]%}☷";fi)'

PROMPT="
${open_hook} ${current_dir} ${git_branch} ${key_exists}
${close_hook} %B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
