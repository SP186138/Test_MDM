.logon $TDPID/$TDUSER,$TDPWD


.SET ERROROUT STDOUT;
.SET SESSION CHARSET 'UTF8';
.SET ERRORLEVEL 3807 SEVERITY 0;
DATABASE MDM;
.GOTO $Step



 .LABEL L0

--drop table MDM.MATCH_DATA_LOADID;

Drop table MDM.MATCH_DATA;
Drop table MDM.PRSNA_STG_MATCH;
Drop table MDM.PRSNA_POSTL_ADDR_STG_MATCH;
Drop table MDM.PRSNA_EMAIL_ADDR_STG_MATCH;
Drop table MDM.PRSNA_PHONE_STG_MATCH;
Drop table USER_WORK.MATCHD_CNSMR_PRSNA_TRT_MATCH;
Drop table MDM.MATCH_DATA_TEMP1;
Drop table MDM.REGIS_PRSNA_TEMP_USA;
DROP TABLE MDM.IMPCT_HSHLD  ;
DROP TABLE MDM.IMPCT_REGIS2  ;
DROP TABLE MDM.IMPCT_MC  ;
DROP TABLE USER_WORK.MATCHD_CNSMR_PRSNA_TRT_MATCH1  ;

CREATE TABLE REGIS_PRSNA_TEMP_USA AS (SEL * FROM REGIS_PRSNA_TEMP)WITH NO DATA
 PRIMARY INDEX ( MKTNG_PGM_NBR,REGIS_CNSMR_ID_VAL,SYS_TARGET_ID ,LEGAL_ENT_NBR );
 
