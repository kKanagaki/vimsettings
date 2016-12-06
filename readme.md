#新規で設定するときにやること
## .vimrcの設置
- _vimrcを.vimrcにリネーム
- ホームディレクトリに「.vimrc」設定する
- ホームディレクトリに「.gvimrc」作成する
 - colorscheme desert

## .bashrcの作成
```
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# macvim用に設定したが、他が調子悪かったら消してよいかも
# http://blog.amedama.jp/entry/2015/09/15/194322
alias xargs="gxargs"
```

## .bash_profileの編集
```
# historyの最大数
HISTSIZE=1000000

HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```

## vimプラグインのインストール
- git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
- 多分こっちは不要
 - git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## MacVimを起動
vim内で、PluginInstall だか BundleInstallコマンドを実行

