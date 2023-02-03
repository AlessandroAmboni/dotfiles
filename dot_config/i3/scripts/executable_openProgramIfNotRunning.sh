#!/bin/bash

program=$1

# This script will open a program if it is not already running.
if ! pgrep -x "${program}" > /dev/null
then
    ${program}
fi