#!/bin/bash

# Checks if a system reboot is required

if [ -f /var/run/reboot-required ]
then
  echo '***Reboot required***'
else
  echo 'No reboot required'
fi