CREATE SET TABLE USER_WORK.MATCHD_CNSMR_PRSNA_TRT_MATCH1 ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      MATCHD_CNSMR_PRSNA_ID INTEGER NOT NULL,
      LEGAL_ENT_NBR SMALLINT NOT NULL,
      TRT_NBR SMALLINT,
      MATCHD_PRSNA_TRT_DATE DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      MATCHD_PRSNA_TRT_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('MEDIUM','HIGH','Low','          1','Yes','          2','A = County in one of the 21st largest MSAs','          3','Western European','At least 1 married','          4','E1=English','Unknown gender present','# of household credit cards recently Increased','Health & Beauty Products','Definite Owner','At least 1 single','Home Improvements/DIY','Contests/Sweepstakes','Travel in the USA','High school','Two adults','Magazines','# of household credit cards recently Decreased','Cruise Ship Vacation','35-44 years old','Home Furnishinig','Some college','Leisure Travel','Children no longer present within household','Vitamins & Supplements','SFDU','Any','Magazine never received','Cooking','Gardening','Walking for Health','Probable Owner','Automotive Work','Sewing/Needlework/Knitting','Wildlife/Environmental Causes','Married','D = Any other counties','Bible/Devotional','45-54 years old','Self Improvement Courses','One adult','25-34 years old','Best Selling Fiction','Hunting/Shooting','D1 = Below Average Profit','Probable Renter','Apparel','No','          7','          8','Magazine BLC 4-5 No','Childrens Products','Magazine BLC HD No','Cooking/Culinary','Camping/Hiking','International Travel','Life Insurance','55-64 years old','C2 = Average Profit Margin','C1 = Average Profit Margin','Magazine BLC 2 No','A1 = Best Profit Margin','Casino Gambling','Gourmet Foods','Investments','1','Videos/DVD','          5','B2 = Above Average Profit','Crafts','6-10 yrs','          6','Households Donating $100 and over_M','25+ months','Professional/Technical','Cultural/Arts Events','B1 = Above Average Profit','Childrens Books','Fishing','81-100%','E1 = Poor Profit Margin','Insurance','Switched','Three adults','41-60%','D2 = Below Average Profit','Top 20%','Single','Baking','21-40%','A2 = Best Profit Margin','Medical or Health','61-80%','Stocks or Bonds','Female present','          9','E2 = Poor Profit Margin','D3 = Below Average Profit','Books','Less than $14,999','Photography','Interior Decorating','Competitor Medium','Entertainment','3-5 yrs','College','E3 = Poor Profit Margin','11-15 yrs','Natural Foods','Country','         12','03','         10','         18','Male present','Provincial capital','         19','Running/Jogging','         13','Some high school or less','65-74 years old','Magazine EDP 37 received','Political Conservative','Boating/Sailing','RV Vacations','Career Advancement Courses','University Below Bachelors Degree_M','         11','         14','Competitor Low','Dog','         15','         16','         38','         24','$30,000 - $34,999','         46','Female and Unknown gender present','A = Assimilated - English Speaking','Motocycle Riding','African American','2','         26','         33','         62','Gifts','         22','         27','         17','         48','         31','SIEBAS','INTERMARCHE SUPER','Male and Unknown gender present','Hispanic','         34','         35','         23','         25','         44','K4=Kiddie Kastles','Country lifestyle','Medical Coverage','Woodworking','$20,000 - $24,999','         28','         32','         65','Mutual Funds','20+ yrs','$40,000 - $44,999','         75','         30','         21','         42','Scrapbooking','         36','         39','         68','         57','Tradesman/Machine Oper / Laborer','Food','         72','White Collar_M','Skiing/Snowboarding','         59','         29','         58','$15,000 - $19,999','         40','CENTRE E.LECLERC','         69','         41','Apprenticeship or Trades_M','         54','         50','$45,000 - $49,999','         99','         78','         49','         45','3','         52','         20','         55','Tampax Competitor Medium','         56','Both married and single','         89','Magazine EDP 36 received','         81','         92','University Bachelors Degree_M','         87','         51','         53','$25,000 - $29,999','         37','High School Diploma_M','         97','Cat','B1=Big Spender Parents','         86','Y','         73','         82','$35,000 - $39,999','$55,000 - $59,999','         77','         95','Facebook','         67','01','         83','16-20 yrs','         84','Pampers - Low','02','1-2 yrs','         93','         96','C = Bilingual - Native Language Primary','         47','         60','         61','         91'),
      MATCHD_PRSNA_TRT_SEQ_NBR SMALLINT DEFAULT 1  COMPRESS (1 ,2 ,3 ),
      DATA_SRCE_NBR INTEGER COMPRESS (7798 ,1480 ,1277 ),
      SYS_SOURCE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('              62969.','              63269.','              62569.','              63669.','              47569.','              64669.','              63869.','              64869.','              64569.','              64169.','              64269.','              65269.','              63769.','              62769.','              63969.','              63569.','              63069.','              64369.','              63469.','              62269.','              47469.','              63369.','              62669.','              62869.','              62369.','              63169.','              47369.','              64069.','              64469.','              65169.','              64769.','              64969.','              47269.','              65069.','              65369.','              47169.','              65469.','              47069.','              54669.','              46969.','              46869.','              46769.','              46669.','              54569.','              46369.','              46569.','              46469.','              46069.','              54269.','              45969.','              54169.','              46169.','              45869.','              45769.','              61969.','              61869.','              45669.','              45569.','              45469.','              46269.','              45369.','              49769.','              45269.','              45169.','              45069.','              44969.','              50269.','              50069.','              62069.','              44869.','              65669.','              44769.','              65769.','              44669.','              44569.','              44469.','              44369.','              44269.','              57569.','              56369.','              49069.','              65569.','              56169.','              61269.','              48969.','              49169.','              43569.','              62169.','              48869.','              62469.','              48769.','              61569.','              44169.','              61469.','              50169.','              48669.','              43469.','              48169.','              47769.','              65969.','              47669.','              49569.','              61169.','100391','100791','357191','358291','348491','343891','348191','92591','99991','356891','316291','318791','319391','319691','319991','322891','              65869.','348991','323191','324091','306891','307291','101191','102491','101591','332091','340791','349391','332791','333091','              56469.','339891','336191','339591','311591','335891','307091','102991','              57469.','85991','323691','306691','315491','343391','              43969.','46791','315991','324491','319091','91791','61391','82891','312291','61091','46091','46591','59491','311991','46991','311891','58791','61691','47191','60391','49691','56491','54591','86791','54291','              57169.','47591','55091','55791','52491','58491','49491','62891','47891','53391','60191','55491','282991','69091','71191','50591','63791','69391','64891','63191','71791','72391','298891','50091','50891','114591','45691','              61669.','48991','53691','343291','64091','288691','284191','70991','287791','52191','288091','72591','288391','283891','60691','48691','288991','283391','              57669.','64691','111891','              44069.','86191','32991','312191','64391','298591','289291','297791','362191','297491','72891','70691','315791','298291','48291','324391','298091','361191','349291','37491','30891','32191','358591','408291','407491','34991','68591','70291','66691','289591','44691','72091','              66069.','38391','92191'),
      SYS_TARGET_ID INTEGER COMPRESS ,
      SYS_AUTH_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_CREATION_DATE TIMESTAMP(0) COMPRESS ,
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_LAST_MODIFIED_BY VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'EtlUser',
      SYS_NC_TYPE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_ERR_CODE VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS )
