.logon $TDPID/$TDUSER,$TDPWD
 
.SET ERROROUT STDOUT ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.SET SESSION CHARSET 'UTF8' ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.GOTO $Step

.LABEL L1

UPDATE mdm.dqrm_email
set email_addr_txt='pgglobalenterprise@service-now.com',
sys_last_modified_by='sb255018',
sys_last_modified_date=current_timestamp(0),
sys_nc_type='UPDATE'
where email_addr_txt='bioperations.im@pg.com' and mail_type='SM';

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;