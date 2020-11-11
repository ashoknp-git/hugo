mkdir $HOME/src
cd $HOME/src
git clone https://github.com/gohugoio/hugo.git
cd hugo
go build --tags extended
[[ "$OSTYPE" == "darwin"* ]] && brew install upx
upx hugo
