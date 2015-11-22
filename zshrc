# Path to your oh-my-zsh installation.
export ZSH=/home/qxoo/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p%{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% ~ '

# prompt
function prompt_git_dirty() {
    gitstat=$(git status 2>/dev/null | grep '\(# Untracked\|# Changes\|# Changed but not updated:\)')
    
    if [[ $(echo ${gitstat} | grep -c "^# Changes to be committed:$") > 0 ]]; then
        echo -n $PR_LIGHT_YELLOW
    elif [[ $(echo ${gitstat} | grep -c "^\(# Untracked files:\|# Changed but not updated:\)$") > 0 ]]; then
        echo -n $PR_LIGHT_RED
    else
        echo -n $PR_LIGHT_MAGENTA
    fi
}

function prompt_current_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return 1
    echo ${ref#refs/heads/}
}

function prompt_hostname()
{
    case "`hostname`" in
        "Arch")
            echo -n "${PR_LIGHT_YELLOW}Arch${PR_NO_COLOR}";;    
    esac
}

function precmd() # Uses: setting user/root PROMPT1 variable and rehashing commands list
{
    # Last command status
    cmdstatus=$?
    sadface=`[ "$cmdstatus" != "0" ] && echo "${PR_RED}:(${PR_NO_COLOR} "`

    # Colours
    usercolour=`[ $UID != 0 ]   && echo $PR_BLUE      || echo $PR_RED`
    usercolour2=`[ $UID != 0 ]  && echo $WHITE || echo $PR_RED`
    dircolour=`[ -w "\`pwd\`" ] && echo $PR_YELLOW       || echo $PR_RED`

    # Git branch
    git="[branch: `prompt_git_dirty``prompt_current_branch`${blue}]"

#export PROMPT="
#${usercolour}┌─[${dircolour}%n${PR_NO_COLOR}«»`prompt_hostname`${usercolour}%{$fg_bold[red]%}]─────────────────────────${dircolour}[%~]${PR_NO_COLOR} `prompt_current_branch &>/dev/null && echo -n $git`
#${usercolour}└─${sadface}${usercolour}${dircolour}(%T)(%l)${usercolour}keep it simple ─╼ ${PR_NO_COLOR}$fg_bold[blue]"                          
#}
export PROMPT="
%{$fg_bold[red]%}┌─[${dircolour}%{$fg_bold[blue]%}%n${PR_NO_COLOR}«»`prompt_hostname`${usercolour}%{$fg_bold[red]%}]─────────────────────────${dircolour}[%{$fg_bold[green]%}%~%{$fg_bold[red]%}]${PR_NO_COLOR} `prompt_current_branch &>/dev/null && echo -n $git`
%{$fg_bold[red]%}└─${sadface}%{$fg_bold[yellow]%}${dircolour}(%T)(%l)%{$fg_bold[red]%} terminal ─╼ %{$fg_bold[blue]%}${PR_NO_COLOR}" 
}                  

# end prompt

alias ls='ls --color=auto'
alias ll='ls -al'
# vim
alias vi='vim'

# transport file
alias download='/home/qxoo/virtual_env/bin/python -m SimpleHTTPServer 9000'
alias upload='/home/qxoo/virtual_env/bin/python /home/qxoo/Upload/upload.py'
# conky sh
alias c_eth='/home/qxoo/.eth'
alias c_wifi='/home/qxoo/.wifi'
alias c_mytheme='/home/qxoo/.mytheme'
# fab deploy tool to virtual
alias fab='/home/qxoo/virtual_env/bin/fab'

# QT4 error
export QT_GRAPHICSSYSTEM=native

# set vim python

# 
alias emacs='source ~/virtual_env/bin/activate && emacs -nw'
#export WORKON_HOME=~/virtual_env
#source ~/virtual_env/bin/activate

# cscope
alias cscopeR="find . -name '*.py' > cscope.files && cscope -R"

# etags
alias etags="find . -name '*.py' | xargs etags"

# close system voice
#setterm --blength 0
xset -b

# virtual env
alias myenv="source ~/virtual_env/bin/activate"

# emacs /home/qxoo/Documents/schedule/sd.org
alias my_sd='emacs /home/qxoo/Documents/schedule/sd.org' 

# scapy
alias scapy='sudo /home/qxoo/virtual_env/bin/scapy'

# apg
alias apg='apg -M SNCL -m 8 -n 1'

# ssh 
alias ssh_aca1="ssh maiziedu@182.140.231.148"
alias ssh_aca2="ssh maiziedu@118.123.227.6"
alias ssh_aca3="ssh maiziedu@182.140.231.173"
alias ssh_sentry="ssh maiziedu@182.140.231.146"
alias ssh_mz='ssh -i ~/.ssh/id_rsa.mz'
alias ssh_ws='ssh -i ~/.ssh/id_rsa.ws'