PRIMARY INDEX MATCHD_CNSMR_PRSNA_NUPI1 ( MATCHD_CNSMR_PRSNA_ID ,LEGAL_ENT_NBR )
PARTITION BY LEGAL_ENT_NBR ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL K1
/*UPDATE MDM.REGIS_PRSNA   
SET GVN_NAME_ALIAS=FAMLY_NAME_ALIAS
,FAMLY_NAME_ALIAS=GVN_NAME_ALIAS
WHERE GVN_NAME IN ('BILL') AND FAMLY_NAME_ALIAS ='WILLIAM' 
AND LEGAL_ENT_NBR IN (15,42);*/
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
--Start Finding the impacted rows
.LABEL L0A1
CREATE  TABLE   MDM.MATCH_DATA as
(
NONSEQUENCED TRANSACTIONTIME
SEL REGIS_PRSNA_ID,data_srce_nbr,MKTNG_PGM_NBR,REGIS_CNSMR_ID_VAL 
FROM MDM.REGIS_PRSNA RP
WHERE MKTNG_PGM_NBR IN (SEL MKTNG_PGM_NBR FROM MDM.MKTNG_PGM WHERE LEGAL_ENT_NBR IN (15,42))
AND  gvn_name IN ('Bill') AND famly_name_alias ='William' 
) WITH DATA 
PRIMARY INDEX ( MKTNG_PGM_NBR,REGIS_PRSNA_ID )
PARTITION BY MKTNG_PGM_NBR
;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L0A
 CREATE TABLE MDM.IMPCT_HSHLD AS ( 
SEL MC2.HSHLD_PRSNA_ID
FROM MDM.MATCHD_CNSMR_PRSNA MC2
GROUP BY 1
WHERE MC2.LEGAL_ENT_NBR IN (15,42)
HAVING COUNT(DISTINCT MC2.MATCHD_CNSMR_PRSNA_ID) >1
)
 WITH DATA
PRIMARY INDEX(HSHLD_PRSNA_ID);
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
  .LABEL L0B
COLLECT STATS MDM.IMPCT_HSHLD
COLUMN HSHLD_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
  .LABEL L0C
CREATE TABLE MDM.IMPCT_REGIS2 AS ( 
SEL  RP2.MKTNG_PGM_NBR,RP2.REGIS_PRSNA_ID,RP2.MATCHD_CNSMR_PRSNA_ID,MC2.HSHLD_PRSNA_ID
FROM MDM.REGIS_PRSNA  RP2

JOIN MDM.MATCHD_CNSMR_PRSNA MC2
ON  RP2.MATCHD_CNSMR_PRSNA_ID = MC2.MATCHD_CNSMR_PRSNA_ID
AND RP2.LEGAL_ENT_NBR = MC2.LEGAL_ENT_NBR

WHERE RP2.LEGAL_ENT_NBR IN (15,42)
AND MC2.HSHLD_PRSNA_ID IN 
            ( 
            SEL MC2.HSHLD_PRSNA_ID
            FROM MDM.IMPCT_HSHLD MC2
            )
AND TRIM(COALESCE(MC2.GVN_NAME,'')) <> ''
AND ((MC2.LEGAL_ENT_NBR,MC2.GVN_NAME) IN (SEL 15,'Bill' FROM ALIAS_NAME_RECODE WHERE RECODE_TYPE='F')
OR (MC2.LEGAL_ENT_NBR,MC2.GVN_NAME) IN (SEL 15,'William' FROM ALIAS_NAME_RECODE WHERE RECODE_TYPE='F'))
 )
  WITH DATA
 PRIMARY INDEX(MKTNG_PGM_NBR,REGIS_PRSNA_ID)
PARTITION BY MKTNG_PGM_NBR;
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  
   .LABEL L0D
 COLLECT STATS MDM.IMPCT_REGIS2
 COLUMN HSHLD_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

   .LABEL L0D1 
  CREATE TABLE MDM.IMPCT_MC AS ( 
 SEL MC2.HSHLD_PRSNA_ID
 FROM MDM.IMPCT_REGIS2 MC2
 GROUP BY 1
 HAVING COUNT(DISTINCT MC2.MATCHD_CNSMR_PRSNA_ID) >1
 )
  WITH DATA
 PRIMARY INDEX(HSHLD_PRSNA_ID);
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
    .LABEL L0D2
  COLLECT STATS MDM.IMPCT_MC
  COLUMN HSHLD_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
      .LABEL L0D3
 DEL FROM MDM.IMPCT_REGIS2
 WHERE HSHLD_PRSNA_ID NOT IN 
 (SEL HSHLD_PRSNA_ID
 FROM MDM.IMPCT_MC);
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
       .LABEL L0D4
  COLLECT STATS MDM.IMPCT_REGIS2
  COLUMN MKTNG_PGM_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
    .LABEL L0E
  COLLECT STATS MDM.IMPCT_REGIS2
  COLUMN REGIS_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
    .LABEL L0F
  COLLECT STATS MDM.MATCH_DATA
  COLUMN MKTNG_PGM_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
    .LABEL L0G
  COLLECT STATS MDM.MATCH_DATA
  COLUMN REGIS_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
     .LABEL L0H
DEL FROM MDM.MATCH_DATA
WHERE (MKTNG_PGM_NBR,REGIS_PRSNA_ID) NOT IN 
(SEL MKTNG_PGM_NBR,REGIS_PRSNA_ID
FROM MDM.IMPCT_REGIS2);
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
    .LABEL L0I
  COLLECT STATS MDM.MATCH_DATA
  COLUMN MKTNG_PGM_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
    .LABEL L0J
  COLLECT STATS MDM.MATCH_DATA
  COLUMN REGIS_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE; 
 
 .LABEL L1


