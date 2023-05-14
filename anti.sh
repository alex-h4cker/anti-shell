#!/bin/bash

DANGEROUS_PORTS=(22 23 80)

EMAIL_ADDRESS="youremail@example.com"

for port in "${DANGEROUS_PORTS[@]}"
do
    if nc -z localhost $port; then
        echo "Warning: Port $port is open!" | mail -s "Antishell Alert" $EMAIL_ADDRESS
    fi
done
