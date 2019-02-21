if ! [[ $TRAVIS_TAG ]] 
then
    git config --local user.name $GH_USERNAME 
    git config --local user.email $GH_EMAIL 
    export TRAVIS_TAG=${TRAVIS_TAG:-$(date +'%H%M%S-%d%m%Y')} 
    git tag $TRAVIS_TAG 
    cd .build/x86_64-apple-macosx10.10/release 
    tar czvf ilogyou.tar.gz iLogYou
else
    git clone https://github.com/leolgrn/homebrew-ilogyou.git 
    cd homebrew-ilogyou/Formula 
    touch test.swift 
    cd ..
fi