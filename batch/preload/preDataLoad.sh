# Copyright 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#! /usr/bin/ksh
# run this file to populate data to your database
echo Setting Env
cur_dir=`pwd`;
cd ../../bin
. ./bcmenv.sh
export CLASSPATH=../batch:$CLASSPATH
    
echo "<!--***********Starting setPreloadConfig ******************-->"
    
${JAVA_HOME}/bin/java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml E2E ../batch/preload/preDataLoad.xml
cd $cur_dir