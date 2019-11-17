dotfiles
========

```shell
# Set up dotfiles
git clone https://github.com/JamesBarwell/dotfiles.git /tmp/dotfiles
cp /tmp/dotfiles/.vimrc ~/
cp /tmp/dotfiles/.gitconfig ~/

# Set up bash
cat /tmp/dotfiles/bashrc-additions >> ~/.bashrc

# Set up vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
