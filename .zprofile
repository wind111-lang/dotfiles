# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh"
# Q pre block. Keep at the top of this file.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Q post block. Keep at the bottom of this file.

# Added by Toolbox App
export PATH="$PATH:/Users/shota.tsutsui/Library/Application Support/JetBrains/Toolbox/scripts"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh"
