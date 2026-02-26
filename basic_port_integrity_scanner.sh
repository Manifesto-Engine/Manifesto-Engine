#!/bin/bash
host=$1
port=$2
timeout 1 bash -c "</dev/tcp/$host/$port" 2>/dev/null
if [ $? -eq 0 ]; then
  echo "Port $port is open (WARNING: Public Exposure)"
else
  echo "Port $port is closed (Secured)"
fi
