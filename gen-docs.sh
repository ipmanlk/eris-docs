#!/bin/bash

npm install clean-jsdoc-theme

while IFS=' ' read -r repo branch
do 
    git clone -b "$branch" "$repo" "$branch"
    cp "jsdoc.json" "$branch/jsdoc.json"

    cd "$branch"
    npx jsdoc --configure "jsdoc.json"

    cd ..

    cp -r ./$branch/docs/eris/* "./docs/$branch"

    rm -rf "$branch"
done <branches

rm -rf node_modules package-lock.json package.json