/*
CREATE TABLE USER_WORK.MATCHD_CNSMR_PRSNA_TRT_MATCH
AS ICRM_TBL.MATCHD_CNSMR_PRSNA_TRT WITH NO DATA;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L2

ALTER TABLE USER_WORK.MATCHD_CNSMR_PRSNA_TRT_MATCH
ADD REGIS_PRSNA_ID INTEGER NOT NULL,
ADD MKTNG_PGM_NBR INTEGER NOT NULL;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L3
*/
CREATE MULTISET TABLE USER_WORK.MATCHD_CNSMR_PRSNA_TRT_MATCH ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      MATCHD_CNSMR_PRSNA_ID INTEGER NOT NULL,
      LEGAL_ENT_NBR SMALLINT NOT NULL,
      TRT_NBR SMALLINT,
      MATCHD_PRSNA_TRT_DATE DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      MATCHD_PRSNA_TRT_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('MEDIUM','HIGH','Low','          1','Yes','          2','A = County in one of the 21st largest MSAs','          3','Western European','At least 1 married','          4','E1=English','Unknown gender present','# of household credit cards recently Increased','Health & Beauty Products','Definite Owner','At least 1 single','Home Improvements/DIY','Contests/Sweepstakes','Travel in the USA','High school','Two adults','Magazines','# of household credit cards recently Decreased','Cruise Ship Vacation','35-44 years old','Home Furnishinig','Some college','Leisure Travel','Children no longer present within household','Vitamins & Supplements','SFDU','Any','Magazine never received','Cooking','Gardening','Walking for Health','Probable Owner','Automotive Work','Sewing/Needlework/Knitting','Wildlife/Environmental Causes','Married','D = Any other counties','Bible/Devotional','45-54 years old','Self Improvement Courses','One adult','25-34 years old','Best Selling Fiction','Hunting/Shooting','D1 = Below Average Profit','Probable Renter','Apparel','No','          7','          8','Magazine BLC 4-5 No','Childrens Products','Magazine BLC HD No','Cooking/Culinary','Camping/Hiking','International Travel','Life Insurance','55-64 years old','C2 = Average Profit Margin','C1 = Average Profit Margin','Magazine BLC 2 No','A1 = Best Profit Margin','Casino Gambling','Gourmet Foods','Investments','1','Videos/DVD','          5','B2 = Above Average Profit','Crafts','6-10 yrs','          6','Households Donating $100 and over_M','25+ months','Professional/Technical','Cultural/Arts Events','B1 = Above Average Profit','Childrens Books','Fishing','81-100%','E1 = Poor Profit Margin','Insurance','Switched','Three adults','41-60%','D2 = Below Average Profit','Top 20%','Single','Baking','21-40%','A2 = Best Profit Margin','Medical or Health','61-80%','Stocks or Bonds','Female present','          9','E2 = Poor Profit Margin','D3 = Below Average Profit','Books','Less than $14,999','Photography','Interior Decorating','Competitor Medium','Entertainment','3-5 yrs','College','E3 = Poor Profit Margin','11-15 yrs','Natural Foods','Country','         12','03','         10','         18','Male present','Provincial capital','         19','Running/Jogging','         13','Some high school or less','65-74 years old','Magazine EDP 37 received','Political Conservative','Boating/Sailing','RV Vacations','Career Advancement Courses','University Below Bachelors Degree_M','         11','         14','Competitor Low','Dog','         15','         16','         38','         24','$30,000 - $34,999','         46','Female and Unknown gender present','A = Assimilated - English Speaking','Motocycle Riding','African American','2','         26','         33','         62','Gifts','         22','         27','         17','         48','         31','SIEBAS','INTERMARCHE SUPER','Male and Unknown gender present','Hispanic','         34','         35','         23','         25','         44','K4=Kiddie Kastles','Country lifestyle','Medical Coverage','Woodworking','$20,000 - $24,999','         28','         32','         65','Mutual Funds','20+ yrs','$40,000 - $44,999','         75','         30','         21','         42','Scrapbooking','         36','         39','         68','         57','Tradesman/Machine Oper / Laborer','Food','         72','White Collar_M','Skiing/Snowboarding','         59','         29','         58','$15,000 - $19,999','         40','CENTRE E.LECLERC','         69','         41','Apprenticeship or Trades_M','         54','         50','$45,000 - $49,999','         99','         78','         49','         45','3','         52','         20','         55','Tampax Competitor Medium','         56','Both married and single','         89','Magazine EDP 36 received','         81','         92','University Bachelors Degree_M','         87','         51','         53','$25,000 - $29,999','         37','High School Diploma_M','         97','Cat','B1=Big Spender Parents','         86','Y','         73','         82','$35,000 - $39,999','$55,000 - $59,999','         77','         95','Facebook','         67','01','         83','16-20 yrs','         84','Pampers - Low','02','1-2 yrs','         93','         96','C = Bilingual - Native Language Primary','         47','         60','         61','         91'),
      MATCHD_PRSNA_TRT_SEQ_NBR SMALLINT DEFAULT 1  COMPRESS (1 ,2 ,3 ),
      DATA_SRCE_NBR INTEGER COMPRESS (7798 ,1480 ,1277 ),
      SYS_SOURCE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('              62969.','              63269.','              62569.','              63669.','              47569.','              64669.','              63869.','              64869.','              64569.','              64169.','              64269.','              65269.','              63769.','              62769.','              63969.','              63569.','              63069.','              64369.','              63469.','              62269.','              47469.','              63369.','              62669.','              62869.','              62369.','              63169.','              47369.','              64069.','              64469.','              65169.','              64769.','              64969.','              47269.','              65069.','              65369.','              47169.','              65469.','              47069.','              54669.','              46969.','              46869.','              46769.','              46669.','              54569.','              46369.','              46569.','              46469.','              46069.','              54269.','              45969.','              54169.','              46169.','              45869.','              45769.','              61969.','              61869.','              45669.','              45569.','              45469.','              46269.','              45369.','              49769.','              45269.','              45169.','              45069.','              44969.','              50269.','              50069.','              62069.','              44869.','              65669.','              44769.','              65769.','              44669.','              44569.','              44469.','              44369.','              44269.','              57569.','              56369.','              49069.','              65569.','              56169.','              61269.','              48969.','              49169.','              43569.','              62169.','              48869.','              62469.','              48769.','              61569.','              44169.','              61469.','              50169.','              48669.','              43469.','              48169.','              47769.','              65969.','              47669.','              49569.','              61169.','100391','100791','357191','358291','348491','343891','348191','92591','99991','356891','316291','318791','319391','319691','319991','322891','              65869.','348991','323191','324091','306891','307291','101191','102491','101591','332091','340791','349391','332791','333091','              56469.','339891','336191','339591','311591','335891','307091','102991','              57469.','85991','323691','306691','315491','343391','              43969.','46791','315991','324491','319091','91791','61391','82891','312291','61091','46091','46591','59491','311991','46991','311891','58791','61691','47191','60391','49691','56491','54591','86791','54291','              57169.','47591','55091','55791','52491','58491','49491','62891','47891','53391','60191','55491','282991','69091','71191','50591','63791','69391','64891','63191','71791','72391','298891','50091','50891','114591','45691','              61669.','48991','53691','343291','64091','288691','284191','70991','287791','52191','288091','72591','288391','283891','60691','48691','288991','283391','              57669.','64691','111891','              44069.','86191','32991','312191','64391','298591','289291','297791','362191','297491','72891','70691','315791','298291','48291','324391','298091','361191','349291','37491','30891','32191','358591','408291','407491','34991','68591','70291','66691','289591','44691','72091','              66069.','38391','92191'),
      SYS_TARGET_ID INTEGER COMPRESS ,
      SYS_AUTH_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_CREATION_DATE TIMESTAMP(0) COMPRESS ,
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_LAST_MODIFIED_BY VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'EtlUser',
      SYS_NC_TYPE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_ERR_CODE VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      REGIS_PRSNA_ID INTEGER NOT NULL,
      MKTNG_PGM_NBR INTEGER NOT NULL
      )
