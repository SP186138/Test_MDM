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

call .\mdmcustomenv-parallelRETLR.bat 
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSRoutertmpl.cmd" "%TSS_SCRIPTS%\TSSRouterRETLR.cmd" > %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSLatamCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSLatamCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSArgentinaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSArgentinaCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSChileCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSChileCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSMexicoCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSMexicoCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSAustriaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSAustriaCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSBelgiumCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBelgiumCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSBrazilCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBrazilCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSBritainCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBritainCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSCanadaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSCanadaCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSDenmarkCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSDenmarkCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSFinlandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSFinlandCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSFranceCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSFranceCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSGermanyCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSGermanyCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSGreeceCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSGreeceCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSIrelandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSIrelandCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSItalyCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSItalyCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSNetherlandsCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSNetherlandsCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSNorwayCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSNorwayCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSPortugalCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSPortugalCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSSpainCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSpainCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSSwedenCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSwedenCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSSwitzerlandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSwitzerlandCleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelRETLR.bat"+"%TSS_SCRIPTS%\TSSUSACleansetmpl.cmd" "%TSS_SCRIPTS%\TSSUSACleanseRETLR.cmd" >> %MDM%\log\TSSEnvSet_RETLR.LOG

ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_RETLR.log TSSEnvSet_RETLR_%currentdate%_%currenttime%.log