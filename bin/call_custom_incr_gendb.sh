# Copyright 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh

echo $(date +%m/%d/%Y-%T)
echo Calling custom_execute_incr_gendb.sh

./custom_execute_incr_gendb.sh > ../log/incr_custom_gendb.log 2>&1
