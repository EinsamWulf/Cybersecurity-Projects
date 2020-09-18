#!/bin/bash
# Quick setup script for new server

# Make sure the script is run as root
if [ ! $UID = 0 ]
then
	echo "Please run this script as root."
	exit
fi
