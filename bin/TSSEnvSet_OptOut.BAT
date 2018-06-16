@ECHO OFF
::........................................
::
:: Generated Batch file for windows
:: 2011/01/03 14:35:36
::
::........................................


::........................................
::
:: User may need to modify the value of TS_QUALITY
:: before running the script on a different machine
::
::........................................

call .\mdmcustomenv-parallelOptout.bat 
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSRoutertmpl.cmd" "%TSS_SCRIPTS%\TSSRouterOptOut.cmd" > %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSLatamCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSLatamCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSArgentinaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSArgentinaCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSChileCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSChileCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSMexicoCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSMexicoCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSAustriaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSAustriaCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSBelgiumCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBelgiumCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSBrazilCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBrazilCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSBritainCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBritainCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSCanadaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSCanadaCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSDenmarkCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSDenmarkCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSFinlandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSFinlandCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSFranceCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSFranceCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSGermanyCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSGermanyCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSGreeceCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSGreeceCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSIrelandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSIrelandCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSItalyCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSItalyCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSNetherlandsCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSNetherlandsCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSNorwayCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSNorwayCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSPortugalCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSPortugalCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSSpainCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSpainCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSSwedenCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSwedenCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSSwitzerlandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSwitzerlandCleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelOptOut.bat"+"%TSS_SCRIPTS%\TSSUSACleansetmpl.cmd" "%TSS_SCRIPTS%\TSSUSACleanseOptOut.cmd" >> %MDM%\log\TSSEnvSet_OptOut.LOG

ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_OptOut.log TSSEnvSet_OptOut_%currentdate%_%currenttime%.log