# Dotfiles

個人的な環境設定ファイルを管理するリポジトリです。

## 含まれるファイル

- `zshrc` - Zsh設定ファイル (.zshrc)
- `zshenv` - Zsh環境変数設定 (.zshenv)
- `gitconfig` - Git設定ファイル (.gitconfig)
- `p10k.zsh` - Powerlevel10kテーマ設定 (.p10k.zsh)

## セットアップ

### 1. リポジトリをクローン

```bash
git clone <repository-url> ~/dotfiles
cd ~/dotfiles
```

### 2. シンボリックリンクの作成

```bash
# 既存のファイルをバックアップ
mv ~/.zshrc ~/.zshrc.backup
mv ~/.zshenv ~/.zshenv.backup
mv ~/.gitconfig ~/.gitconfig.backup
mv ~/.p10k.zsh ~/.p10k.zsh.backup

# シンボリックリンクを作成
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zshenv ~/.zshenv
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/p10k.zsh ~/.p10k.zsh
```

### 3. 設定を再読み込み

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
- [Neovim](https://neovim.io/) - テキストエディタ

## インストールスクリプト

より簡単にセットアップするには、`install.sh` スクリプトを実行してください：

```bash
./install.sh
```

## 更新

設定ファイルを変更した場合は、以下のコマンドでリポジトリに反映してください：

```bash
cd ~/dotfiles
git add .
git commit -m "Update dotfiles"
git push
```
