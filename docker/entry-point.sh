#!/bin/bash

CYPRESS_DIR='/root/.cache/Cypress/';
NODE_DIR='node_modules';

echo "Checking node module installation";
if [ ! -d "$NODE_DIR" ] && [ ! "$(ls -A $NODE_DIR)" ]; then
    npm install
fi

echo "Checking Cypress cache binary installation";
if [ ! -d "$CYPRESS_DIR" ] && [ ! "$(ls -A $CYPRESS_DIR)" ]; then
    npm install cypress
fi

tail -f /dev/null