set -e

echo "::group::install dependencies" 
brew install upx
wget https://golang.org/dl/go1.15.3.darwin-amd64.pkg
sudo installer -pkg go1.15.3.darwin-amd64.pkg -target /
go version
echo "::endgroup::"

echo "::group::building binary" 
go install

if [[ "$GOOS" == "darwin" ]]; then
    BIN_PATH=$GOPATH/bin/hugo
else
    BIN_PATH=$GOPATH/bin/${GOOS}_${GOARCH}/hugo
fi
echo "::endgroup::"

echo "::group::compressing binary" 
upx $BIN_PATH
ls -lah $BIN_PATH
echo "::endgroup::"

echo "::set-output name=bin_path::${BIN_PATH}"
