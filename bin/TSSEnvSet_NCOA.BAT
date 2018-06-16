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

call .\mdmcustomenv-parallelNCOA.bat 
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSRoutertmpl.cmd" "%TSS_SCRIPTS%\TSSRouterNCOA.cmd" > %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSLatamCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSLatamCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSArgentinaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSArgentinaCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSChileCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSChileCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSMexicoCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSMexicoCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSAustriaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSAustriaCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSBelgiumCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBelgiumCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSBrazilCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBrazilCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSBritainCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBritainCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSCanadaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSCanadaCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSDenmarkCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSDenmarkCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSFinlandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSFinlandCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSFranceCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSFranceCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSGermanyCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSGermanyCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSGreeceCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSGreeceCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSIrelandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSIrelandCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSItalyCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSItalyCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSNetherlandsCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSNetherlandsCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSNorwayCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSNorwayCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSPortugalCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSPortugalCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSSpainCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSpainCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSSwedenCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSwedenCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSSwitzerlandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSwitzerlandCleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelNCOA.bat"+"%TSS_SCRIPTS%\TSSUSACleansetmpl.cmd" "%TSS_SCRIPTS%\TSSUSACleanseNCOA.cmd" >> %MDM%\log\TSSEnvSet_NCOA.LOG

ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_NCOA.log TSSEnvSet_NCOA_%currentdate%_%currenttime%.log