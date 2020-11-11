go build --tags extended
[[ "$OSTYPE" == "darwin"* ]] && brew install upx
upx hugo
pwd