PRIMARY INDEX MATCHD_CNSMR_PRSNA_NUPI ( REGIS_PRSNA_ID,MKTNG_PGM_NBR )
PARTITION BY MKTNG_PGM_NBR ;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L3

INSERT INTO USER_WORK.MATCHD_CNSMR_PRSNA_TRT_MATCH
SEL A.*,B.REGIS_PRSNA_ID,B.MKTNG_PGM_NBR FROM ICRM_TBL.MATCHD_CNSMR_PRSNA_TRT A 
INNER JOIN MDM.REGIS_PRSNA B
ON A.MATCHD_CNSMR_PRSNA_ID=B.MATCHD_CNSMR_PRSNA_ID
AND A.LEGAL_ENT_NBR=B.LEGAL_ENT_NBR
WHERE A.LEGAL_ENT_NBR in(15,42)
AND (B.MKTNG_PGM_NBR,B.REGIS_PRSNA_ID) IN (
SEL MKTNG_PGM_NBR,REGIS_PRSNA_ID FROM MDM.MATCH_DATA);
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L4

 CREATE TABLE MDM.PRSNA_STG_MATCH AS
(SEL A.* FROM 
   MDM.REGIS_PRSNA A
   INNER JOIN MDM.MATCH_DATA B
   ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
   AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
) 
WITH DATA
PRIMARY INDEX (MKTNG_PGM_NBR,REGIS_PRSNA_ID)
;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L5

 COLLECT STATS MDM.PRSNA_STG_MATCH
