if ! [[ $TRAVIS_TAG ]] 
then
    git config --local user.name $GH_USERNAME 
    git config --local user.email $GH_EMAIL 
    export TRAVIS_TAG=${TRAVIS_TAG:-$(date +'%H%M%S-%d%m%Y')} 
    git tag $TRAVIS_TAG 
    cd .build/x86_64-apple-macosx10.10/release 
    tar czvf ilogyou.tar.gz iLogYou
    cd ../../../..
    git clone https://github.com/leolgrn/homebrew-ilogyou.git
    cd homebrew-ilogyou
    git remote remove origin
    git remote add origin https://leolgrn:${GH_TOKEN}@github.com/leolgrn/homebrew-ilogyou.git
    touch test.swift 
    git add .
    git commit -m "Testing pushing file from Travis"
    git push origin master --quiet
    cd ..
fi