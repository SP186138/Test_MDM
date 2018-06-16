# Copyright 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh

echo $(date +%m/%d/%Y-%T)
echo Setting up Database Schema and Data 

echo $(date +%m/%d/%Y-%T)
echo Setting environment
. ./bcmenv.sh
export CLASSPATH=.:$CLASSPATH


echo $(date +%m/%d/%Y-%T)
echo Updating the Properties files
${JAVA_HOME}/bin/java com.teradata.xcore.util.DbpropertyUpdate  ../../../cfg/properties/xserver.xml 
${JAVA_HOME}/bin/java com.teradata.xcore.util.DbpropertyUpdate  ../../../cfg/properties/xserverweb.xml 


echo $(date +%m/%d/%Y-%T)
echo performing Service Setup
$JAVA_HOME/bin/java ${JAVA_OPTIONS} com.teradata.mcore.mdmSpecGen.MdmSpecGen ./mdm-spec-gen.xml ../../../bin/tddb.keywords


echo $(date +%m/%d/%Y-%T)
echo Generating Schema
$JAVA_HOME/bin/java ${JAVA_OPTIONS} com.teradata.xcore.util.SchemaGenHelper custom_SchemaGen_MetaInfo.xml 

