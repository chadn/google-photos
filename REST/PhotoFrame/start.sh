#!/bin/bash

# no matter where called from, run from same dir as this script
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
LOGFILE=$MYDIR/node.log

# redirects stderr and stdout to same place (exec &>) then add timestamp, then append to LOGFILE
exec &> >(while read line; do echo "$(date +'%Y-%m-%dT%H:%M:%S%z-%a') $line" >> $LOGFILE; done;)

echo "Starting node app.js"
cd $MYDIR && node app.js &

