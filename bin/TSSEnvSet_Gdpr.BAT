@ECHO OFF
::........................................
::
:: Generated Batch file for windows
:: 2017/09/12 14:35:36
::
::........................................


::........................................
::
:: User may need to modify the value of TS_QUALITY
:: before running the script on a different machine
::
::........................................

call .\mdmcustomenv-parallelGdpr.bat 
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSRoutertmpl.cmd" "%TSS_SCRIPTS%\TSSRouterGdpr.cmd" > %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSLatamCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSLatamCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSArgentinaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSArgentinaCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSChileCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSChileCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSMexicoCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSMexicoCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSAustriaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSAustriaCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSBelgiumCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBelgiumCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSBrazilCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBrazilCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSBritainCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSBritainCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSCanadaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSCanadaCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSDenmarkCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSDenmarkCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSFinlandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSFinlandCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSFranceCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSFranceCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSGermanyCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSGermanyCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSGreeceCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSGreeceCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSIrelandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSIrelandCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSItalyCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSItalyCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSNetherlandsCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSNetherlandsCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSNorwayCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSNorwayCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSPortugalCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSPortugalCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSSpainCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSpainCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSSwedenCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSwedenCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSSwitzerlandCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSSwitzerlandCleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallelGdpr.bat"+"%TSS_SCRIPTS%\TSSUSACleansetmpl.cmd" "%TSS_SCRIPTS%\TSSUSACleanseGdpr.cmd" >> %MDM%\log\TSSEnvSet_Gdpr.LOG

ren %MDM_CUSTOM_DIR%\log\TSSEnvSet_Gdpr.log TSSEnvSet_Gdpr_%currentdate%_%currenttime%.log