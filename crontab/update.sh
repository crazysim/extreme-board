#!/bin/sh
cd ~/extreme-board
git pull
#rake download_json
rm -rf tmp/aria2
aria2c -Z -P -d tmp/aria "https://ieee.hackerrank.com/rest/contests/ieeextreme7/leaderboard?offset=[0-2000:10]&_=1382769745980"
touch content/index.haml
nanoc co
