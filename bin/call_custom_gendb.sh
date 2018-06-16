# Copyright 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh

echo $(date +%m/%d/%Y-%T)
echo Starting custom_execute_gendb.sh 
./custom_execute_gendb.sh > ../log/custom_gendb.log 2>&1

