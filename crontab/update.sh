#!/bin/sh
cd ~/extreme-board
git pull
rake download_json
nanoc co