COLUMN MKTNG_PGM_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L6
COLLECT STATS MDM.PRSNA_STG_MATCH
COLUMN REGIS_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L7


CREATE TABLE MDM.PRSNA_POSTL_ADDR_STG_MATCH AS
(SEL A.* FROM 
   MDM.PRSNA_POSTL_ADDR_ORIG A
   INNER JOIN MDM.MATCH_DATA B
   ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
   AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
) 
WITH DATA
PRIMARY INDEX (MKTNG_PGM_NBR,REGIS_PRSNA_ID)
;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L8

COLLECT STATS MDM.PRSNA_POSTL_ADDR_STG_MATCH
COLUMN MKTNG_PGM_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L9
COLLECT STATS MDM.PRSNA_POSTL_ADDR_STG_MATCH
COLUMN REGIS_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L10

CREATE TABLE MDM.PRSNA_EMAIL_ADDR_STG_MATCH AS
(SEL A.MKTNG_PGM_NBR,A.REGIS_PRSNA_ID,EMAIL_ADDR_TXT FROM 
   mdm.REGIS_PRSNA_EMAIL_ADDR A
   INNER JOIN MDM.MATCH_DATA B
   ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
   AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
) 
WITH DATA
PRIMARY INDEX (MKTNG_PGM_NBR,REGIS_PRSNA_ID)
;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L11

COLLECT STATS MDM.PRSNA_EMAIL_ADDR_STG_MATCH
COLUMN MKTNG_PGM_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L12
COLLECT STATS MDM.PRSNA_EMAIL_ADDR_STG_MATCH
COLUMN REGIS_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L13

CREATE TABLE MDM.PRSNA_PHONE_STG_MATCH AS
(SEL A.MKTNG_PGM_NBR,A.REGIS_PRSNA_ID
   ,PHONE_EXTSN_NUM,FULL_PHONE_NUM,PHONE_LINE_NBR  
  ,PHONE_AREA_NBR,PHONE_EXCHG_NBR,PHONE_CNTRY_NBR  FROM 
   mdm.regis_prsna_phone A
   INNER JOIN MDM.MATCH_DATA B
   ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
   AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
) 
WITH DATA
PRIMARY INDEX (MKTNG_PGM_NBR,REGIS_PRSNA_ID)
;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L14

COLLECT STATS MDM.PRSNA_PHONE_STG_MATCH
COLUMN MKTNG_PGM_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L15
COLLECT STATS MDM.PRSNA_PHONE_STG_MATCH
COLUMN REGIS_PRSNA_ID;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L16


DELETE FROM MDM.TSS_CLEANSE_INPUT1_USA;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L55

INSERT INTO MDM.TSS_CLEANSE_INPUT1_USA
(LEGAL_ENT_NBR                 
,MKTNG_PGM_NBR                 
,REGIS_CNSMR_ID_VAL            
,NAME_PREFX_TXT                
,GVN_NAME                      
,MID_NAME                      
,FAMLY_NAME                    
,NAME_SUFFX_TXT                
,FULL_NAME                     
,GENDR_IND                     
,BRTH_DATE                     
,ADDR_LINE_1_TXT               
,ADDR_LINE_2_TXT               
,ADDR_LINE_3_TXT               
,STRET_NUM                     
,STRET_NAME                    
,APT_NUM                       
,PO_BOX_NUM                    
,CITY_NAME                     
,POSTL_AREA_CODE               
,TERR_NAME                     
,CNTRY_NAME                    
,DPEND_NAME                    
,PET_NAME                      
,WIN_KEY                       
,SYNC_STATUS                   
,USER_NAME                     
,LANG_CODE                     
,SYS_SOURCE                    
,SYS_NC_TYPE                   
,SYS_CREATION_DATE     
,SYS_TARGET_ID
,EMAIL_ADDR_TXT                
,PHONE_EXTSN_NUM               
,FULL_PHONE_NUM                
,PHONE_LINE_NBR                
,PHONE_AREA_NBR                
,PHONE_EXCHG_NBR               
,PHONE_CNTRY_NBR               
,PRSNA_REG_DT       
,ADDRESS_CONTACT
,ADDRESS_SUBSCRPTN
,EMAIL_CONTACT
,EMAIL_SUBSCRPTN
,PHONE_CONTACT
,PHONE_SUBSCRPTN
)
SELECT DISTINCT
   MKTNG_PGM_1.LEGAL_ENT_NBR
  ,PRSNA_STG_1.MKTNG_PGM_NBR
  ,PRSNA_STG_1.REGIS_CNSMR_ID_VAL
  ,PRSNA_STG_1.NAME_PREFX_TXT
  ,PRSNA_STG_1.GVN_NAME
  ,PRSNA_STG_1.MID_NAME
  ,PRSNA_STG_1.FAMLY_NAME
  ,PRSNA_STG_1.NAME_SUFFX_TXT
  ,PRSNA_STG_1.FULL_NAME
  ,CASE WHEN  (PRSNA_STG_1.GENDR_IND NOT IN ('F','U','M') OR PRSNA_STG_1.GENDR_IND IS NULL ) 
