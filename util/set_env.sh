#!/bin/bash

# Sets SIRIUS environment

PATH="$PATH:/donnager/sys/scripts:/donnager/sys/scripts/util"

# Paths
DIR_VOL=/donnager/vol
DIR_SYS=/donnager/sys
DIR_SCRIPTS=$DIR_SYS/scripts
DIR_SCRIPTS_UTIL=$DIR_SCRIPTS/util
DIR_DOCKER=$DIR_SYS/docker
DIR_SECRETS=$DIR_SYS/secrets
DIR_LOGS=$DIR_SYS/logs
DIR_WORKSPACE=$DIR_SYS/workspace

# Set Paths
alias cdvol="cd $DIR_VOL"
alias cdsys="cd $DIR_SYS"
alias cddocker="cd $DIR_DOCKER"
alias cdsecrets="cd $DIR_SECRETS"
alias cdlogs="cd $DIR_LOGS"
alias cdworkspace="cd $DIR_WORKSPACE"

# Set Commands
alias gstime="date +"%Y-%m-%dT%H:%M:%S%:z""

echo "SIRIUS environment configured."
