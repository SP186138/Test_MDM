@echo off

REM SCRIPT:               Consumer Original Table Loads.BTEQ 
REM DESCRIPTION:          This script updates the original tables.
REM DEPENDENCY:           
REM INPUT:                ETL Staging
REM OUTPUT:               Golden tables
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 08/21/2011           TERADATA                        INITIAL VERSION
REM 2.00                 06/14/2013           TERADATA                        stop orig processing

echo Executing INPUT LOAD

:start

call .\mdmcustomenv.bat 

:end
