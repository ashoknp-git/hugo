latesttag=$(git describe --tags)
git checkout ${latesttag}
go build --tags extended
[[ "$OSTYPE" == "darwin"* ]] && brew install upx
upx hugo
pwd
