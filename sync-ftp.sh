#!/bin/sh
# ==============================================================================
# FTP SYNC script
# ==============================================================================
#
# Requirements:
# -------------------------------
# This script requires lftp. To install on Mac OS X, obtain brew
# <http://mxcl.github.io/homebrew/> and run the following command:
#
# brew install lftp
#
# That will install dependencies needed and the lftp application. An update might
# be needed for this to work in which case you can run `brew update`.
#
#
# Usage:
# -------------------------------
# ./sync-ftp.sh {config-file} {source-path} {deploy-path}
#
# Example:
# 	./sync-ftp.sh config-example /path/to/source /deploy/path
#
# The config-file in this case, "config-example", must be located in
# config/config-example.sh. Please take a look at the example for available
# options.
#
# The script will ignore .DS_Store and local files in the uploads directory when
# deploying.
#
# Deploying to another environment means adding another config file to config/.
#
#
# Author: Richard Sumilang <me@richardsumilang.com>
# Date: April 17th, 2013



#==========================================================
# General Configurations
#==========================================================

SOURCE_PATH=$2
DEPLOY_PATH=$3



#==========================================================
# Determine what configuration to use
#==========================================================

if [ -z $1 ]
then
	echo $"Usage: $0 {config-file} {site|frameworks|all} [--force]"
	exit 1
fi

CONFIG="config/$1.sh"
if [ -e $CONFIG ]
then
	source $CONFIG
else
	echo "Error: Configuration not valid. Please check in config/*"
	exit 2
fi



#==========================================================
# Check if source directory is valid
#==========================================================

if [ ! -d $SOURCE_PATH ]; then
	echo "Invalid source path: \"$SOURCE_PATH\""
	exit 3
fi



#==========================================================
# Check whether or not to remove deleted files
#==========================================================

if [ $DELETE -eq 1 ]; then
	DELETE_ARG="--delete";
else
	DELETE_ARG="";
fi



#==========================================================
# Start the syncs
#==========================================================

if [ $DEPLOY_SITE -eq 1 ]
then
	#================================
	echo "Syncing \"$SOURCE_PATH\"..."
	#================================
	lftp -c "set ftp:list-options -a;
	open ftp://$USER:$PASS@$HOST;
	lcd $SOURCE_PATH;
	cd $DEPLOY_PATH;
	mirror --reverse $DELETE_ARG \
	       --verbose \
	       --exclude-glob .DS_Store
	$ADD_CMDS
	bye
	"
	echo "Done syncing \"$SOURCE_PATH\" files..."
fi