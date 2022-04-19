# stty -ixon
set -x PATH ~/go/bin $PATH
set -x PATH /usr/local/luarocks/bin $PATH
set -x PATH /usr/local/texlive/2021/bin/x86_64-linux $PATH

set -x PATH ~/.cargo/bin $PATH
set -x PATH /home/LunarVim/.fnm $PATH
set -x PATH ~/.local/bin $PATH

alias vi lvim
alias v lvim
alias rm trash-put
# shopt -s direxpand
set de /mnt/c/Users/12197/Desktop
set do /mnt/c/Users/12197/Downloads
alias ctp 'cd ~/temp_try'
alias cvh 'cd ~/.local/share/lunarvim/lvim'
alias cvv 'cd ~/.local/share/lunarvim/lvim/lua/lvim'
alias cbg 'cd ~/myBlog'
alias cpp 'cd ~/mypaper/JIFS-OACNN'
alias csn 'cd ~/.vim_runtime/my_plugins_forked/vim-snippets/UltiSnips'
alias vvp 'vi ~/.local/share/lunarvim/lvim/utils/installer/config.example.lua'
alias vvpl 'vi ~/.local/share/lunarvim/lvim/lua/lvim/plugins.lua'
# alias vvi 'vi ~/.vim_runtime/install_awesome_vimrc.sh'
alias vfc 'vi ~/.local/share/lunarvim/lvim/config.fish'
alias cltp 'rm ~/temp_try/*'
alias wda 'fish ~/myDiary/create_diary.fish'
alias cda 'cd ~/myDiary'
alias tnw 'tmux new-window -n'
alias bk '~/.vim_runtime/fish_scripts/backup_files.fish'
alias gp 'grep -n -H -R'

set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"
# bind -M insert \ek 'set fish_bind_mode default'
# set -gx Z_SCRIPT_PATH ~/z/z.sh
