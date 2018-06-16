# Copyright 2006-2015 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh

. ./bcmenv.sh

chmod 777 *.*

echo starting Locator and MDM Server
. ./startAll.sh &
${JAVA_HOME}/bin/java com.teradata.xcore.util.SocketPoller localhost xserver.xml
sleep 15

for i in ../rolledupData/*.xml ; do

${JAVA_HOME}/bin/java -Xms256m -Xmx1024m com.teradata.bcm.xcore.util.PosterUtil xserver localhost xserver.xml $i

done

echo import of rolled up data complete