# Copyright 2006-2015 by Teradata Corporation. 
# All Rights Reserved. 
# TERADATA CONFIDENTIAL AND TRADE SECRET 

#!/usr/bin/ksh
. ./bcmenv.sh
$JAVA_HOME/bin/java ${JAVA_OPTIONS} com.teradata.xcore.xserver.Xserver xserver.xml bpemeta.xml toolkit.xml toolkit-output.xml toolkit-version.xml toolkit-input.xml userSecurity.xml messaging.xml validation.xml toolkit-netchange.xml E2E.xml dataProfiling.xml dataupload.xml email.xml bpeui.xml timersink.xml hierarchy.xml approval.xml admin_ui.xml ui_workflow.xml scheduler.xml png.xml png-input.xml png-output.xml png-netchange.xml png-version.xml custom_ui_workflow.xml PNG_admin_ui.xml PNG_admin_ui.xml custom_ui_workflow.xml custom_ui_workflow.xml custom_ui_workflow.xml