THEN 'U' ELSE PRSNA_STG_1.GENDR_IND END AS GENDR_IND
  ,PRSNA_STG_1.BRTH_DATE
  ,PRSNA_POSTL_ADDR_STG_1.ADDR_LINE_1_TXT
  ,PRSNA_POSTL_ADDR_STG_1.ADDR_LINE_2_TXT
  ,PRSNA_POSTL_ADDR_STG_1.ADDR_LINE_3_TXT
  ,PRSNA_POSTL_ADDR_STG_1.STRET_NUM
  ,PRSNA_POSTL_ADDR_STG_1.STRET_NAME
  ,PRSNA_POSTL_ADDR_STG_1.APT_NUM
  ,PRSNA_POSTL_ADDR_STG_1.PO_BOX_NUM
  ,PRSNA_POSTL_ADDR_STG_1.CITY_NAME
  ,PRSNA_POSTL_ADDR_STG_1.POSTL_AREA_CODE
  ,PRSNA_POSTL_ADDR_STG_1.TERR_NAME
  ,COALESCE(TRIM(PRSNA_POSTL_ADDR_STG_1.CNTRY_INFO_TXT),TRIM(PRSNA_STG_1.CNTRY_CODE),'') AS CNTRY_NAME
  ,'' DPEND_NAME
  ,'' PET_NAME
  ,''  WIN_KEY
  ,'' SYNC_STATUS
  ,PRSNA_STG_1.CNSMR_USER_NAME USER_NAME
  ,PRSNA_STG_1.LANG_CODE
  ,COALESCE(TRIM(CAST(CAST(PRSNA_STG_1.SYS_SOURCE AS INTEGER) AS VARCHAR(20))),'') AS SYS_SOURCE
 ,PRSNA_STG_1.SYS_NC_TYPE    
 ,PRSNA_STG_1.SYS_CREATION_DATE AS SYS_CREATION_DATE
 , PRSNA_STG_1.SYS_TARGET_ID AS SYS_TARGET_ID
  ,PRSNA_EMAIL_ADDR_STG_1.EMAIL_ADDR_TXT AS EMAIL_ADDR_TXT_1
  ,PRSNA_PHONE_STG_1.PHONE_EXTSN_NUM AS PHONE_EXTSN_NUM_1
  ,PRSNA_PHONE_STG_1.FULL_PHONE_NUM AS FULL_PHONE_NUM_1
  ,PRSNA_PHONE_STG_1.PHONE_LINE_NBR  AS PHONE_LINE_NBR_1
  ,PRSNA_PHONE_STG_1.PHONE_AREA_NBR  AS PHONE_AREA_NBR_1
  ,PRSNA_PHONE_STG_1.PHONE_EXCHG_NBR AS PHONE_EXCHG_NBR_1
  ,PRSNA_PHONE_STG_1.PHONE_CNTRY_NBR AS PHONE_CNTRY_NBR_1
  , CAST(CAST(PRSNA_STG_1.REGIS_DATE                     AS VARCHAR(19)) AS TIMESTAMP(0))
,PRSNA_POSTL_ADDR_STG_1.CNTCT_POINT_CATEG_CODE AS ADDRESS_CONTACT
  ,'' ADDRESS_SUBSCRPTN
,'' EMAIL_CONTACT
 ,'' EMAIL_SUBSCRPTN
 ,'' PHONE_CONTACT
,'' PHONE_SUBSCRPTN  
 
   FROM MDM.PRSNA_STG_MATCH PRSNA_STG_1
   
  INNER JOIN MDM.MKTNG_PGM MKTNG_PGM_1
     ON PRSNA_STG_1.MKTNG_PGM_NBR = MKTNG_PGM_1.MKTNG_PGM_NBR
    AND MKTNG_PGM_1.LEGAL_ENT_NBR IN (15,42)

   LEFT OUTER JOIN 
   MDM.PRSNA_POSTL_ADDR_STG_MATCH PRSNA_POSTL_ADDR_STG_1
     ON PRSNA_STG_1.MKTNG_PGM_NBR = PRSNA_POSTL_ADDR_STG_1.MKTNG_PGM_NBR
    AND PRSNA_STG_1.REGIS_PRSNA_ID = PRSNA_POSTL_ADDR_STG_1.REGIS_PRSNA_ID
    
