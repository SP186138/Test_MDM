# Copyright 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh

. ./bcmenv.sh

echo $(date +%m/%d/%Y-%T)
echo compiling Stored Procedure
$JAVA_HOME/bin/java -Dsun.net.inetaddr.ttl=0 com.teradata.xcore.util.StoredProcCompiler xserver.xml  customMDMSPList.txt
 


