# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
# Amazon Q pre block. Keep at the top of this file.
## Amazon Q pre block. Keep at the top of this file.


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'0'; zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PHPENV_ROOT="/Users/shota.tsutsui/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi

eval "$(rbenv init -)"

# bun completions
[ -s "/Users/shota.tsutsui/.bun/_bun" ] && source "/Users/shota.tsutsui/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias vi='nvim'
alias vim='nvim'
alias ol-dev='sh $HOME/ol.sh OneLogin_prtimes_Developer'
alias ol-poweruser='sh $HOME/ol.sh OneLogin_prtimes_PowerUser'
alias ol-test='op item get onelogin-tsutsui --otp | onelogin-aws-assume-role -c ~/awskey --profile default --onelogin-password `op read "op://Private/onelogin-tsutsui/password"` --aws-role-name "OneLogin_prtimes-test_PowerUser" --aws-account-id 131334648224'
alias git="LC_ALL=ko_KR.UTF-8 git"

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH=$HOME/.progate/bin:$PATH


#export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shota.tsutsui/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shota.tsutsui/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shota.tsutsui/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shota.tsutsui/google-cloud-sdk/completion.zsh.inc'; fi

# Amazon Q post block. Keep at the bottom of this file.
#export PATH="/opt/homebrew/opt/git/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/shota.tsutsui/.lmstudio/bin"

# pnpm
export PNPM_HOME="/Users/shota.tsutsui/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"
export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/shota.tsutsui/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
