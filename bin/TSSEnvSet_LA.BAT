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

call .\mdmcustomenv-parallel.bat 

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSRoutertmpl.cmd" "%TSS_SCRIPTS%\TSSLARouter.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSLatamCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSLatamCleanse.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSLatamMatchtmpl.cmd" "%TSS_SCRIPTS%\TSSLatamMatch.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSArgentinaCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSArgentinaCleanse.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSArgentinaMatchtmpl.cmd" "%TSS_SCRIPTS%\TSSArgentinaMatch.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSChileCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSChileCleanse.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSChileMatchtmpl.cmd" "%TSS_SCRIPTS%\TSSChileMatch.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG

copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSMexicoCleansetmpl.cmd" "%TSS_SCRIPTS%\TSSMexicoCleanse.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG
copy/b "%MDM%\etl-scripts-parallel\bin\mdmcustomenv-parallel.bat"+"%TSS_SCRIPTS%\TSSMexicoMatchtmpl.cmd" "%TSS_SCRIPTS%\TSSMexicoMatch.cmd" >> %MDM%\log\TSSEnvSet_LA.LOG
