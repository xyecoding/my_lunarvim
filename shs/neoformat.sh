echo -e "\033[31m installing formate of different type of filse used by vim-autoformat \033[0m"
~/anaconda3/bin/conda install latexindent.pl -c conda-forge
mv ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml_b
ln -s ~/.local/share/lunarvim/lvim/shs/defaultSettings.yaml ~/anaconda3/lib/perl5/vendor_perl/LatexIndent/defaultSettings.yaml
ln -s ~/anaconda3/bin/latexindent.pl ~/anaconda3/bin/latexindent

sudo apt install golang-go -y
export GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn
go get -u mvdan.cc/sh/cmd/shfmt
echo "export PATH=~/go/bin:\$PATH" >>~/.bashrc
npm install -g remark-cli
npm install prettier remark-prettier -g
