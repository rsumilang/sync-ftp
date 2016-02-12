#!/bin/sh
# ==============================================================================
# FTP Info
# ==============================================================================
#
# Below are the variables needed. Create a config file for each of the
# environments needed.
#
# Author: Richard Sumilang <me@richardsumilang.com>
# Date: Sept 27th, 2014

# Authentication
HOST="ftp.hostname.com"
USER="username"
PASS="secretpass"

# Delete:
# If set to 1 then we will delete files from host that no longer exist in source
DELETE=1

# Additional Mirror Options
# IE: --exclude foo/bar
MIRROR_OPTIONS=""

# Additional commands
# Here you can add a few more commands to execute. For example:
#
#   put config/environments/$1.php -o protected/config/environments/current.php
#   put config/apache/htaccess-$1 -o .htaccess
#
ADD_CMDS=""
