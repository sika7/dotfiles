# dotfiles
my config.

## 設定

### git config

```bash
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```

### tmux

```bash
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```


### fish

```bash
ln -s ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/.config/fish/fishfile ~/.config/fish/fishfile
ln -s ~/dotfiles/.config/fish/fish_plugins ~/.config/fish/fish_plugins
```


### nvim

```bash
ln -s ~/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -sn ~/dotfiles/.config/nvim/ftdetect/ ~/.config/nvim/ftdetect
ln -sn ~/dotfiles/.config/nvim/snippets/ ~/.config/nvim/snippets
```

## 削除

```bash
ls -l ~/.gitconfig
unlink ~/.gitconfig
```
