#!/bin/bash
echo "# $1" >> README.md
echo "*.qmlc" >> .gitignore
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:nextsigner/$1.git
git push -u origin master
