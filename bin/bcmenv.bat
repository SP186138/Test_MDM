@echo off
REM Copyright (c) 2006-2016 by Teradata Corporation. 
REM All Rights Reserved. 
REM Teradata CONFIDENTIAL AND TRADE SECRET 

set DB_USER=
set DB_PASSWORD=
set DB_HOST=
set JAVA_HOME="E:\Java\jdk1.8.0_73"
set PATH=%JAVA_HOME%\bin;%PATH%
rem set JAVA_OPTIONS=-Xms512m -Xmx4096m -Dsun.net.inetaddr.ttl=0
set JAVA_OPTIONS=-Xms512m -Xmx4096m -Dsun.net.inetaddr.ttl=0 
rem -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=2332 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false

REM  Skip MDM environment setup if it's already set.
REM  Otherwise, the CLASSPATH variable will grow endlessly.

set TMP_VAR=%MDM_ENV%No
if not "%TMP_VAR%"=="No" goto end

REM  Set the MDM environment variables
REM
if not "%BCM_ROOT%"=="" goto setvar

set BCM_ROOT=../../..
set BCM_WEB_ROOT=%BCM_ROOT%\web\mdmclient
:setvar

set BCM_XCORE=%BCM_ROOT%\lib\bpe-util.jar;%BCM_ROOT%\lib\mdm-server.jar;%BCM_ROOT%\lib\bpe-tools.jar;%BCM_ROOT%\lib\bpe-mcore.jar

set OVERRIDE_DIR=%BCM_ROOT%\lib\override
REM set CUSTOM=%BCM_ROOT%\custom;%BCM_ROOT%\custom\cfg;%BCM_ROOT%\custom\cfg\properties;
set CUSTOM=%BCM_ROOT%\custom\pngrelease3;%BCM_ROOT%\custom\pngrelease3\cfg;%BCM_ROOT%\custom\pngrelease3\cfg\properties

set MAIL_JAR=%BCM_ROOT%\lib\mail.jar;%BCM_ROOT%\lib\activation.jar
set DB_JAR=%BCM_ROOT%\lib\jdbc2_0-stdext.jar;%BCM_ROOT%\lib\terajdbc4.jar;%BCM_ROOT%\lib\tdgssconfig.jar
set XML_JAR=%BCM_ROOT%\lib\xercesImpl.jar;%BCM_ROOT%\lib\xml-apis.jar;%BCM_ROOT%\lib\serializer.jar;%BCM_ROOT%\lib\xalan.jar;%BCM_ROOT%\lib\jdom.jar;%BCM_ROOT%\lib\commons-codec-1.10.jar;%BCM_ROOT%\lib\commons-httpclient-3.1.jar;%BCM_ROOT%\lib\not-yet-commons-ssl.jar;%BCM_ROOT%\lib\wsdl4j.jar;%BCM_ROOT%\lib\xmlsec.jar;%BCM_ROOT%\lib\opensaml.jar;%BCM_ROOT%\lib\wss4j.jar;%BCM_ROOT%\lib\httpclient.jar;%BCM_ROOT%\lib\httpcore.jar;%BCM_ROOT%\lib\axiom-api.jar;
set XCORE_JAR=%BCM_ROOT%\lib\bpe-server.jar;%BCM_ROOT%\lib\bpe-services.jar;
set CUSTOM_CFG=%BCM_ROOT%\custom\pngrelease3\cfg;%BCM_ROOT%\custom\pngrelease3\cfg\properties;%BCM_ROOT%\custom\pngrelease3\cfg\xservice\png;%BCM_ROOT%\custom\pngrelease3\cfg\xservice\png\mdm_setup
set MDM_CFG=%CUSTOM_CFG%;%BCM_ROOT%\cfg\properties;%BCM_ROOT%\cfg\xservice\toolkit;%BCM_ROOT%\cfg\xservice\toolkit\mdm_setup;%BCM_ROOT%\cfg
set JCE_JAR=%BCM_ROOT%\lib\jcert.jar
set XSERVICE_JAR=%BCM_ROOT%\lib\bcm_xservice.jar
set XMGR=%BCM_ROOT%\lib\bpe-util.jar
set POI_JARS=%BCM_ROOT%\lib\poi-3.10.1-20140818.jar;%BCM_ROOT%\lib\commons-fileupload.jar;%BCM_ROOT%\lib\commons-logging.jar;%BCM_ROOT%\lib\poi-ooxml-3.10.1-20140818.jar;%BCM_ROOT%\lib\poi-ooxml-schemas-3.10.1-20140818.jar;%BCM_ROOT%\lib\poi-scratchpad-3.10.1-20140818.jar;%BCM_ROOT%\lib\poi-excelant-3.10.1-20140818.jar;%BCM_ROOT%\lib\dom4j.jar;%BCM_ROOT%\lib\geronimo-stax-api_1.0_spec.jar;%BCM_ROOT%\lib\xmlbeans.jar; 
set BCM_WEB_CLASSPATH=%BCM_WEB_ROOT%\WEB-INF\bcm\cfg\properties;%BCM_WEB_ROOT%\WEB-INF\bcm\cfg;%BCM_WEB_ROOT%\WEB-INF\lib\bpe-x2.jar;%BCM_WEB_ROOT%\WEB-INF\classes;%BCM_WEB_ROOT%\WEB-INF\lib\log4j.jar
set JMS=%BCM_ROOT%\lib\jms.jar
set QUARTZ=%BCM_ROOT%\lib\quartz-2.2.1.jar;%BCM_ROOT%\lib\gson-2.2.4.jar;%BCM_ROOT%\lib\c3p0-0.9.1.1.jar;%BCM_ROOT%\lib\slf4j-api-1.6.6.jar;%BCM_ROOT%\lib\quartz-jobs-2.2.1.jar;%BCM_ROOT%\lib\slf4j-log4j12-1.6.6.jar
set CONNECTION_POOL=%BCM_ROOT%\lib\commons-dbcp2-2.1.jar;%BCM_ROOT%\lib\commons-pool2-2.3.jar;
set WEBSERVICE_JAR=%BCM_ROOT%\lib\commons-codec-1.10.jar;%BCM_ROOT%\lib\axiom-api.jar;
set CLASSPATH=.;%CONNECTION_POOL%;%CUSTOM%;%OVERRIDE_DIR%;%BCM_XCORE%;%MDM_CFG%;%BCM_ROOT%\lib;%XCORE_JAR%;%XML_JAR%;%MAIL_JAR%;%DB_JAR%;%XMGR%;%XSERVICE_JAR%;%JCE_JAR%;%BCM_WEB_CLASSPATH%;
set CLASSPATH=%CLASSPATH%;%POI_JARS%;%JAVA_HOME%\lib\tools.jar;%JMS%;%QUARTZ%;%WEBSERVICE_JAR%;


REM  Mark the MDM environment as setup
REM
set MDM_ENV=Yes

REM  Clear the temp variable and leave this batch file
:end
set TMP_VAR=
