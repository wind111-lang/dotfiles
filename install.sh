#!/bin/bash

# dotfilesのインストールスクリプト

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "=== Dotfiles インストール開始 ==="

# バックアップディレクトリの作成
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "バックアップディレクトリを作成: $BACKUP_DIR"
fi

# シンボリックリンクを作成する関数
create_symlink() {
    local source="$1"
    local target="$2"

    # 既存のファイルまたはシンボリックリンクが存在する場合
    if [ -e "$target" ] || [ -L "$target" ]; then
        # 既にシンボリックリンクで同じ場所を指している場合はスキップ
        if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
            echo "スキップ: $target (既にシンボリックリンクが存在)"
            return
        fi

        # バックアップを作成
        echo "バックアップ: $target -> $BACKUP_DIR/$(basename "$target")"
        mv "$target" "$BACKUP_DIR/$(basename "$target")"
    fi

    # シンボリックリンクを作成
    echo "シンボリックリンク作成: $target -> $source"
    ln -s "$source" "$target"
}

# dotfilesディレクトリの確認
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "エラー: $DOTFILES_DIR が見つかりません"
    exit 1
fi

# 各ファイルのシンボリックリンクを作成
echo ""
echo "シンボリックリンクを作成中..."

# シェル設定
if [ -f "$DOTFILES_DIR/.zshrc" ]; then
    create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
fi

if [ -f "$DOTFILES_DIR/.zshenv" ]; then
    create_symlink "$DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
fi

if [ -f "$DOTFILES_DIR/.zprofile" ]; then
    create_symlink "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
fi

if [ -f "$DOTFILES_DIR/.p10k.zsh" ]; then
    create_symlink "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
fi

# Git設定
if [ -f "$DOTFILES_DIR/.gitconfig" ]; then
    create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
fi

# ターミナル/エディタ設定
if [ -d "$DOTFILES_DIR/.config" ]; then
    create_symlink "$DOTFILES_DIR/.config" "$HOME/.config"
fi

# ツール設定
if [ -d "$DOTFILES_DIR/.claude" ]; then
    create_symlink "$DOTFILES_DIR/.claude" "$HOME/.claude"
fi

if [ -f "$DOTFILES_DIR/.claude.json" ]; then
    create_symlink "$DOTFILES_DIR/.claude.json" "$HOME/.claude.json"
fi

if [ -d "$DOTFILES_DIR/.codex" ]; then
    create_symlink "$DOTFILES_DIR/.codex" "$HOME/.codex"
fi

if [ -d "$DOTFILES_DIR/.serena" ]; then
    create_symlink "$DOTFILES_DIR/.serena" "$HOME/.serena"
fi

if [ -d "$DOTFILES_DIR/.vscode" ]; then
    create_symlink "$DOTFILES_DIR/.vscode" "$HOME/.vscode"
fi

echo ""
echo "=== インストール完了 ==="
echo ""
echo "バックアップは以下に保存されています: $BACKUP_DIR"
echo ""
echo "設定を反映するには以下のコマンドを実行してください:"
echo "  source ~/.zshrc"
