# Copyright (c) 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# Teradata CONFIDENTIAL AND TRADE SECRET 
echo $(date +%m/%d/%Y-%T)
echo "*********** Setting up environment ************"

. ./bcmenv.sh
export CLASSPATH=.:${CLASSPATH}
echo $(date +%m/%d/%Y-%T)
echo Exporting SQL validation rules

${JAVA_HOME}/bin/java com.teradata.xcore.net.Poster xserver xserver.xml BPE_META ../../../cfg/xservice/toolkit/rules/export_sql_validation_rule.xml
touch sql_validation_rules.xml
mv sql_validation_rules.xml ../cfg/xservice/toolkit/data

echo $(date +%m/%d/%Y-%T)
echo done
exit
