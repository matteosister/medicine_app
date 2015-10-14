#!/bin/bash

mix deps.get
cd /apps/medicine_web
npm install
./node_modules/.bin/bower --allow-root --config.interactive=false update
cd /apps
mix phoenix.server
