#!/bin/bash
cp  /home/ns/zodiacserver/bin/user/*.dat /home/ns/nsp/uda/nextsigner.github.io/user/
sudo chmod 777 ./user/*.dat
git add *;
git commit -m "Subiendo cns: $1";
git push origin master;

