#!/bin/bash

# configuration
dockerConfigFile="/etc/default/docker"
dockerDaemonPort="2375"

# --------------------------------------------------------
# Function for creating log entries on the console
# --------------------------------------------------------
# $1 - Log level
# $2 - Log text
# --------------------------------------------------------
function log() {

    # read parameters
    local level="$1"
    local text="$2"

    # create log message
    local now=$(date +"%d-%m-%Y %H:%M:%S")
    echo -e "\n$now [$level] $text\n"
}

# allow connections to docker socket from the outside world
echo '' >> "$dockerConfigFile"
echo '# Allow connections to docker socket from the outside world' >> "$dockerConfigFile"
echo 'DOCKER_OPTS="-H tcp://0.0.0.0:'$dockerDaemonPort' -H unix:///var/run/docker.sock"' >> "$dockerConfigFile"

# restart docker daemon
/etc/init.d/docker restart

# get current ip address
ipAddress="$(hostname -I | cut -d' ' -f2)"

# get docker host variable
dockerHost="tcp://$ipAddress:$dockerDaemonPort"

# log docker host variable usage
if [ "$HOST_IS_WINDOWS" == "true" ]
then
    dockerHostVariableString="set DOCKER_HOST=$dockerHost"
else
    dockerHostVariableString="export DOCKER_HOST=$dockerHost"
fi  

log "INFO" "Set environment variable to connect to docker daemon: $dockerHostVariableString"  