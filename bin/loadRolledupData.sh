# Copyright 2006-2015 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh

echo Calling loadRolledupData.sh
./rollupData.sh > ../log/rolledupData.log

sleep 60
. ./stopAll.sh