LEFT OUTER JOIN
   MDM.PRSNA_EMAIL_ADDR_STG_MATCH PRSNA_EMAIL_ADDR_STG_1
     ON PRSNA_STG_1.MKTNG_PGM_NBR = PRSNA_EMAIL_ADDR_STG_1.MKTNG_PGM_NBR
    AND PRSNA_STG_1.REGIS_PRSNA_ID = PRSNA_EMAIL_ADDR_STG_1.REGIS_PRSNA_ID

	LEFT OUTER JOIN
   MDM.PRSNA_PHONE_STG_MATCH PRSNA_PHONE_STG_1
     ON PRSNA_STG_1.MKTNG_PGM_NBR = PRSNA_PHONE_STG_1.MKTNG_PGM_NBR
    AND PRSNA_STG_1.REGIS_PRSNA_ID = PRSNA_PHONE_STG_1.REGIS_PRSNA_ID
 ;
 
 
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L56

COLLECT STATS ON MDM.TSS_CLEANSE_INPUT1_USA
COLUMN MKTNG_PGM_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L57

COLLECT STATS ON MDM.TSS_CLEANSE_INPUT1_USA
COLUMN REGIS_CNSMR_ID_VAL;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L58

COLLECT STATS ON MDM.TSS_CLEANSE_INPUT1_USA
COLUMN (MKTNG_PGM_NBR,REGIS_CNSMR_ID_VAL);
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L59

COLLECT STATS ON MDM.TSS_CLEANSE_INPUT1_USA
COLUMN LEGAL_ENT_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L60


CREATE VOLATILE TABLE EMAIL AS (
SEL B.EMAIL_ADDR_TXT 
FROM 
(SEL EMAIL_ADDR_TXT 
FROM TSS_CLEANSE_INPUT1_USA 
GROUP BY LEGAL_ENT_NBR, MKTNG_PGM_NBR, REGIS_CNSMR_ID_VAL, SYS_TARGET_ID, EMAIL_ADDR_TXT
UNION ALL
SEL EMAIL_ADDR_TXT
FROM REGIS_PRSNA_EMAIL_ADDR
WHERE MKTNG_PGM_NBR IN (SEL MKTNG_PGM_NBR FROM 
MKTNG_PGM WHERE LEGAL_ENT_NBR IN (SEL LEGAL_ENT_NBR FROM 
TSS_CLEANSE_INPUT1_USA))
GROUP BY REGIS_PRSNA_ID, EMAIL_ADDR_TXT
) B
GROUP BY 1
HAVING COUNT(*) >= 50
) WITH DATA
ON COMMIT PRESERVE ROWS
;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L61

DELETE FROM REF_EMAIL_DATA_IGNORE_USA ALL;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L62

INSERT INTO REF_EMAIL_DATA_IGNORE_USA
SEL B.EMAIL_ADDR_TXT 
FROM 
EMAIL B
;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L63

CREATE VOLATILE TABLE PHONE AS (
SEL B.FULL_PHONE_NUM 
FROM 
(SEL FULL_PHONE_NUM
FROM TSS_CLEANSE_INPUT1_USA
GROUP BY LEGAL_ENT_NBR, MKTNG_PGM_NBR, REGIS_CNSMR_ID_VAL, SYS_TARGET_ID, FULL_PHONE_NUM
UNION ALL
SEL FULL_PHONE_NUM
FROM REGIS_PRSNA_PHONE
WHERE MKTNG_PGM_NBR IN (SEL MKTNG_PGM_NBR FROM 
MKTNG_PGM WHERE LEGAL_ENT_NBR IN (SEL LEGAL_ENT_NBR FROM 
TSS_CLEANSE_INPUT1_USA))
GROUP BY REGIS_PRSNA_ID, FULL_PHONE_NUM
) B
GROUP BY 1
HAVING COUNT(*) >= 50
) WITH DATA
ON COMMIT PRESERVE ROWS
;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L64

DELETE FROM REF_PHONE_DATA_IGNORE_USA ALL;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L65

INSERT INTO REF_PHONE_DATA_IGNORE_USA
SEL B.FULL_PHONE_NUM 
FROM 
PHONE B
;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L66

COLLECT STATS REF_EMAIL_DATA_IGNORE_USA
COLUMN EMAIL_ADDR_TXT;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L67

COLLECT STATS REF_PHONE_DATA_IGNORE_USA
COLUMN FULL_PHONE_NUM;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L68

UPDATE TSS_CLEANSE_INPUT1_USA
SET FULL_PHONE_NUM = ''
WHERE FULL_PHONE_NUM IN (SEL FULL_PHONE_NUM
FROM REF_PHONE_DATA_IGNORE_USA);

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L69

UPDATE TSS_CLEANSE_INPUT1_USA
SET EMAIL_ADDR_TXT = ''
WHERE EMAIL_ADDR_TXT IN (SEL EMAIL_ADDR_TXT
FROM REF_EMAIL_DATA_IGNORE_USA);

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L70

DELETE FROM MDM.TSS_MATCH_INPUT_USA ALL;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L71

