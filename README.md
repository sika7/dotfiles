# dotfiles
my config.

## 設定

### git config

```bash
ln -s ~/dotfiles/host/.gitconfig ~/.gitconfig
```

### tmux

```bash
ln -s ~/dotfiles/host/.tmux.conf ~/.tmux.conf
```


### fish

```bash
ln -s ~/dotfiles/host/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/host/.config/fish/fishfile ~/.config/fish/fishfile
ln -s ~/dotfiles/host/.config/fish/fish_plugins ~/.config/fish/fish_plugins
```


### nvim

```bash
ln -s ~/dotfiles/host/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/host/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ~/dotfiles/host/.config/nvim/ftdetect/pug.vim ~/.config/nvim/ftdetect/pug.vim
ln -s ~/dotfiles/host/.config/nvim/ftdetect/stylus.vim ~/.config/nvim/ftdetect/stylus.vim
ln -s ~/dotfiles/host/.config/nvim/ftdetect/ts.vim ~/.config/nvim/ftdetect/ts.vim
ln -s ~/dotfiles/host/.config/nvim/ftdetect/vue.vim ~/.config/nvim/ftdetect/vue.vim
ln -s ~/dotfiles/host/.config/nvim/snippets/php.snip ~/.config/nvim/snippets/php.snip
```

## 削除

```bash
ls -l ~/.gitconfig
```
