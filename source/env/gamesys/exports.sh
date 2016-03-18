#!/bin/sh

export SPLUNK_HOME=/Applications/Splunk
export PATH=$SPLUNK_HOME/bin:$PATH
export DOCKER_HOST=tcp://192.168.99.103:2376
export DOCKER_CERT_PATH=/Users/ronaldo.pontes/.docker/machine/machines/dinghy
export DOCKER_TLS_VERIFY=1
export DOCKER_MACHINE_NAME=dinghy
