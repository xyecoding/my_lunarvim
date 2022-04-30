# stty -ixon
set -x PATH ~/go/bin $PATH
set -x PATH /usr/local/luarocks/bin $PATH
set -x PATH /usr/local/texlive/2021/bin/x86_64-linux $PATH

set -x PATH ~/.cargo/bin $PATH
set -x PATH ~/.fnm $PATH
set -x PATH ~/.local/bin $PATH
set -x PATH ~/.local/share/nvim/lsp_servers/zeta_note  $PATH
set -x PATH ~/.local/share/nvim/lsp_servers/latex/ $PATH
set -x PATH ~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin $PATH

alias vi lvim
alias v lvim
alias rm trash-put
# shopt -s direxpand
set de /mnt/c/Users/12197/Desktop
set do /mnt/c/Users/12197/Downloads
alias ctp 'cd ~/temp_try'
alias cvh 'cd ~/.local/share/lunarvim/lvim'
alias csn 'cd ~/.local/share/lunarvim/lvim/lua/lvim/my_config/snippets/vscode/snippets'
alias cvv 'cd ~/.local/share/lunarvim/lvim/lua/lvim'
alias cbg 'cd ~/myBlog'
alias cpp 'cd ~/mypaper/JIFS-OACNN'


alias vvc 'vi ~/.config/lvim/config.lua'
alias vvp 'vi ~/.local/share/lunarvim/lvim/lua/lvim/plugins.lua'
alias vvi 'vi ~/.local/share/lunarvim/lvim/init.lua'
alias vfc 'vi ~/.local/share/lunarvim/lvim/lua/lvim/my_config/config.fish'
alias wda 'fish ~/myDiary/create_diary.fish'
alias cda 'cd ~/myDiary'
alias tnw 'tmux new-window -n'
alias bk '~/.local/share/lunarvim/lvim/lua/lvim/my_config/backup_files.fish'
alias gp 'grep -n -H -R'

set -U FZF_COMPLETE 0
set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git . \$dir 2> /dev/null"
# bind -M insert \ek 'set fish_bind_mode default'
# set -gx Z_SCRIPT_PATH ~/z/z.sh
