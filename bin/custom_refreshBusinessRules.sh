# Copyright 2006-2015 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 


echo $(date +%m/%d/%Y-%T)
echo "<!--************ Refreshing/Updating Business Rules ************-->"

. ./bcmenv.sh
export CLASSPATH=.:$CLASSPATH

echo $(date +%m/%d/%Y-%T)
echo Uploading ../../../cfg/xservice/toolkit/data/refreshBusinessRules.xml
${JAVA_HOME}/bin/java com.teradata.xcore.net.Poster xserver xserver.xml BPE_META ../../../cfg/xservice/toolkit/data/refreshBusinessRules.xml
pause
exit
