git config --local user.name $GH_USERNAME
git config --local user.email $GH_EMAIL
export TRAVIS_TAG=${TRAVIS_TAG:-$(date +'%H%M%S-%d%m%Y')}
git tag $TRAVIS_TAG
cd .build/x86_64-apple-macosx10.10/release
tar czvf ilogyou.tar.gz iLogYou
hash=`shasum -a 256 ilogyou.tar.gz | awk '{printf $1}'`
hashLine='  sha256 "'$hash'"'
url='  url "https://github.com/leolgrn/ilogyou/releases/download/'$TRAVIS_TAG'/ilogyou.tar.gz"'
cd ../../../..
git clone https://github.com/leolgrn/homebrew-ilogyou.git
cd homebrew-ilogyou
git remote remove origin
git remote add origin https://leolgrn:${GH_TOKEN}@github.com/leolgrn/homebrew-ilogyou.git
awk -v url="$url" 'NR==4 { $0=url } { print $0 }' Formula/ilogyou.rb > Formula/ilogyou2.rb
awk -v hashLine="$hashLine" 'NR==6 { $0=hashLine } { print $0 }' Formula/ilogyou2.rb > Formula/ilogyou3.rb
rm Formula/ilogyou.rb
rm Formula/ilogyou2.rb
mv Formula/ilogyou3.rb Formula/ilogyou.rb
git add .
git commit -m "Update Formula"
git push origin master --quiet
cd ../ilogyou
