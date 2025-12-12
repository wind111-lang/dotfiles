# Dotfiles

個人的な環境設定ファイルを管理するリポジトリです。

## 含まれるファイル

### シェル設定
- `.zshrc` - Zsh設定ファイル
- `.zshenv` - Zsh環境変数設定
- `.zprofile` - Zshプロファイル設定
- `.p10k.zsh` - Powerlevel10kテーマ設定

### Git設定
- `.gitconfig` - Git設定ファイル

### ツール設定
- `.claude/` - Claude Code設定
  - `settings.json.example` - Claude Code設定テンプレート（要コピー）
- `.claude.json` - Claude CLI設定
- `.codex/` - Codex設定
  - `config.toml` - Codex設定ファイル
- `.serena/` - Serena設定
  - `serena_config.yml` - Serena設定ファイル
- `.vscode/` - VSCode設定
  - `argv.json` - VSCode起動オプション

**注意**: `.claude/settings.json`は機密情報（APIキー）を含むため、リポジトリには含まれていません。テンプレートから作成してください。

### IDE設定
- `phpstorm/` - PhpStorm設定
  - `com.jetbrains.PhpStorm.plist` - PhpStorm Preferences

## セットアップ

### 1. リポジトリをクローン

```bash
git clone <repository-url> ~/dotfiles
cd ~/dotfiles
```

### 2. インストールスクリプトを実行

より簡単にセットアップするには、`install.sh` スクリプトを実行してください：

```bash
./install.sh
```

または手動でシンボリックリンクを作成：

```bash
# シェル設定
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh

# Git設定
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# ツール設定
ln -s ~/dotfiles/.claude ~/.claude
ln -s ~/dotfiles/.claude.json ~/.claude.json
ln -s ~/dotfiles/.codex ~/.codex
ln -s ~/dotfiles/.serena ~/.serena
ln -s ~/dotfiles/.vscode ~/.vscode
```

### 3. Claude設定ファイルのセットアップ

Claude Codeを使用する場合は、APIキーを設定する必要があります：

```bash
# テンプレートをコピー
cp ~/dotfiles/.claude/settings.json.example ~/.claude/settings.json

# エディタで開いてAPIキーを設定
vim ~/.claude/settings.json
# または
code ~/.claude/settings.json
```

### 4. 設定を再読み込み

```bash
source ~/.zshrc
```

## 依存関係

これらの設定ファイルは以下のツールを使用しています：

- [Zinit](https://github.com/zdharma-continuum/zinit) - Zshプラグインマネージャー
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Zshテーマ
- [pyenv](https://github.com/pyenv/pyenv) - Python環境管理
- [rbenv](https://github.com/rbenv/rbenv) - Ruby環境管理
- [phpenv](https://github.com/phpenv/phpenv) - PHP環境管理
- [Bun](https://bun.sh/) - JavaScriptランタイム
- [Claude Code](https://claude.com/claude-code) - AI開発ツール
- [VSCode](https://code.visualstudio.com/) - コードエディタ
- [PhpStorm](https://www.jetbrains.com/phpstorm/) - PHP IDE

## 更新

設定ファイルを変更した場合は、以下のコマンドでリポジトリに反映してください：

```bash
cd ~/dotfiles
git add .
git commit -m "Update dotfiles"
git push
```
