ln -vsf "`pwd`/.bash_profile" $HOME/
ln -vsf "`pwd`/.bashrc" $HOME/
ln -vsf "`pwd`/.gitconfig" $HOME/
ln -vsf "`pwd`/.gitignore" $HOME/
ln -vsf "`pwd`/.inputrc" $HOME/
ln -vsf "`pwd`/.pythonrc.py" $HOME/
ln -vsf "`pwd`/.screenrc" $HOME/
ln -vsf "`pwd`/.vim" $HOME/
ln -vsf "`pwd`/.vimrc" $HOME/
#ln -vsf "`pwd`/.conkyrc" $HOME/
#ln -vsf "`pwd`/i3config" $HOME/.config/i3/config
if hash startx 2>/dev/null; then
    ln -vsf "`pwd`/user" $HOME/.config/dconf
fi
