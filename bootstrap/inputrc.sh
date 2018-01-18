#!/bin/bash

# configuration
inputrcFile="/etc/inputrc"

# add history completion
sudo -s
echo "" >> "$inputrcFile"
echo '"\e[5~": history-search-backward' >> "$inputrcFile"
echo '"\e[6~": history-search-forward' >> "$inputrcFile"