#!/bin/bash

# configuration
bashrcFile="$HOME/.bashrc"

# add default aliases
echo "" >> "$bashrcFile"
echo "alias l='ls -altrh'" >> "$bashrcFile"
echo "alias ..='cd ..'" >> "$bashrcFile"

# extend path with /etc/init.d folder
echo 'PATH="$PATH:/etc/init.d"' >> "$bashrcFile"