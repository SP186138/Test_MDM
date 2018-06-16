# Copyright 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh
. ./bcmenv.sh
${JAVA_HOME}/bin/java com.teradata.bcm.xcore.util.PosterUtil xserver localhost xserver.xml shutdown.xml