#!/bin/bash

#System info script
#By: Javier
#Show usefull system info

echo "============="
echo "SYSTEM INFO"
echo "============="
echo ""

echo "User: $(whoami)"
echo "Date and Hour: $(date)"
echo "Actual File: $(pwd)"
echo ""

echo "============="
echo "DISK SPACE"
echo "============="
df -h | grep -E "^/dev/disk" | head -1
echo ""

echo "============="
echo "SYSTEM LOAD"
echo "============="
uptime
echo ""

echo "============="
echo "HOME FILES"
echo "============="
ls -la ~ | head -10