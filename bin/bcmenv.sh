# Copyright 2006-2016 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh

#JAVA_HOME=/opt/jdk1.5

export PATH=${JAVA_HOME}/bin:${PATH}
export SHLIB_PATH=${SHLIB_PATH}
export JAVA_OPTIONS="-Xms512m -Xmx1024m -Dsun.net.inetaddr.ttl=0"

BCM_ROOT=../../..
BCM_WEB_ROOT=${BCM_ROOT}/web/mdmclient

BCM_XCORE=${BCM_ROOT}/lib/bpe-util.jar:${BCM_ROOT}/lib/mdm-server.jar:${BCM_ROOT}/lib/bpe-tools.jar:${BCM_ROOT}/lib/bpe-mcore.jar

OVERRIDE_DIR=${BCM_ROOT}/lib/override
CUSTOM=${BCM_ROOT}/custom/pngrelease3:${BCM_ROOT}/custom/pngrelease3/cfg:${BCM_ROOT}/custom/pngrelease3/cfg/properties

MAIL_JAR=${BCM_ROOT}/lib/mail.jar:${BCM_ROOT}/lib/activation.jar
DB_JAR=${BCM_ROOT}/lib/jdbc2_0-stdext.jar:${BCM_ROOT}/lib/terajdbc4.jar:${BCM_ROOT}/lib/tdgssconfig.jar
XML_JAR=${BCM_ROOT}/lib/xercesImpl.jar:${BCM_ROOT}/lib/xml-apis.jar:${BCM_ROOT}/lib/serializer.jar:${BCM_ROOT}/lib/xalan.jar:${BCM_ROOT}/lib/jdom.jar:${BCM_ROOT}/lib/commons-codec-1.10.jar:${BCM_ROOT}/lib/commons-httpclient-3.1.jar:${BCM_ROOT}/lib/not-yet-commons-ssl.jar:${BCM_ROOT}/lib/wsdl4j.jar:${BCM_ROOT}/lib/xmlsec.jar:${BCM_ROOT}/lib/opensaml.jar:${BCM_ROOT}/lib/wss4j.jar:${BCM_ROOT}/lib/httpclient.jar:${BCM_ROOT}/lib/httpcore.jar:${BCM_ROOT}/lib/axiom-api.jar
XCORE_JAR=${BCM_ROOT}/lib/bpe-server.jar:${BCM_ROOT}/lib/bpe-services.jar
CUSTOM_CFG=${BCM_ROOT}/custom/pngrelease3/cfg:${BCM_ROOT}/custom/pngrelease3/cfg/properties:${BCM_ROOT}/custom/pngrelease3/cfg/xservice/png:${BCM_ROOT}/custom/pngrelease3/cfg/xservice/png/mdm_setup: 
MDM_CFG=${BCM_ROOT}/cfg/properties:${BCM_ROOT}/cfg/xservice/toolkit:${BCM_ROOT}/cfg/xservice/toolkit/mdm_setup:${BCM_ROOT}/cfg

JCE_JAR=${BCM_ROOT}/lib/jcert.jar
XSERVICE_JAR=${BCM_ROOT}/lib/bcm_xservice.jar
XMGR=${BCM_ROOT}/lib/bpe-util.jar
POI_JARS=${BCM_ROOT}/lib/poi-3.10.1-20140818.jar:${BCM_ROOT}/lib/commons-fileupload.jar:${BCM_ROOT}/lib/commons-logging.jar:${BCM_ROOT}/lib/poi-ooxml-3.10.1-20140818.jar:${BCM_ROOT}/lib/poi-ooxml-schemas-3.10.1-20140818.jar:${BCM_ROOT}/lib/poi-scratchpad-3.10.1-20140818.jar:${BCM_ROOT}/lib/poi-excelant-3.10.1-20140818.jar:${BCM_ROOT}/lib/dom4j.jar:${BCM_ROOT}/lib/geronimo-stax-api_1.0_spec.jar:${BCM_ROOT}/lib/xmlbeans.jar
BCM_WEB_CLASSPATH=${BCM_WEB_ROOT}/WEB-INF/bcm/cfg/properties:${BCM_WEB_ROOT}/WEB-INF/bcm/cfg:${BCM_WEB_ROOT}/WEB-INF/lib/bpe-x2.jar:${BCM_WEB_ROOT}/WEB-INF/classes:${BCM_WEB_ROOT}/WEB-INF/lib/log4j.jar
JMS=${BCM_ROOT}/lib/jms.jar
QUARTZ=${BCM_ROOT}/lib/quartz-2.2.1.jar:${BCM_ROOT}/lib/gson-2.2.4.jar:${BCM_ROOT}/lib/c3p0-0.9.1.1.jar:${BCM_ROOT}/lib/slf4j-api-1.6.6.jar:${BCM_ROOT}/lib/quartz-jobs-2.2.1.jar:${BCM_ROOT}/lib/slf4j-log4j12-1.6.6.jar
CONNECTION_POOL=${BCM_ROOT}/lib/commons-dbcp2-2.1.jar:${BCM_ROOT}/lib/commons-pool2-2.3.jar
if test ["$BCM_TEMP_VAR"==""]
then
	export BCM_ROOT 
	export JAVA_HOME
	CLASSPATH=${CUSTOM_CFG}:${CONNECTION_POOL}:${OVERRIDE_DIR}:${BCM_XCORE}:${MDM_CFG}:${BCM_ROOT}/lib:${XCORE_JAR}:${XML_JAR}:${MAIL_JAR}:${DB_JAR}:${XMGR}:${XSERVICE_JAR}:${JCE_JAR}:${BCM_WEB_CLASSPATH}
	CLASSPATH=${CLASSPATH}:${POI_JARS}:${JAVA_HOME}/lib/tools.jar:${JMS}:${QUARTZ}
	export CLASSPATH
   	export BCM_TEMP_VAR=Notempty  #else #export BCM_TEMP_VAR= "Not empty!"  
fi
