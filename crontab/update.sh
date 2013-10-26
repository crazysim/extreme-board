#!/bin/sh
cd ~/extreme-board
git pull
rake download_json
touch content/index.haml
nanoc co
