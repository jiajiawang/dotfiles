About
=====

This is my .vim folder.

Including
- [vimrc](https://github.com/jiajiawang/vimrc/blob/master/vimrc): my vim config file.
- [colors](https://github.com/jiajiawang/vimrc/blob/master/colors): my favorite color schemes.
- [mycoolsnippets](https://github.com/jiajiawang/vimrc/blob/master/mycoolsnippets): self-defined UltiSnips snippets.

How to use
======

1. Download it and replace your .vim folder.
2. Source the vimrc file by adding the following line into your own vimrc file ~/.vimrc (~/_vimrc if Windows):

  ```vim
  source ~/.vim/vimrc
  ```
3. Install [Vundle.vim](https://github.com/jiajiawang/vimrc/blob/master/vimrc/vundle.git):

  ```shell
  $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ```
4. Restart vim then run ```:PluginInstall```.
5. Some plugins require additional installation steps, please find it in [vimrc](https://github.com/jiajiawang/vimrc/blob/master/vimrc)
6. Enjoy it
