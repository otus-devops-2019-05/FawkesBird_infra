#!/bin/bash

# clone the app
git clone -b monolith https://github.com/express42/reddit.git

# set-up bundles
cd reddit
bundle install

# start
puma -d
