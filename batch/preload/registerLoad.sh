# Copyright 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#! /usr/bin/ksh
# run this file to register load in your database
echo Setting Env
export HOME_ST=`pwd`
cd ../../bin

. ./bcmenv.sh
export CLASSPATH=../batch:$CLASSPATH
    
echo "<!--***********Starting RegisterLoad.xml ******************-->"

#NOTE : ur Registerload.xml should be in the <build_home>/bin dir for this script to execute

${JAVA_HOME}/bin/java com.teradata.xcore.net.Poster xserver ../cfg/properties/xserver.xml E2E ../batch/preload/registerLoad.xml

cd $HOME_ST/
