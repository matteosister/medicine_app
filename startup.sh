#!/bin/bash

mix deps.get
cd /app/apps/medicine_web
npm install
./node_modules/.bin/bower --allow-root --config.interactive=false update
cd /app
mix phoenix.server
