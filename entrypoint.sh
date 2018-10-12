#!/bin/sh

CONF=/usr/local/etc/noip2.conf

# Start the first process
if [ ! -e $CONF ]; then
	noip2 -C -c $CONF
fi

noip2 -d -c $CONF
status=$?

if [ $status -ne 0 ]; then
  echo "Failed to start noip2: $status"
  exit $status
fi

while sleep 60; do

  if ! ps aux | grep -q [n]oip2 ; then
    echo "NoIP has already exited."
    exit 1
  fi
done
