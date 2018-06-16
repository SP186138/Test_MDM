# Copyright 2006-2015 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh

. ./bcmenv.sh

echo $(date +%m/%d/%Y-%T)
echo Populating SYS_VIEW_MAP
${JAVA_HOME}/bin/java  com.teradata.xcore.util.SysViewMapPopulator xserver.xml
 
