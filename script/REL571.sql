.logon $TDPID/$TDUSER,$TDPWD


.SET ERROROUT STDOUT;
.SET SESSION CHARSET 'UTF8';

DATABASE MDM;
.GOTO $Step


.LABEL L1

CREATE SET TABLE DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP1,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      REGIS_PRSNA_ID INTEGER NOT NULL,
      MKTNG_PGM_NBR INTEGER NOT NULL,
      LEGAL_ENT_NBR SMALLINT COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ),
      CNTCT_POINT_CATEG_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('AB','AR'),
      WIN_KEY VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('CN','CL',' ','US00000','BR','MX','TW','AR','US','SG     BL2','MY  JL2','CN20000020','CA','       1 2','AU       1','PE','MY    2','HK     FL2','VE','       2 2','MY5 JL2','SG     0 2','MY  LR2','MY4 JL2','SG       2','       3 2','KR','PH     YY1','HK     FL1','       4 2','CO','       5 2','MY  TM2','HK     CH2','JP8000208','       9 2','SG     1 2','MY8 JL2','HK     SH2','HK     HN2','       6 2','PH     RX1','       8 2','       7 2','HK     TN2','       JL2','HK     RM2','HK     TS2','HK     KN2','PH     MN1','AU     PB2','PH     U 1','CN510000CH','MY  LT2','MY1 JL2','HK     KW2','MY  PR2','HK       1'),
      SUBSCRPTN_OPT_NBR INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,20 ),
      SUBSCRPTN_OPT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('I','O'),
      CNSMR_CHCE_DATETM TIMESTAMP(6),
      PREF_CNTCT_POINT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL DEFAULT 'Y' COMPRESS (' ','Y'),
      ADDR_LINE_1_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      ADDR_LINE_2_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      ADDR_LINE_3_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','1','2','3','5','8','6','10','7','11','9','4','12','15','20','16','18','14','17','19','21','25','22','23','13','30','26','24','28','27','100','35','33','31','32','29','40','36','105','38','101','50','34','110','45','111','37','39','120','104','41','42','55','108','106','200','102','115','103','109','107','43','112','60','51','46','44','201','125','116','47','48','121','52','114','49','65','70','56','205','113','117','123','53','130','300','54','75','210','118','61','57','80','58','119','63','66','62','59','122','301','204','124','150','215','140','208','71','135','202','64','68','220','126','211','90','67','85','209','128','206','131','72','207','203','305','212','88','400','127','77','145','69','95','81','132','76','310','225','401','129','500','133','73','74','160','83','155','78','82','136','141','99','214','216','91','304','213','315','134','79','303','86','151','221','501','84','320','306','309','302','405','217','308','222','87','137','311','89','138','230','96','307','180','600','218','250','165','92','93','98','312','139','142','410','175','505','170','219','144','94','325','143','240','601','404','146','415','97','161','700','148','420','235','147','224','510','152','321','411','156','409','316','223','185','402','149','153','330','408','314','231','406','190','171','245','403','313','154','317','800','701','412','407','605','157','226','520','233','508','163','228','181','515'),
      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','Po Box','Main','2nd','3rd','4th','5th','Park','Washington','6th','7th','1st','Maple','8th','10th','9th','Oak','Lincoln','Walnut','Broadway','Elm','11th','Pine','12th','Cedar','Jefferson','Highland','Church','14th','River','Chestnut','Madison','13th','15th','16th','Jackson','Lake','Ridge','Franklin','Central','Sunset','Rr 1','17th','18th','Center','North','Forest','19th','High','Willow','Yyyyya','Wilson','West','20th','State','Union','21st','King','College','Prospect','Adams','Woodland','Cherry','Grand','South','23rd','Magnolia','22nd','24th','Grant','Hickory','Monroe','Harrison','Meadow','Lakeview','Orchard','Spruce','Riverside','Spring','25th','Liberty','Locust','Sycamore','Evergreen','Fairview','Hillcrest','Laurel','Taylor','Poplar','Valley','27th','Grove','Mill','Linden','28th','Pleasant','University','Summit','26th','Birch','Hamilton','Victoria','Johnson','Virginia','Hillside','Dogwood','East','Hill','30th','Market','Rr 2','29th','Clark','Village','Columbia','Oakwood','Country Club','Cypress','34th','Smith','Broad','35th','Elizabeth','James','Williams','32nd','Roosevelt','Windsor','Lee','Miller','Lexington','31st','Ash','Greenwood','Thomas','Oxford','Michigan','36th','Cambridge','33rd','Cleveland','Charles','Green','Davis','Edgewood','Garfield','Clinton','Douglas','Hawthorne','Wellington','Sheridan','Brown','37th','Holly','Howard','Scott','Lafayette','38th','Richmond','Vine','Garden','Pearl','Heritage','40th','Lawrence','Lakeshore','39th','Marshall','Belmont','42nd','Rose','Crescent','Grandview','41st','Mulberry','Olive','Martin','Sherman','Pennsylvania','43rd','Glenwood','Colonial','45th','Warren','48th','Sherwood','Morgan','Front','Fairway','Water','Arlington','Campbell','Hampton','Sunrise','44th','Wood','Allen','Kennedy','Division','46th','Russell','Westwood','Delaware','Bay','Shore','60th','Ridgewood','Wildwood','Lakeside','Principale','Ocean','Beech','Walker','Aspen','Elmwood','52nd','47th','Mountain','York','50th','Parkview','49th','Anderson','51st','Hemlock','Cherokee','Hudson','56th'),
      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','2','3','1','4','5','Apt 2','Apt 1','6','7','Apt A','Apt 3','Apt B','8','Apt 4','0','9','10','11','12','Apt C','Apt D','Apt 5','13','Apt 6','A','14','Apt 7','15','Apt 101','Apt 8','Apt 102','Apt 201','B','Apt 202','16','Apt 103','Apt 203','Apt 104','Apt 204','17','20','Apt 9','Suite 1','Apt 10','18','Suite 2','Fl 2','Apt E','Apt 11','Apt F','23','21','Apt 12','19','22','25','Grd Fl','Apt 301','2/F','Apt 302','U 2','U 1','Suite 3','Apt 105','30','26','Apt 205','Unit B','Unit A','101','34','Apt 303','35','Apt 206','Apt 106','Apt 304','1/F','Apt G','45','Fl 1','50','40','27','24','Apt 207','31','28','Apt H','Apt 107','201','Apt 14','36','100','32','33','Apt 208','55','Suite 4','29','Apt 108','Unit 1','U 3','102','Apt 2b','Apt 2a','Apt 15','Apt 1a','60','Unit 2','Apt 16','Apt 13','37','3/F','41','51','38','42','65','70','202','Apt 1b','39','Apt 305','80','44','46','43','75','Suite 5','Apt 306','48','301','52','Apt 3a','Apt 21','Apt 17','54','56','Suite 6','120','90','61','Bsmt','Apt 22','53','47','110','Apt 3b','85','Apt 18','105','Unit C','49','App 1','U 4','Apt 307','Unit 3','App 2','103','4/F','Apt 308','71','95','Apt 20','57','200','58','66','Apt 210','Apt 24','Apt 23','Apt 110','115','Apt 209','Apt 109','150','111','64','62','Apt 2c','67','63','Apt 111','104','81','Apt 211','Apt 19','App 3','130','302','59','72','125','Apt 112','5/F','68','73','140','74','76','77','91','Unit 4','86','Unit D','78','Apt 212','U 5','180','203','Apt 2d','135','160','96','84','Suite 7','Suite A','Apt J','106','Apt 401','Apt 1c','Apt 402','69','82','112','Apt 3c','121','99','79','155','87','88','170','83','App 4','89','145','Suite 101'),
      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','Po Box 14','Po Box 63','Po Box 24','Po Box 2','Po Box 4','Po Box 34','Po Box 53','Po Box 54','Po Box 12','Po Box 22','Po Box 23','Po Box 73','Po Box 44','Po Box 3','Po Box 113','Po Box 13','Po Box 102','Po Box 83','Po Box 92','Po Box 64','Po Box 5','Po Box 104','Po Box 42','Po Box 52','Po Box 84','Po Box 122','Po Box 43','Po Box 123','Po Box 124','Po Box 82','Po Box 11','Po Box 93','Po Box 25','Po Box 32','Po Box 94','Po Box 51','Po Box 74','Po Box 112','Po Box 85','Po Box 65','Po Box 26','Po Box 173','Po Box 33','Po Box 72','Po Box 21','Po Box 36','Po Box 6','Po Box 142','Po Box 133','Po Box 55','Po Box 62','Po Box 103','Po Box 132','Po Box 114','Po Box 35','Po Box 71','Po Box 31','Po Box 152','Po Box 111','Po Box 1','Po Box 41','Po Box 143','Po Box 101','Po Box 81','Po Box 66','Po Box 61','Po Box 134','Po Box 174','Po Box 204','Po Box 125','Po Box 162','Po Box 141','Po Box 144','Po Box 183','Po Box 56','Po Box 121','Po Box 95','Po Box 212','Po Box 91','Po Box 153','Po Box 222','Po Box 96','Po Box 163','Po Box 154','Po Box 126','Po Box 184','Po Box 203','Po Box 115','Po Box 161','Po Box 116','Po Box 193','Po Box 155','Po Box 213','Po Box 214','Po Box 15','Po Box 145','Po Box 131','Po Box 151','Po Box 233','Po Box 172','Po Box 182','Po Box 164','Po Box 86','Po Box 27','Po Box 171','Po Box 156','Po Box 67','Po Box 192','Po Box 45','Po Box 201','Po Box 7','Po Box 234','Po Box 185','Po Box 242','Po Box 37','Po Box 194','Po Box 8','Po Box 75','Po Box 224','Po Box 223','Po Box 282','Po Box 215','Po Box 254','Po Box 87','Po Box 105','Po Box 244','Po Box 264','Po Box 181','Po Box 243','Po Box 175','Po Box 202','Po Box 252','Po Box 57','Po Box 262','Po Box 263','Po Box 146','Po Box 211','Po Box 16','Po Box 46','Po Box 97','Po Box 68','Po Box 221','Po Box 191','Po Box 231','Po Box 294','Po Box 176','Po Box 28','Po Box 232','Po Box 302','Po Box 135','Po Box 274','Po Box 292','Po Box 98','Po Box 88','Po Box 241','Po Box 76','Po Box 253','Po Box 235','Po Box 186','Po Box 303','Po Box 157','Po Box 117','Po Box 354','Po Box 284','Po Box 216','Po Box 251','Po Box 273','Po Box 313','Po Box 106','Po Box 38','Po Box 272','Po Box 205','Po Box 281','Po Box 311','Po Box 301','Po Box 314','Po Box 333','Po Box 293','Po Box 245','Po Box 127','Po Box 165','Po Box 304','Po Box 322','Po Box 187','Po Box 236','Po Box 128','Po Box 206','Po Box 283','Po Box 312','Po Box 334','Po Box 58','Po Box 324','Po Box 344','Po Box 265','Po Box 323','Po Box 261','Po Box 271','Po Box 118','Po Box 207','Po Box 275','Po Box 246','Po Box 295','Po Box 342','Po Box 266','Po Box 147','Po Box 17','Po Box 291','Po Box 136','Po Box 362','Po Box 412','Po Box 352','Po Box 332','Po Box 335','Po Box 195','Po Box 177','Po Box 444','Po Box 363','Po Box 305','Po Box 343','Po Box 384','Po Box 166','Po Box 9','Po Box 383','Po Box 276','Po Box 351','Po Box 353','Po Box 296','Po Box 321','Po Box 158','Po Box 306','Po Box 331','Po Box 364','Po Box 225','Po Box 39','Po Box 10','Po Box 341','Po Box 69','Po Box 403','Po Box 394','Po Box 402','Po Box 217','Po Box 404','Po Box 414','Po Box 148','Po Box 255','Po Box 129','Po Box 372','Po Box 443','Po Box 226','Po Box 355','Po Box 325','Po Box 382','Po Box 433'),
      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','Sao Paulo','Unk','rio de janeiro','Houston','Toronto','Chicago','Mumbai','Salvador','Brooklyn','Singapore','Belo Horizonte','San Antonio','Kuala Lumpur','Jacksonville','cincinnati','Columbus','Philadelphia','Santiago','Las Vegas','Calgary','Los Angeles','Miami','Phoenix','Curitiba','Kln','Recife','Montreal','Winnipeg','Dallas','Orlando','New Delhi','Mississauga','Indianapolis','Springfield','Louisville','Richmond','New York','Ahmedabad','Edmonton','Ciudad De Mexico','Hamilton','Tuen Mun','San Diego','Charlotte','Vancouver','Bronx','Chennai','Nt','Sha Tin','Tampa','Lexington','Saint Louis','Columbia','London','Austin','Hyderabad','Rochester','Kolkata','Cleveland','Scarborough','Brampton','Atlanta','Tucson','Pittsburgh','Bangalore','Baltimore','Fort Worth','Quebec','Arlington','Porto Alegre','Kansas City','Jackson','San Jose','Aurora','Portland','Washington','Sacramento','Raleigh','Burlington','Fortaleza','Goiás','Greenville','Omaha','Canton','Virginia Beach','Hk','Windsor','Milwaukee','Lancaster','Wilmington','Delhi','Dayton','Knoxville','Oklahoma City','Fayetteville','Surrey','Ottawa','Memphis','Madison','Guarulhos','Tai Po','Colorado Springs','Mesa','Tsuen Wan','Salem','Jaipur','Laval','El paso','Nashville','Staten Island','Newark','Campinas','Wichita','Denver','Yuen Long','Monroe','Markham','Toledo','Kwai Chung','Buffalo','Manaus','Franklin','Glendale','Birmingham','Marietta','Espírito Santo','Fresno','Henderson','Alexandria','Tulsa','Detroit','Lincoln','Minneapolis','Pulau Pinang','Fort Wayne','Gainesville','Albuquerque','Victoria','North York','Decatur','Bakersfield','Auburn','Antofagasta','Florence'),
      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','0','100000','200000','201122','510000','135080','518000','523000','528000','300000','610000','430000','215000','1080075','210000','361000','350001','201400','350000','110000','473000','266000','200333','121005','450000','528300','886','201100','528400','310000','8000208','116000','400000','100022','529000','325000','100011','151050','210012','214000','151015','50000','519000','200010','511400','200233','100085','362000','610041','710000','315000','200237','201301','10026','200030','266071','230011','200093','8760854','201204','515000','200120','1540024','510620','300250','311100','511300','100029','100025','515041','100070','528200','100083','452001','200065','363000','350003','200070','510630','200435','315100','200433','310012','201108','100080','200125','215021','450001','200135','200126','410205','100020','300052','201203','200092','530200','250000','330100','430074','122001','410000','350200','351100','215300','570311','100021','154842','30001','200438','250202','200129','550007','710065','350702','130401','611442','10070','201600','404042','200072','530000','200434','63000','130000','110143','430409','50800','100101','100076','710077','100102','213000','100024','150001','510665','200083','221000','101100','350007','302017','430070','132103','380015','110092','312000','380061','101300','110085','100176','71000','100088','314000','200082','100081','100071','200001','100086','200137','350002','710075','110034','200090','200436','521000','201101','529100','200335','2000','200336','100089','200235','510800','710061','100027','100044','341000','361009','315192','471000','100096','150000','1560044','200124','200240','400067','100028','200051','201103','250001','100055','380007','201206','200032','102600','302020','150010','100075','200231','364000','517000','200122','350011','510260','142100','226001','610031','1100','510660','110001','510100','114000','380013','510600','100012','100026','325606','200040','200431','200050','518001','710054','100068','250100','711101','230001','524000','200021','116001','200439','200063','9893126','201300','N/A','518057','510080','211100','200127','156060','400060','200080','650000','215500','350009','518034','530001','200062','710016','100010','102208','300222','518109','201102'),
      TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','California','texas','Florida','Ontario','New York','Ohio','Pennsylvania','SAO PAULO','Illinois','Georgia','North Carolina','Michigan','Quebec','New Jersey','Indiana','Virginia','Tennessee','RIO DE JANEIRO','missouri','Kentucky','Alabama','Wisconsin','Arizona','Massachusetts','South Carolina','MINAS GERAIS','Maryland','Washington','British Columbia','Minnesota','Louisiana','NT','Unknown','Oklahoma','Colorado','Alberta','BAHIA','Connecticut','Kansas','Iowa','Arkansas','JP-13','Oregon','KLN','Mississippi','RIO GRANDE DO SUL','UNK','NSW','PERNAMBUCO','West Virginia','Utah','DISTRITO FEDERAL','Nevada','VIC','PARANA','SELANGOR','HK','Nebraska','Nova Scotia','SANTA CATARINA','QLD','Manitoba','IN-MH','Maine','New Hampshire','JP-14','JP-27','IN-GJ','Idaho','New Mexico','WP KUALA LUMPUR','ShannXi','New Brunswick','PARANÁ','JP-23','Saskatchewan','Rhode Island','Delaware','SP','GOIAS','JP-11','Hawaii','ESPIRITO SANTO','CEARA','IN-TN','JP-12','JP-28','WA','IN-DL','South Dakota','Newfoundland & Labrador','IN-AP','North Dakota','JP-01','RIO GRANDE DO NORTE','IN-UP','MATO GROSSO','Montana','JP-40','SA','PULAU PINANG','IN-RJ','MATO GROSSO DO SUL','Alaska','JOHOR','IN-WB','Vermont','ALAGOAS','SERGIPE','JP-22','AMAZONAS','PARA','IN-HR','IN-KA','PERAK','ESTADO DE MEXICO','Wyoming','JP-26','MARANHAO','JALISCO','District Of Columbia','NEW TERRITORIES','JP-34','RJ','PARÁ','SARAWAK','JP-08','IN-MP','NUEVO LEON','BUENOS AIRES','JP-04','KEDAH','TOCANTINS','JP-21','Prince Edward Island','SABAH','IN-PB','VERACRUZ','JP-24','JP-15','JP-33','MELAKA','PIAUI','NEGERI SEMBILAN','JP-20','JP-09','PUEBLA','JP-25','JP-10','JP-29','JP-44','GUANAJUATO','WILAYAH PERSEKUTUAN','JP-43','SONORA','Puerto Rico','JP-47','TAS','KOWLOON','PAHANG','JP-17','JP-07','HONGKONG','IN-KL','Armed Forces Europe','JP-46','ACT','JP-38','JP-35','RONDONIA','JP-16','SINALOA','COAHUILA','TAMAULIPAS','JP-02','MEXICO','CHIHUAHUA'),
      CITY_CODE INTEGER COMPRESS (908288 ,848128 ,854273 ,828417 ,637697 ,918786 ,908803 ,5 ,873989 ,35078 ,647686 ,833800 ,864011 ,25100 ,617740 ,818956 ,849165 ,657678 ,899086 ,924433 ,843026 ,859156 ,582678 ,23 ,813335 ,24 ,55064 ,667673 ,637722 ,582683 ,848411 ,28 ,864284 ,872988 ,893214 ,918048 ,863265 ,637730 ,20003 ,647715 ,859172 ,35111 ,40 ,864043 ,824109 ,46 ,924462 ,677678 ,847919 ,592688 ,667696 ,592689 ,868914 ,823346 ,824371 ,55094 ,647734 ,667705 ,20025 ,848697 ,30010 ,883773 ,879166 ,832830 ,858175 ,667711 ,30015 ,35135 ,923457 ,862786 ,20037 ,612679 ,30023 ,923720 ,924488 ,863816 ,864328 ,647752 ,20042 ,853583 ,808527 ,35151 ,30032 ,667733 ,832853 ,612694 ,813654 ,843862 ,822872 ,55128 ,582745 ,924506 ,11866 ,829021 ,843358 ,848734 ,647775 ,858465 ,842849 ,868452 ,40036 ,913508 ,622693 ,894053 ,687719 ,888941 ,677742 ,112 ,843889 ,923251 ,807795 ,632692 ,622711 ,809080 ,121 ,20089 ,919162 ,903290 ,888443 ,897915 ,642683 ,857980 ,10108 ,20092 ,908415 ,848255 ,907904 ,667777 ,833154 ,602755 ,823429 ,592774 ,893832 ,843912 ,839049 ,5002 ,10122 ,883338 ,918411 ,762764 ,863117 ,50061 ,652685 ,888974 ,923023 ,819088 ,50064 ,652690 ,1683 ,873876 ,612756 ,863381 ,808342 ,823192 ,652697 ,887963 ,577691 ,642716 ,829085 ,50077 ,672673 ,818850 ,15011 ,893097 ,632745 ,893866 ,652715 ,597678 ,864174 ,817841 ,868274 ,642738 ,863667 ,587699 ,853428 ,924340 ,922805 ,20149 ,878007 ,863161 ,829113 ,682683 ,30139 ,672700 ,832957 ,30143 ,577727 ,607680 ,884160 ,652738 ,908483 ,843459 ,5060 ,40132 ,15045 ,818373 ,587717 ,607686 ,824263 ,853704 ,662728 ,922825 ,692682 ,907978 ,863435 ,692683 ,828876 ,652751 ,727761 ,853714 ,853715 ,35027 ,597716 ,15060 ,692696 ,808922 ,682715 ,878300 ,914140 ,597725 ,617697 ,652769 ,847842 ,809187 ,879075 ,672741 ,692710 ,833510 ,55015 ,587751 ,862953 ,877802 ,692715 ,652780 ,607725 ,637678 ,627695 ,587759 ,497648 ,868593 ,888817 ,813299 ,672758 ,647670 ,822776 ,823033 ,913913 ,862970 ,617725 ,888061 ,637693 ,908285 ,898303 ,55039 ),
      TERR_CODE CHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('        ','ALAGO   ','ALAGOAS ','AMAZO   ','AMAZONAS','AU-NS   ','AU-QL   ','AU-SA   ','AU-VI   ','AU-WA   ','BAHIA   ','BUENO   ','CA-AB   ','CA-BC   ','CA-MB   ','CA-NB   ','CA-NL   ','CA-NS   ','CA-ON   ','CA-PE   ','CA-QC   ','CA-SK   ','CEARA   ','CN-11   ','CN-12   ','CN-13   ','CN-14   ','CN-15   ','CN-21   ','CN-22   ','CN-23   ','CN-31   ','CN-32   ','CN-33   ','CN-34   ','CN-35   ','CN-36   ','CN-37   ','CN-41   ','CN-42   ','CN-43   ','CN-44   ','CN-45   ','CN-46   ','CN-50   ','CN-51   ','CN-52   ','CN-53   ','CN-61   ','CN-62   ','CN-65   ','DISTR   ','DISTRITO','ESPIR   ','ESTAD   ','GOIAS   ','HK      ','HONG    ','IN-AP   ','IN-DL   ','IN-GJ   ','IN-HR   ','IN-KA   ','IN-KL   ','IN-MH   ','IN-MP   ','IN-PB   ','IN-RJ   ','IN-TN   ','IN-UP   ','IN-WB   ','JALIS   ','JOHOR   ','JP-01   ','JP-02   ','JP-03   ','JP-04   ','JP-05   ','JP-06   ','JP-07   ','JP-08   ','JP-09   ','JP-10   ','JP-11   ','JP-12   ','JP-13   ','JP-14   ','JP-15   ','JP-16   ','JP-17   ','JP-18   ','JP-19   ','JP-20   ','JP-21   ','JP-22   ','JP-23   ','JP-24   ','JP-25   ','JP-26   ','JP-27   ','JP-28   ','JP-29   ','JP-30   ','JP-33   ','JP-34   ','JP-35   ','JP-36   ','JP-37   ','JP-38   ','JP-40   ','JP-41   ','JP-42   ','JP-43   ','JP-44   ','JP-45   ','JP-46   ','JP-47   ','KEDAH   ','KLN     ','KOWLO   ','MARAN   ','MARANHÃO','MATO    ','MATO GRO','MELAKA  ','MINAS   ','MINAS GE','NEGERI S','NT      ','NUEVO   ','New T   ','PARA    ','PARAN   ','PARANÁ  ','PARÁ    ','PERAK   ','PERNA   ','PERNAMBU','PIAUI   ','PUEBL   ','PULAU PI','RIO D   ','RIO DE J','RIO G   ','RIO GRAN','RJ      ','SABAH   ','SANTA   ','SANTA CA','SAO P   ','SAO PAUL','SELANGOR','SERGI   ','SERGIPE ','SP      ','Sarawak ','UNK     ','US-AK   ','US-AL   ','US-AR   ','US-AZ   ','US-CA   ','US-CO   ','US-CT   ','US-DC   ','US-DE   ','US-FL   ','US-GA   ','US-HI   ','US-IA   ','US-ID   ','US-IL   ','US-IN   ','US-KS   ','US-KY   ','US-LA   ','US-MA   ','US-MD   ','US-ME   ','US-MI   ','US-MN   ','US-MO   ','US-MS   ','US-MT   ','US-NC   ','US-ND   ','US-NE   ','US-NH   ','US-NJ   ','US-NM   ','US-NV   ','US-NY   ','US-OH   ','US-OK   ','US-OR   ','US-PA   ','US-RI   ','US-SC   ','US-SD   ','US-TN   ','US-TX   ','US-UT   ','US-VA   ','US-VT   ','US-WA   ','US-WI   ','US-WV   ','US-WY   ','USUNK   ','VERAC   ','WP KUALA'),
      CNTRY_CODE CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('     ','ARG  ','AUS  ','BOL  ','BRA  ','CAN  ','CHL  ','CHN  ','COL  ','CRI  ','ECU  ','GTM  ','HKG  ','HND  ','IND  ','JPN  ','KOR  ','LAT  ','MEX  ','MYS  ','NIC  ','NZL  ','PAN  ','PER  ','PHL  ','SGP  ','SLV  ','TUR  ','TWN  ','URY  ','USA  ','VEN  '),
      LAT_MEAS DECIMAL(8,6) COMPRESS ,
      LONG_MEAS DECIMAL(9,6) COMPRESS ,
      GL_ACCURACY BYTEINT COMPRESS 0 ,
      GL_MATCH_FLG VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Y','N'),
      DR_CLEANSE_LVL BYTEINT COMPRESS 0 ,
      VALID_CNTCT_POINT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL DEFAULT 'Y' COMPRESS (' ','N','Y'),
      GUARDN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      GUARDN_EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      GUARDN_CNSNT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS (' ','N','Y'),
      ACNLGMT_DATE DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      POSTL_STATUS_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AC','DP','NV'),
      PR_GEOCODE_FAIL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0',' ','1','2','3','4','5','6','7','8','9'),
      TQ_GOUT_MATCH_LEVEL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      PR_REV_GROUP VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','10','1','6',' ','17','11','7','8','20','19','13','2','18','5','14','9','4','12','3'),
      DATA_SRCE_NBR INTEGER COMPRESS (1280 ,1281 ,1026 ,1029 ,1030 ,1286 ,1287 ,1290 ,1297 ,1298 ,1043 ,1299 ,1044 ,1300 ,1302 ,1047 ,1303 ,1049 ,1306 ,1307 ,1308 ,1053 ,1309 ,1310 ,1058 ,1314 ,1315 ,1060 ,1061 ,1318 ,1319 ,1071 ,1327 ,1328 ,1329 ,1074 ,1330 ,1075 ,1076 ,1332 ,1077 ,1333 ,1078 ,1334 ,1335 ,1336 ,1082 ,1339 ,1085 ,1086 ,1087 ,1343 ,1347 ,1092 ,1098 ,1099 ,1100 ,1101 ,1357 ,1102 ,1103 ,1361 ,1108 ,1109 ,1365 ,1366 ,1111 ,1368 ,1115 ,1116 ,1117 ,1121 ,1135 ,1136 ,1139 ,1140 ,1142 ,1150 ,1151 ,1152 ,1153 ,1154 ,1155 ,1156 ,1157 ,1158 ,1164 ,1167 ,1172 ,1175 ,1176 ,1177 ,1178 ,1179 ,1180 ,1181 ,1182 ,1183 ,1184 ,1185 ,1186 ,1188 ,1189 ,1192 ,1196 ,1197 ,1198 ,1199 ,1200 ,1201 ,1203 ,1204 ,1205 ,1206 ,1208 ,1211 ,1212 ,1213 ,1214 ,1217 ,1218 ,1219 ,1222 ,1224 ,1225 ,1226 ,1228 ,9933 ,1230 ,1231 ,1232 ,1233 ,1234 ,1236 ,1239 ,1240 ,1241 ,1242 ,1243 ,1244 ,1245 ,1246 ,1247 ,1250 ,1251 ,1253 ,1254 ,1255 ,1001 ,1257 ,1002 ,1258 ,1003 ,1259 ,1260 ,1261 ,1263 ,1017 ,1018 ,1019 ,1020 ,1021 ,1279 ),
      LAST_RTN_DATETM TIMESTAMP(6) COMPRESS ,
      POSTL_ADDR_ID INTEGER COMPRESS 0 ,
      SYS_SOURCE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('268','-11113','-11213','11733','12533','11833','12733','12033','12333','11633','933','11933','12633','12133','12233','11533','133','8913','13833','13933','20533','7613','14333','14433','14233','20233','20133','20333','11233','23633','23833','23433','20033','11033','21033','23333','9733','9333','9633','14733','16233','9433','10433','9533','15233','14633','9833','16133','16333','15833','15933','17033','17433','14833','15033','9933','17833','18133','16533','15133','7713','16933','15333','16833','14933','17933','15433','16733','16633','17633','19033','23733','15533','15633','18033','14533','15733','17533','18933','17733','20633','333','19533','18833','18333','11133','20833','18733','18433','18633','18533','10013','12833','10413','5313','5713','12433','13133','14033','18233','17233','23933','1233','20733','5413','5813','19733','168','233','11333','433','19233','19333','633','16033','23533','19833','4313','5113','5513','4613','4513','8013','5913','6313','21433','20433','7813','9013','1033','833','6013','8033','6413','11013','6913','10813','5213','22433','5613','4913','9813','5013','10213','7633','19933','21133','1133','10633','22233','6213','6613','13633','2213','2113','19433','7313','13233','4013','22533','6713','7113','23033','6113','6513','9613','2813','17133','19633','7013','6813','7513','20933','7413','7213','21333','8213','2713','9713','10113','733','22333','9913','10313','10039701','8813','11113','23233','2613','8333','2413','22833','17333','23133','10533','22933','24433','10733','22733','13533','22633','8313','10513','10613','10833','9113','8133','8113','8513','7433','13033','10933','7333','8413','7533','6951101','7913','22634','4688601','6848201','9967101','21833','7733','11433','3329901','3330701','3330201','3330801','3330101','3332001','3330601','3330501','3330301','57438','3330401','21733','6554301','6554401','6554601','6554501','4713801','6801501','6775801','6879901','6967801','59538','5328801','5328901','5329001','5328501','5327901','5329201','5328101','5328201','5328301'),
      SYS_TARGET_ID INTEGER COMPRESS (1280 ,1281 ,1026 ,1029 ,1030 ,1286 ,1287 ,1290 ,1297 ,1298 ,1043 ,1299 ,1044 ,1300 ,1302 ,1047 ,1303 ,1049 ,1306 ,1307 ,1308 ,1053 ,1309 ,1310 ,1058 ,1314 ,1315 ,1060 ,1061 ,1318 ,1319 ,1071 ,1327 ,1328 ,1329 ,1074 ,1330 ,1075 ,1076 ,1332 ,1077 ,1333 ,1078 ,1334 ,1335 ,1336 ,1082 ,1339 ,1085 ,1086 ,1087 ,1343 ,1347 ,1092 ,1098 ,1099 ,1100 ,1101 ,1357 ,1102 ,1103 ,1361 ,1108 ,1109 ,1365 ,1366 ,1111 ,1368 ,1115 ,1116 ,1117 ,1121 ,1135 ,1136 ,1139 ,1140 ,1142 ,1150 ,1151 ,1152 ,1153 ,1154 ,1155 ,1156 ,1157 ,1158 ,1164 ,1167 ,1172 ,1175 ,1176 ,1177 ,1178 ,1179 ,1180 ,1181 ,1182 ,1183 ,1184 ,1185 ,1186 ,1188 ,1189 ,1192 ,1196 ,1197 ,1198 ,1199 ,1200 ,1201 ,1203 ,1204 ,1205 ,1206 ,1208 ,1211 ,1212 ,1213 ,1214 ,1217 ,1218 ,1219 ,1222 ,1224 ,1225 ,1226 ,1228 ,9933 ,1230 ,1231 ,1232 ,1233 ,1234 ,1236 ,1239 ,1240 ,1241 ,1242 ,1243 ,1244 ,1245 ,1246 ,1247 ,1250 ,1251 ,1253 ,1254 ,1255 ,1001 ,1257 ,1002 ,1258 ,1003 ,1259 ,1260 ,1261 ,1263 ,1017 ,1018 ,1019 ,1020 ,1021 ,1279 ),
      SYS_AUTH_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ' ',
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ' ',
      SYS_CREATION_DATE TIMESTAMP(0),
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ' ',
      SYS_LAST_MODIFIED_BY VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS (' ','EtlUser','i2 Optout'),
      SYS_NC_TYPE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('INSERT','UPDATE','I','U'),
      SYS_ERR_CODE VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS (' ','This cnsmr migrated from MP9 as part of the Olay AU merge'),
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ' ')
PRIMARY INDEX REGIS_PRSNA_POSTL_ADDR_NUPI ( REGIS_PRSNA_ID ,MKTNG_PGM_NBR )
PARTITION BY MKTNG_PGM_NBR ;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L2
CREATE SET TABLE DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP2,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      REGIS_PRSNA_ID INTEGER NOT NULL,
      MKTNG_PGM_NBR INTEGER NOT NULL,
      LEGAL_ENT_NBR SMALLINT COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ),
      CNTCT_POINT_CATEG_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('AB','AR'),
      WIN_KEY VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('CN','CL',' ','US00000','BR','MX','TW','AR','US','SG     BL2','MY  JL2','CN20000020','CA','       1 2','AU       1','PE','MY    2','HK     FL2','VE','       2 2','MY5 JL2','SG     0 2','MY  LR2','MY4 JL2','SG       2','       3 2','KR','PH     YY1','HK     FL1','       4 2','CO','       5 2','MY  TM2','HK     CH2','JP8000208','       9 2','SG     1 2','MY8 JL2','HK     SH2','HK     HN2','       6 2','PH     RX1','       8 2','       7 2','HK     TN2','       JL2','HK     RM2','HK     TS2','HK     KN2','PH     MN1','AU     PB2','PH     U 1','CN510000CH','MY  LT2','MY1 JL2','HK     KW2','MY  PR2','HK       1'),
      SUBSCRPTN_OPT_NBR INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,20 ),
      SUBSCRPTN_OPT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('I','O'),
      CNSMR_CHCE_DATETM TIMESTAMP(6),
      PREF_CNTCT_POINT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL DEFAULT 'Y' COMPRESS (' ','Y'),
      ADDR_LINE_1_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      ADDR_LINE_2_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      ADDR_LINE_3_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','1','2','3','5','8','6','10','7','11','9','4','12','15','20','16','18','14','17','19','21','25','22','23','13','30','26','24','28','27','100','35','33','31','32','29','40','36','105','38','101','50','34','110','45','111','37','39','120','104','41','42','55','108','106','200','102','115','103','109','107','43','112','60','51','46','44','201','125','116','47','48','121','52','114','49','65','70','56','205','113','117','123','53','130','300','54','75','210','118','61','57','80','58','119','63','66','62','59','122','301','204','124','150','215','140','208','71','135','202','64','68','220','126','211','90','67','85','209','128','206','131','72','207','203','305','212','88','400','127','77','145','69','95','81','132','76','310','225','401','129','500','133','73','74','160','83','155','78','82','136','141','99','214','216','91','304','213','315','134','79','303','86','151','221','501','84','320','306','309','302','405','217','308','222','87','137','311','89','138','230','96','307','180','600','218','250','165','92','93','98','312','139','142','410','175','505','170','219','144','94','325','143','240','601','404','146','415','97','161','700','148','420','235','147','224','510','152','321','411','156','409','316','223','185','402','149','153','330','408','314','231','406','190','171','245','403','313','154','317','800','701','412','407','605','157','226','520','233','508','163','228','181','515'),
      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','Po Box','Main','2nd','3rd','4th','5th','Park','Washington','6th','7th','1st','Maple','8th','10th','9th','Oak','Lincoln','Walnut','Broadway','Elm','11th','Pine','12th','Cedar','Jefferson','Highland','Church','14th','River','Chestnut','Madison','13th','15th','16th','Jackson','Lake','Ridge','Franklin','Central','Sunset','Rr 1','17th','18th','Center','North','Forest','19th','High','Willow','Yyyyya','Wilson','West','20th','State','Union','21st','King','College','Prospect','Adams','Woodland','Cherry','Grand','South','23rd','Magnolia','22nd','24th','Grant','Hickory','Monroe','Harrison','Meadow','Lakeview','Orchard','Spruce','Riverside','Spring','25th','Liberty','Locust','Sycamore','Evergreen','Fairview','Hillcrest','Laurel','Taylor','Poplar','Valley','27th','Grove','Mill','Linden','28th','Pleasant','University','Summit','26th','Birch','Hamilton','Victoria','Johnson','Virginia','Hillside','Dogwood','East','Hill','30th','Market','Rr 2','29th','Clark','Village','Columbia','Oakwood','Country Club','Cypress','34th','Smith','Broad','35th','Elizabeth','James','Williams','32nd','Roosevelt','Windsor','Lee','Miller','Lexington','31st','Ash','Greenwood','Thomas','Oxford','Michigan','36th','Cambridge','33rd','Cleveland','Charles','Green','Davis','Edgewood','Garfield','Clinton','Douglas','Hawthorne','Wellington','Sheridan','Brown','37th','Holly','Howard','Scott','Lafayette','38th','Richmond','Vine','Garden','Pearl','Heritage','40th','Lawrence','Lakeshore','39th','Marshall','Belmont','42nd','Rose','Crescent','Grandview','41st','Mulberry','Olive','Martin','Sherman','Pennsylvania','43rd','Glenwood','Colonial','45th','Warren','48th','Sherwood','Morgan','Front','Fairway','Water','Arlington','Campbell','Hampton','Sunrise','44th','Wood','Allen','Kennedy','Division','46th','Russell','Westwood','Delaware','Bay','Shore','60th','Ridgewood','Wildwood','Lakeside','Principale','Ocean','Beech','Walker','Aspen','Elmwood','52nd','47th','Mountain','York','50th','Parkview','49th','Anderson','51st','Hemlock','Cherokee','Hudson','56th'),
      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','2','3','1','4','5','Apt 2','Apt 1','6','7','Apt A','Apt 3','Apt B','8','Apt 4','0','9','10','11','12','Apt C','Apt D','Apt 5','13','Apt 6','A','14','Apt 7','15','Apt 101','Apt 8','Apt 102','Apt 201','B','Apt 202','16','Apt 103','Apt 203','Apt 104','Apt 204','17','20','Apt 9','Suite 1','Apt 10','18','Suite 2','Fl 2','Apt E','Apt 11','Apt F','23','21','Apt 12','19','22','25','Grd Fl','Apt 301','2/F','Apt 302','U 2','U 1','Suite 3','Apt 105','30','26','Apt 205','Unit B','Unit A','101','34','Apt 303','35','Apt 206','Apt 106','Apt 304','1/F','Apt G','45','Fl 1','50','40','27','24','Apt 207','31','28','Apt H','Apt 107','201','Apt 14','36','100','32','33','Apt 208','55','Suite 4','29','Apt 108','Unit 1','U 3','102','Apt 2b','Apt 2a','Apt 15','Apt 1a','60','Unit 2','Apt 16','Apt 13','37','3/F','41','51','38','42','65','70','202','Apt 1b','39','Apt 305','80','44','46','43','75','Suite 5','Apt 306','48','301','52','Apt 3a','Apt 21','Apt 17','54','56','Suite 6','120','90','61','Bsmt','Apt 22','53','47','110','Apt 3b','85','Apt 18','105','Unit C','49','App 1','U 4','Apt 307','Unit 3','App 2','103','4/F','Apt 308','71','95','Apt 20','57','200','58','66','Apt 210','Apt 24','Apt 23','Apt 110','115','Apt 209','Apt 109','150','111','64','62','Apt 2c','67','63','Apt 111','104','81','Apt 211','Apt 19','App 3','130','302','59','72','125','Apt 112','5/F','68','73','140','74','76','77','91','Unit 4','86','Unit D','78','Apt 212','U 5','180','203','Apt 2d','135','160','96','84','Suite 7','Suite A','Apt J','106','Apt 401','Apt 1c','Apt 402','69','82','112','Apt 3c','121','99','79','155','87','88','170','83','App 4','89','145','Suite 101'),
      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','Po Box 14','Po Box 63','Po Box 24','Po Box 2','Po Box 4','Po Box 34','Po Box 53','Po Box 54','Po Box 12','Po Box 22','Po Box 23','Po Box 73','Po Box 44','Po Box 3','Po Box 113','Po Box 13','Po Box 102','Po Box 83','Po Box 92','Po Box 64','Po Box 5','Po Box 104','Po Box 42','Po Box 52','Po Box 84','Po Box 122','Po Box 43','Po Box 123','Po Box 124','Po Box 82','Po Box 11','Po Box 93','Po Box 25','Po Box 32','Po Box 94','Po Box 51','Po Box 74','Po Box 112','Po Box 85','Po Box 65','Po Box 26','Po Box 173','Po Box 33','Po Box 72','Po Box 21','Po Box 36','Po Box 6','Po Box 142','Po Box 133','Po Box 55','Po Box 62','Po Box 103','Po Box 132','Po Box 114','Po Box 35','Po Box 71','Po Box 31','Po Box 152','Po Box 111','Po Box 1','Po Box 41','Po Box 143','Po Box 101','Po Box 81','Po Box 66','Po Box 61','Po Box 134','Po Box 174','Po Box 204','Po Box 125','Po Box 162','Po Box 141','Po Box 144','Po Box 183','Po Box 56','Po Box 121','Po Box 95','Po Box 212','Po Box 91','Po Box 153','Po Box 222','Po Box 96','Po Box 163','Po Box 154','Po Box 126','Po Box 184','Po Box 203','Po Box 115','Po Box 161','Po Box 116','Po Box 193','Po Box 155','Po Box 213','Po Box 214','Po Box 15','Po Box 145','Po Box 131','Po Box 151','Po Box 233','Po Box 172','Po Box 182','Po Box 164','Po Box 86','Po Box 27','Po Box 171','Po Box 156','Po Box 67','Po Box 192','Po Box 45','Po Box 201','Po Box 7','Po Box 234','Po Box 185','Po Box 242','Po Box 37','Po Box 194','Po Box 8','Po Box 75','Po Box 224','Po Box 223','Po Box 282','Po Box 215','Po Box 254','Po Box 87','Po Box 105','Po Box 244','Po Box 264','Po Box 181','Po Box 243','Po Box 175','Po Box 202','Po Box 252','Po Box 57','Po Box 262','Po Box 263','Po Box 146','Po Box 211','Po Box 16','Po Box 46','Po Box 97','Po Box 68','Po Box 221','Po Box 191','Po Box 231','Po Box 294','Po Box 176','Po Box 28','Po Box 232','Po Box 302','Po Box 135','Po Box 274','Po Box 292','Po Box 98','Po Box 88','Po Box 241','Po Box 76','Po Box 253','Po Box 235','Po Box 186','Po Box 303','Po Box 157','Po Box 117','Po Box 354','Po Box 284','Po Box 216','Po Box 251','Po Box 273','Po Box 313','Po Box 106','Po Box 38','Po Box 272','Po Box 205','Po Box 281','Po Box 311','Po Box 301','Po Box 314','Po Box 333','Po Box 293','Po Box 245','Po Box 127','Po Box 165','Po Box 304','Po Box 322','Po Box 187','Po Box 236','Po Box 128','Po Box 206','Po Box 283','Po Box 312','Po Box 334','Po Box 58','Po Box 324','Po Box 344','Po Box 265','Po Box 323','Po Box 261','Po Box 271','Po Box 118','Po Box 207','Po Box 275','Po Box 246','Po Box 295','Po Box 342','Po Box 266','Po Box 147','Po Box 17','Po Box 291','Po Box 136','Po Box 362','Po Box 412','Po Box 352','Po Box 332','Po Box 335','Po Box 195','Po Box 177','Po Box 444','Po Box 363','Po Box 305','Po Box 343','Po Box 384','Po Box 166','Po Box 9','Po Box 383','Po Box 276','Po Box 351','Po Box 353','Po Box 296','Po Box 321','Po Box 158','Po Box 306','Po Box 331','Po Box 364','Po Box 225','Po Box 39','Po Box 10','Po Box 341','Po Box 69','Po Box 403','Po Box 394','Po Box 402','Po Box 217','Po Box 404','Po Box 414','Po Box 148','Po Box 255','Po Box 129','Po Box 372','Po Box 443','Po Box 226','Po Box 355','Po Box 325','Po Box 382','Po Box 433'),
      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','Sao Paulo','Unk','rio de janeiro','Houston','Toronto','Chicago','Mumbai','Salvador','Brooklyn','Singapore','Belo Horizonte','San Antonio','Kuala Lumpur','Jacksonville','cincinnati','Columbus','Philadelphia','Santiago','Las Vegas','Calgary','Los Angeles','Miami','Phoenix','Curitiba','Kln','Recife','Montreal','Winnipeg','Dallas','Orlando','New Delhi','Mississauga','Indianapolis','Springfield','Louisville','Richmond','New York','Ahmedabad','Edmonton','Ciudad De Mexico','Hamilton','Tuen Mun','San Diego','Charlotte','Vancouver','Bronx','Chennai','Nt','Sha Tin','Tampa','Lexington','Saint Louis','Columbia','London','Austin','Hyderabad','Rochester','Kolkata','Cleveland','Scarborough','Brampton','Atlanta','Tucson','Pittsburgh','Bangalore','Baltimore','Fort Worth','Quebec','Arlington','Porto Alegre','Kansas City','Jackson','San Jose','Aurora','Portland','Washington','Sacramento','Raleigh','Burlington','Fortaleza','Goiás','Greenville','Omaha','Canton','Virginia Beach','Hk','Windsor','Milwaukee','Lancaster','Wilmington','Delhi','Dayton','Knoxville','Oklahoma City','Fayetteville','Surrey','Ottawa','Memphis','Madison','Guarulhos','Tai Po','Colorado Springs','Mesa','Tsuen Wan','Salem','Jaipur','Laval','El paso','Nashville','Staten Island','Newark','Campinas','Wichita','Denver','Yuen Long','Monroe','Markham','Toledo','Kwai Chung','Buffalo','Manaus','Franklin','Glendale','Birmingham','Marietta','Espírito Santo','Fresno','Henderson','Alexandria','Tulsa','Detroit','Lincoln','Minneapolis','Pulau Pinang','Fort Wayne','Gainesville','Albuquerque','Victoria','North York','Decatur','Bakersfield','Auburn','Antofagasta','Florence'),
      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','0','100000','200000','201122','510000','135080','518000','523000','528000','300000','610000','430000','215000','1080075','210000','361000','350001','201400','350000','110000','473000','266000','200333','121005','450000','528300','886','201100','528400','310000','8000208','116000','400000','100022','529000','325000','100011','151050','210012','214000','151015','50000','519000','200010','511400','200233','100085','362000','610041','710000','315000','200237','201301','10026','200030','266071','230011','200093','8760854','201204','515000','200120','1540024','510620','300250','311100','511300','100029','100025','515041','100070','528200','100083','452001','200065','363000','350003','200070','510630','200435','315100','200433','310012','201108','100080','200125','215021','450001','200135','200126','410205','100020','300052','201203','200092','530200','250000','330100','430074','122001','410000','350200','351100','215300','570311','100021','154842','30001','200438','250202','200129','550007','710065','350702','130401','611442','10070','201600','404042','200072','530000','200434','63000','130000','110143','430409','50800','100101','100076','710077','100102','213000','100024','150001','510665','200083','221000','101100','350007','302017','430070','132103','380015','110092','312000','380061','101300','110085','100176','71000','100088','314000','200082','100081','100071','200001','100086','200137','350002','710075','110034','200090','200436','521000','201101','529100','200335','2000','200336','100089','200235','510800','710061','100027','100044','341000','361009','315192','471000','100096','150000','1560044','200124','200240','400067','100028','200051','201103','250001','100055','380007','201206','200032','102600','302020','150010','100075','200231','364000','517000','200122','350011','510260','142100','226001','610031','1100','510660','110001','510100','114000','380013','510600','100012','100026','325606','200040','200431','200050','518001','710054','100068','250100','711101','230001','524000','200021','116001','200439','200063','9893126','201300','N/A','518057','510080','211100','200127','156060','400060','200080','650000','215500','350009','518034','530001','200062','710016','100010','102208','300222','518109','201102'),
      TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS (' ','California','texas','Florida','Ontario','New York','Ohio','Pennsylvania','SAO PAULO','Illinois','Georgia','North Carolina','Michigan','Quebec','New Jersey','Indiana','Virginia','Tennessee','RIO DE JANEIRO','missouri','Kentucky','Alabama','Wisconsin','Arizona','Massachusetts','South Carolina','MINAS GERAIS','Maryland','Washington','British Columbia','Minnesota','Louisiana','NT','Unknown','Oklahoma','Colorado','Alberta','BAHIA','Connecticut','Kansas','Iowa','Arkansas','JP-13','Oregon','KLN','Mississippi','RIO GRANDE DO SUL','UNK','NSW','PERNAMBUCO','West Virginia','Utah','DISTRITO FEDERAL','Nevada','VIC','PARANA','SELANGOR','HK','Nebraska','Nova Scotia','SANTA CATARINA','QLD','Manitoba','IN-MH','Maine','New Hampshire','JP-14','JP-27','IN-GJ','Idaho','New Mexico','WP KUALA LUMPUR','ShannXi','New Brunswick','PARANÁ','JP-23','Saskatchewan','Rhode Island','Delaware','SP','GOIAS','JP-11','Hawaii','ESPIRITO SANTO','CEARA','IN-TN','JP-12','JP-28','WA','IN-DL','South Dakota','Newfoundland & Labrador','IN-AP','North Dakota','JP-01','RIO GRANDE DO NORTE','IN-UP','MATO GROSSO','Montana','JP-40','SA','PULAU PINANG','IN-RJ','MATO GROSSO DO SUL','Alaska','JOHOR','IN-WB','Vermont','ALAGOAS','SERGIPE','JP-22','AMAZONAS','PARA','IN-HR','IN-KA','PERAK','ESTADO DE MEXICO','Wyoming','JP-26','MARANHAO','JALISCO','District Of Columbia','NEW TERRITORIES','JP-34','RJ','PARÁ','SARAWAK','JP-08','IN-MP','NUEVO LEON','BUENOS AIRES','JP-04','KEDAH','TOCANTINS','JP-21','Prince Edward Island','SABAH','IN-PB','VERACRUZ','JP-24','JP-15','JP-33','MELAKA','PIAUI','NEGERI SEMBILAN','JP-20','JP-09','PUEBLA','JP-25','JP-10','JP-29','JP-44','GUANAJUATO','WILAYAH PERSEKUTUAN','JP-43','SONORA','Puerto Rico','JP-47','TAS','KOWLOON','PAHANG','JP-17','JP-07','HONGKONG','IN-KL','Armed Forces Europe','JP-46','ACT','JP-38','JP-35','RONDONIA','JP-16','SINALOA','COAHUILA','TAMAULIPAS','JP-02','MEXICO','CHIHUAHUA'),
      CITY_CODE INTEGER COMPRESS (908288 ,848128 ,854273 ,828417 ,637697 ,918786 ,908803 ,5 ,873989 ,35078 ,647686 ,833800 ,864011 ,25100 ,617740 ,818956 ,849165 ,657678 ,899086 ,924433 ,843026 ,859156 ,582678 ,23 ,813335 ,24 ,55064 ,667673 ,637722 ,582683 ,848411 ,28 ,864284 ,872988 ,893214 ,918048 ,863265 ,637730 ,20003 ,647715 ,859172 ,35111 ,40 ,864043 ,824109 ,46 ,924462 ,677678 ,847919 ,592688 ,667696 ,592689 ,868914 ,823346 ,824371 ,55094 ,647734 ,667705 ,20025 ,848697 ,30010 ,883773 ,879166 ,832830 ,858175 ,667711 ,30015 ,35135 ,923457 ,862786 ,20037 ,612679 ,30023 ,923720 ,924488 ,863816 ,864328 ,647752 ,20042 ,853583 ,808527 ,35151 ,30032 ,667733 ,832853 ,612694 ,813654 ,843862 ,822872 ,55128 ,582745 ,924506 ,11866 ,829021 ,843358 ,848734 ,647775 ,858465 ,842849 ,868452 ,40036 ,913508 ,622693 ,894053 ,687719 ,888941 ,677742 ,112 ,843889 ,923251 ,807795 ,632692 ,622711 ,809080 ,121 ,20089 ,919162 ,903290 ,888443 ,897915 ,642683 ,857980 ,10108 ,20092 ,908415 ,848255 ,907904 ,667777 ,833154 ,602755 ,823429 ,592774 ,893832 ,843912 ,839049 ,5002 ,10122 ,883338 ,918411 ,762764 ,863117 ,50061 ,652685 ,888974 ,923023 ,819088 ,50064 ,652690 ,1683 ,873876 ,612756 ,863381 ,808342 ,823192 ,652697 ,887963 ,577691 ,642716 ,829085 ,50077 ,672673 ,818850 ,15011 ,893097 ,632745 ,893866 ,652715 ,597678 ,864174 ,817841 ,868274 ,642738 ,863667 ,587699 ,853428 ,924340 ,922805 ,20149 ,878007 ,863161 ,829113 ,682683 ,30139 ,672700 ,832957 ,30143 ,577727 ,607680 ,884160 ,652738 ,908483 ,843459 ,5060 ,40132 ,15045 ,818373 ,587717 ,607686 ,824263 ,853704 ,662728 ,922825 ,692682 ,907978 ,863435 ,692683 ,828876 ,652751 ,727761 ,853714 ,853715 ,35027 ,597716 ,15060 ,692696 ,808922 ,682715 ,878300 ,914140 ,597725 ,617697 ,652769 ,847842 ,809187 ,879075 ,672741 ,692710 ,833510 ,55015 ,587751 ,862953 ,877802 ,692715 ,652780 ,607725 ,637678 ,627695 ,587759 ,497648 ,868593 ,888817 ,813299 ,672758 ,647670 ,822776 ,823033 ,913913 ,862970 ,617725 ,888061 ,637693 ,908285 ,898303 ,55039 ),
      TERR_CODE CHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('        ','ALAGO   ','ALAGOAS ','AMAZO   ','AMAZONAS','AU-NS   ','AU-QL   ','AU-SA   ','AU-VI   ','AU-WA   ','BAHIA   ','BUENO   ','CA-AB   ','CA-BC   ','CA-MB   ','CA-NB   ','CA-NL   ','CA-NS   ','CA-ON   ','CA-PE   ','CA-QC   ','CA-SK   ','CEARA   ','CN-11   ','CN-12   ','CN-13   ','CN-14   ','CN-15   ','CN-21   ','CN-22   ','CN-23   ','CN-31   ','CN-32   ','CN-33   ','CN-34   ','CN-35   ','CN-36   ','CN-37   ','CN-41   ','CN-42   ','CN-43   ','CN-44   ','CN-45   ','CN-46   ','CN-50   ','CN-51   ','CN-52   ','CN-53   ','CN-61   ','CN-62   ','CN-65   ','DISTR   ','DISTRITO','ESPIR   ','ESTAD   ','GOIAS   ','HK      ','HONG    ','IN-AP   ','IN-DL   ','IN-GJ   ','IN-HR   ','IN-KA   ','IN-KL   ','IN-MH   ','IN-MP   ','IN-PB   ','IN-RJ   ','IN-TN   ','IN-UP   ','IN-WB   ','JALIS   ','JOHOR   ','JP-01   ','JP-02   ','JP-03   ','JP-04   ','JP-05   ','JP-06   ','JP-07   ','JP-08   ','JP-09   ','JP-10   ','JP-11   ','JP-12   ','JP-13   ','JP-14   ','JP-15   ','JP-16   ','JP-17   ','JP-18   ','JP-19   ','JP-20   ','JP-21   ','JP-22   ','JP-23   ','JP-24   ','JP-25   ','JP-26   ','JP-27   ','JP-28   ','JP-29   ','JP-30   ','JP-33   ','JP-34   ','JP-35   ','JP-36   ','JP-37   ','JP-38   ','JP-40   ','JP-41   ','JP-42   ','JP-43   ','JP-44   ','JP-45   ','JP-46   ','JP-47   ','KEDAH   ','KLN     ','KOWLO   ','MARAN   ','MARANHÃO','MATO    ','MATO GRO','MELAKA  ','MINAS   ','MINAS GE','NEGERI S','NT      ','NUEVO   ','New T   ','PARA    ','PARAN   ','PARANÁ  ','PARÁ    ','PERAK   ','PERNA   ','PERNAMBU','PIAUI   ','PUEBL   ','PULAU PI','RIO D   ','RIO DE J','RIO G   ','RIO GRAN','RJ      ','SABAH   ','SANTA   ','SANTA CA','SAO P   ','SAO PAUL','SELANGOR','SERGI   ','SERGIPE ','SP      ','Sarawak ','UNK     ','US-AK   ','US-AL   ','US-AR   ','US-AZ   ','US-CA   ','US-CO   ','US-CT   ','US-DC   ','US-DE   ','US-FL   ','US-GA   ','US-HI   ','US-IA   ','US-ID   ','US-IL   ','US-IN   ','US-KS   ','US-KY   ','US-LA   ','US-MA   ','US-MD   ','US-ME   ','US-MI   ','US-MN   ','US-MO   ','US-MS   ','US-MT   ','US-NC   ','US-ND   ','US-NE   ','US-NH   ','US-NJ   ','US-NM   ','US-NV   ','US-NY   ','US-OH   ','US-OK   ','US-OR   ','US-PA   ','US-RI   ','US-SC   ','US-SD   ','US-TN   ','US-TX   ','US-UT   ','US-VA   ','US-VT   ','US-WA   ','US-WI   ','US-WV   ','US-WY   ','USUNK   ','VERAC   ','WP KUALA'),
      CNTRY_CODE CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('     ','ARG  ','AUS  ','BOL  ','BRA  ','CAN  ','CHL  ','CHN  ','COL  ','CRI  ','ECU  ','GTM  ','HKG  ','HND  ','IND  ','JPN  ','KOR  ','LAT  ','MEX  ','MYS  ','NIC  ','NZL  ','PAN  ','PER  ','PHL  ','SGP  ','SLV  ','TUR  ','TWN  ','URY  ','USA  ','VEN  '),
      LAT_MEAS DECIMAL(8,6) COMPRESS ,
      LONG_MEAS DECIMAL(9,6) COMPRESS ,
      GL_ACCURACY BYTEINT COMPRESS 0 ,
      GL_MATCH_FLG VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Y','N'),
      DR_CLEANSE_LVL BYTEINT COMPRESS 0 ,
      VALID_CNTCT_POINT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL DEFAULT 'Y' COMPRESS (' ','N','Y'),
      GUARDN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      GUARDN_EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ' ',
      GUARDN_CNSNT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS (' ','N','Y'),
      ACNLGMT_DATE DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      POSTL_STATUS_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AC','DP','NV'),
      PR_GEOCODE_FAIL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0',' ','1','2','3','4','5','6','7','8','9'),
      TQ_GOUT_MATCH_LEVEL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      PR_REV_GROUP VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','10','1','6',' ','17','11','7','8','20','19','13','2','18','5','14','9','4','12','3'),
      DATA_SRCE_NBR INTEGER COMPRESS (1280 ,1281 ,1026 ,1029 ,1030 ,1286 ,1287 ,1290 ,1297 ,1298 ,1043 ,1299 ,1044 ,1300 ,1302 ,1047 ,1303 ,1049 ,1306 ,1307 ,1308 ,1053 ,1309 ,1310 ,1058 ,1314 ,1315 ,1060 ,1061 ,1318 ,1319 ,1071 ,1327 ,1328 ,1329 ,1074 ,1330 ,1075 ,1076 ,1332 ,1077 ,1333 ,1078 ,1334 ,1335 ,1336 ,1082 ,1339 ,1085 ,1086 ,1087 ,1343 ,1347 ,1092 ,1098 ,1099 ,1100 ,1101 ,1357 ,1102 ,1103 ,1361 ,1108 ,1109 ,1365 ,1366 ,1111 ,1368 ,1115 ,1116 ,1117 ,1121 ,1135 ,1136 ,1139 ,1140 ,1142 ,1150 ,1151 ,1152 ,1153 ,1154 ,1155 ,1156 ,1157 ,1158 ,1164 ,1167 ,1172 ,1175 ,1176 ,1177 ,1178 ,1179 ,1180 ,1181 ,1182 ,1183 ,1184 ,1185 ,1186 ,1188 ,1189 ,1192 ,1196 ,1197 ,1198 ,1199 ,1200 ,1201 ,1203 ,1204 ,1205 ,1206 ,1208 ,1211 ,1212 ,1213 ,1214 ,1217 ,1218 ,1219 ,1222 ,1224 ,1225 ,1226 ,1228 ,9933 ,1230 ,1231 ,1232 ,1233 ,1234 ,1236 ,1239 ,1240 ,1241 ,1242 ,1243 ,1244 ,1245 ,1246 ,1247 ,1250 ,1251 ,1253 ,1254 ,1255 ,1001 ,1257 ,1002 ,1258 ,1003 ,1259 ,1260 ,1261 ,1263 ,1017 ,1018 ,1019 ,1020 ,1021 ,1279 ),
      LAST_RTN_DATETM TIMESTAMP(6) COMPRESS ,
      POSTL_ADDR_ID INTEGER COMPRESS 0 ,
      SYS_SOURCE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('268','-11113','-11213','11733','12533','11833','12733','12033','12333','11633','933','11933','12633','12133','12233','11533','133','8913','13833','13933','20533','7613','14333','14433','14233','20233','20133','20333','11233','23633','23833','23433','20033','11033','21033','23333','9733','9333','9633','14733','16233','9433','10433','9533','15233','14633','9833','16133','16333','15833','15933','17033','17433','14833','15033','9933','17833','18133','16533','15133','7713','16933','15333','16833','14933','17933','15433','16733','16633','17633','19033','23733','15533','15633','18033','14533','15733','17533','18933','17733','20633','333','19533','18833','18333','11133','20833','18733','18433','18633','18533','10013','12833','10413','5313','5713','12433','13133','14033','18233','17233','23933','1233','20733','5413','5813','19733','168','233','11333','433','19233','19333','633','16033','23533','19833','4313','5113','5513','4613','4513','8013','5913','6313','21433','20433','7813','9013','1033','833','6013','8033','6413','11013','6913','10813','5213','22433','5613','4913','9813','5013','10213','7633','19933','21133','1133','10633','22233','6213','6613','13633','2213','2113','19433','7313','13233','4013','22533','6713','7113','23033','6113','6513','9613','2813','17133','19633','7013','6813','7513','20933','7413','7213','21333','8213','2713','9713','10113','733','22333','9913','10313','10039701','8813','11113','23233','2613','8333','2413','22833','17333','23133','10533','22933','24433','10733','22733','13533','22633','8313','10513','10613','10833','9113','8133','8113','8513','7433','13033','10933','7333','8413','7533','6951101','7913','22634','4688601','6848201','9967101','21833','7733','11433','3329901','3330701','3330201','3330801','3330101','3332001','3330601','3330501','3330301','57438','3330401','21733','6554301','6554401','6554601','6554501','4713801','6801501','6775801','6879901','6967801','59538','5328801','5328901','5329001','5328501','5327901','5329201','5328101','5328201','5328301'),
      SYS_TARGET_ID INTEGER COMPRESS (1280 ,1281 ,1026 ,1029 ,1030 ,1286 ,1287 ,1290 ,1297 ,1298 ,1043 ,1299 ,1044 ,1300 ,1302 ,1047 ,1303 ,1049 ,1306 ,1307 ,1308 ,1053 ,1309 ,1310 ,1058 ,1314 ,1315 ,1060 ,1061 ,1318 ,1319 ,1071 ,1327 ,1328 ,1329 ,1074 ,1330 ,1075 ,1076 ,1332 ,1077 ,1333 ,1078 ,1334 ,1335 ,1336 ,1082 ,1339 ,1085 ,1086 ,1087 ,1343 ,1347 ,1092 ,1098 ,1099 ,1100 ,1101 ,1357 ,1102 ,1103 ,1361 ,1108 ,1109 ,1365 ,1366 ,1111 ,1368 ,1115 ,1116 ,1117 ,1121 ,1135 ,1136 ,1139 ,1140 ,1142 ,1150 ,1151 ,1152 ,1153 ,1154 ,1155 ,1156 ,1157 ,1158 ,1164 ,1167 ,1172 ,1175 ,1176 ,1177 ,1178 ,1179 ,1180 ,1181 ,1182 ,1183 ,1184 ,1185 ,1186 ,1188 ,1189 ,1192 ,1196 ,1197 ,1198 ,1199 ,1200 ,1201 ,1203 ,1204 ,1205 ,1206 ,1208 ,1211 ,1212 ,1213 ,1214 ,1217 ,1218 ,1219 ,1222 ,1224 ,1225 ,1226 ,1228 ,9933 ,1230 ,1231 ,1232 ,1233 ,1234 ,1236 ,1239 ,1240 ,1241 ,1242 ,1243 ,1244 ,1245 ,1246 ,1247 ,1250 ,1251 ,1253 ,1254 ,1255 ,1001 ,1257 ,1002 ,1258 ,1003 ,1259 ,1260 ,1261 ,1263 ,1017 ,1018 ,1019 ,1020 ,1021 ,1279 ),
      SYS_AUTH_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ' ',
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ' ',
      SYS_CREATION_DATE TIMESTAMP(0),
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ' ',
      SYS_LAST_MODIFIED_BY VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS (' ','EtlUser','i2 Optout'),
      SYS_NC_TYPE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('INSERT','UPDATE','I','U'),
      SYS_ERR_CODE VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS (' ','This cnsmr migrated from MP9 as part of the Olay AU merge'),
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ' ')
PRIMARY INDEX REGIS_PRSNA_POSTL_ADDR_NUPI ( REGIS_PRSNA_ID ,MKTNG_PGM_NBR )
PARTITION BY MKTNG_PGM_NBR ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L3
 INSERT INTO DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP1 
 (REGIS_PRSNA_ID, 	MKTNG_PGM_NBR ,	LEGAL_ENT_NBR ,	CNTCT_POINT_CATEG_CODE,WIN_KEY,	SUBSCRPTN_OPT_NBR,SUBSCRPTN_OPT_IND,CNSMR_CHCE_DATETM ,	
PREF_CNTCT_POINT_IND,ADDR_LINE_1_TXT,ADDR_LINE_2_TXT,ADDR_LINE_3_TXT,STRET_NUM,	STRET_NAME,
APT_NUM,PO_BOX_NUM,	CITY_NAME,POSTL_AREA_CODE,TERR_NAME,CITY_CODE,TERR_CODE,CNTRY_CODE,LAT_MEAS,LONG_MEAS,GL_ACCURACY , 		
GL_MATCH_FLG,	DR_CLEANSE_LVL  ,VALID_CNTCT_POINT_IND 	,GUARDN_NAME,GUARDN_EMAIL_ADDR_TXT 	,GUARDN_CNSNT_IND,ACNLGMT_DATE,
POSTL_STATUS_CODE,PR_GEOCODE_FAIL,TQ_GOUT_MATCH_LEVEL,PR_REV_GROUP,DATA_SRCE_NBR,LAST_RTN_DATETM,
POSTL_ADDR_ID,SYS_SOURCE,SYS_TARGET_ID,SYS_AUTH_ID,SYS_CREATED_BY,SYS_CREATION_DATE,SYS_LAST_MODIFIED_DATE,SYS_ENT_STATE,
SYS_LAST_MODIFIED_BY,SYS_NC_TYPE,SYS_ERR_CODE,SYS_ERR_SVRTY 					
	  )
SEL 
REGIS_PRSNA_ID, 	MKTNG_PGM_NBR ,	LEGAL_ENT_NBR ,	CNTCT_POINT_CATEG_CODE,WIN_KEY,	COALESCE(SUBSCRPTN_OPT_NBR,0),SUBSCRPTN_OPT_IND,CNSMR_CHCE_DATETM ,	
PREF_CNTCT_POINT_IND,ADDR_LINE_1_TXT,ADDR_LINE_2_TXT,ADDR_LINE_3_TXT,STRET_NUM,	STRET_NAME,
APT_NUM,PO_BOX_NUM,	CITY_NAME,POSTL_AREA_CODE,TERR_NAME,CITY_CODE,TERR_CODE,CNTRY_CODE,LAT_MEAS,LONG_MEAS,GL_ACCURACY , 		
GL_MATCH_FLG,	DR_CLEANSE_LVL  ,VALID_CNTCT_POINT_IND 	,GUARDN_NAME,GUARDN_EMAIL_ADDR_TXT 	,GUARDN_CNSNT_IND,ACNLGMT_DATE,
POSTL_STATUS_CODE,PR_GEOCODE_FAIL,TQ_GOUT_MATCH_LEVEL,PR_REV_GROUP,DATA_SRCE_NBR,LAST_RTN_DATETM,
POSTL_ADDR_ID,SYS_SOURCE,SYS_TARGET_ID,SYS_AUTH_ID,SYS_CREATED_BY,SYS_CREATION_DATE,SYS_LAST_MODIFIED_DATE,SYS_ENT_STATE,
SYS_LAST_MODIFIED_BY,SYS_NC_TYPE,SYS_ERR_CODE,SYS_ERR_SVRTY
FROM MDM.REGIS_PRSNA_POSTL_ADDR
WHERE (REGIS_PRSNA_ID,MKTNG_PGM_NBR,CNTCT_POINT_CATEG_CODE,COALESCE(SUBSCRPTN_OPT_NBR,0)) IN 
(SEL
REGIS_PRSNA_ID,MKTNG_PGM_NBR,CNTCT_POINT_CATEG_CODE,COALESCE(SUBSCRPTN_OPT_NBR,0)
 FROM MDM.REGIS_PRSNA_POSTL_ADDR
  GROUP BY REGIS_PRSNA_ID,MKTNG_PGM_NBR,CNTCT_POINT_CATEG_CODE,COALESCE(SUBSCRPTN_OPT_NBR,0)
  HAVING COUNT(*)>1);
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;  
 
 .LABEL L4
  INSERT INTO DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP2
(REGIS_PRSNA_ID, 	MKTNG_PGM_NBR ,	LEGAL_ENT_NBR ,	CNTCT_POINT_CATEG_CODE,WIN_KEY,	SUBSCRPTN_OPT_NBR,SUBSCRPTN_OPT_IND,CNSMR_CHCE_DATETM ,	
PREF_CNTCT_POINT_IND,ADDR_LINE_1_TXT,ADDR_LINE_2_TXT,ADDR_LINE_3_TXT,STRET_NUM,	STRET_NAME,
APT_NUM,PO_BOX_NUM,	CITY_NAME,POSTL_AREA_CODE,TERR_NAME,CITY_CODE,TERR_CODE,CNTRY_CODE,LAT_MEAS,LONG_MEAS,GL_ACCURACY , 		
GL_MATCH_FLG,	DR_CLEANSE_LVL  ,VALID_CNTCT_POINT_IND 	,GUARDN_NAME,GUARDN_EMAIL_ADDR_TXT 	,GUARDN_CNSNT_IND,ACNLGMT_DATE,
POSTL_STATUS_CODE,PR_GEOCODE_FAIL,TQ_GOUT_MATCH_LEVEL,PR_REV_GROUP,DATA_SRCE_NBR,LAST_RTN_DATETM,
POSTL_ADDR_ID,SYS_SOURCE,SYS_TARGET_ID,SYS_AUTH_ID,SYS_CREATED_BY,SYS_CREATION_DATE,SYS_LAST_MODIFIED_DATE,SYS_ENT_STATE,
SYS_LAST_MODIFIED_BY,SYS_NC_TYPE,SYS_ERR_CODE,SYS_ERR_SVRTY 					
	  )
 SEL 
REGIS_PRSNA_ID, 	MKTNG_PGM_NBR ,	LEGAL_ENT_NBR ,	CNTCT_POINT_CATEG_CODE,WIN_KEY,	SUBSCRPTN_OPT_NBR,SUBSCRPTN_OPT_IND,CNSMR_CHCE_DATETM ,	
PREF_CNTCT_POINT_IND,ADDR_LINE_1_TXT,ADDR_LINE_2_TXT,ADDR_LINE_3_TXT,STRET_NUM,	STRET_NAME,
APT_NUM,PO_BOX_NUM,	CITY_NAME,POSTL_AREA_CODE,TERR_NAME,CITY_CODE,TERR_CODE,CNTRY_CODE,LAT_MEAS,LONG_MEAS,GL_ACCURACY , 		
GL_MATCH_FLG,	DR_CLEANSE_LVL  ,VALID_CNTCT_POINT_IND 	,GUARDN_NAME,GUARDN_EMAIL_ADDR_TXT 	,GUARDN_CNSNT_IND,ACNLGMT_DATE,
POSTL_STATUS_CODE,PR_GEOCODE_FAIL,TQ_GOUT_MATCH_LEVEL,PR_REV_GROUP,DATA_SRCE_NBR,LAST_RTN_DATETM,
POSTL_ADDR_ID,SYS_SOURCE,SYS_TARGET_ID,SYS_AUTH_ID,SYS_CREATED_BY,SYS_CREATION_DATE,SYS_LAST_MODIFIED_DATE,SYS_ENT_STATE,
SYS_LAST_MODIFIED_BY,SYS_NC_TYPE,SYS_ERR_CODE,SYS_ERR_SVRTY 							
 FROM DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP1
 QUALIFY RANK() OVER( PARTITION BY REGIS_PRSNA_ID,MKTNG_PGM_NBR,CNTCT_POINT_CATEG_CODE,SUBSCRPTN_OPT_NBR 
 ORDER BY SYS_LAST_MODIFIED_DATE DESC,SYS_CREATION_DATE DESC,CNSMR_CHCE_DATETM DESC, LEGAL_ENT_NBR , CNTCT_POINT_CATEG_CODE, WIN_KEY,SUBSCRPTN_OPT_NBR,
 SUBSCRPTN_OPT_IND,  PREF_CNTCT_POINT_IND,ADDR_LINE_1_TXT,  ADDR_LINE_2_TXT,  ADDR_LINE_3_TXT,  STRET_NUM,  STRET_NAME,  APT_NUM,  PO_BOX_NUM,  CITY_NAME,
 POSTL_AREA_CODE,TERR_NAME, CITY_CODE, TERR_CODE, CNTRY_CODE, LAT_MEAS, LONG_MEAS, GL_ACCURACY ,GL_MATCH_FLG,DR_CLEANSE_LVL  ,VALID_CNTCT_POINT_IND,
 GUARDN_NAME, GUARDN_EMAIL_ADDR_TXT, GUARDN_CNSNT_IND, ACNLGMT_DATE, POSTL_STATUS_CODE, PR_GEOCODE_FAIL, TQ_GOUT_MATCH_LEVEL, PR_REV_GROUP, DATA_SRCE_NBR
 , LAST_RTN_DATETM, POSTL_ADDR_ID)=1;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 
 
  .LABEL L5
COLLECT STATS ON DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP2 COLUMN REGIS_PRSNA_ID ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L6
COLLECT STATS ON DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP2 COLUMN MKTNG_PGM_NBR ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L7
 DEL FROM MDM.REGIS_PRSNA_POSTL_ADDR
WHERE (REGIS_PRSNA_ID,MKTNG_PGM_NBR,CNTCT_POINT_CATEG_CODE,COALESCE(SUBSCRPTN_OPT_NBR,0)) IN 
(SEL
REGIS_PRSNA_ID,MKTNG_PGM_NBR,CNTCT_POINT_CATEG_CODE, COALESCE(SUBSCRPTN_OPT_NBR,0) SUBSCRPTN_OPT_NBR1
FROM DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP2
);
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  
 .LABEL L8
  INSERT INTO MDM.REGIS_PRSNA_POSTL_ADDR
 (REGIS_PRSNA_ID, 	MKTNG_PGM_NBR ,	LEGAL_ENT_NBR ,	CNTCT_POINT_CATEG_CODE,WIN_KEY,	SUBSCRPTN_OPT_NBR,SUBSCRPTN_OPT_IND,CNSMR_CHCE_DATETM ,	
PREF_CNTCT_POINT_IND,ADDR_LINE_1_TXT,ADDR_LINE_2_TXT,ADDR_LINE_3_TXT,STRET_NUM,	STRET_NAME,
APT_NUM,PO_BOX_NUM,	CITY_NAME,POSTL_AREA_CODE,TERR_NAME,CITY_CODE,TERR_CODE,CNTRY_CODE,LAT_MEAS,LONG_MEAS,GL_ACCURACY , 		
GL_MATCH_FLG,	DR_CLEANSE_LVL  ,VALID_CNTCT_POINT_IND 	,GUARDN_NAME,GUARDN_EMAIL_ADDR_TXT 	,GUARDN_CNSNT_IND,ACNLGMT_DATE,
POSTL_STATUS_CODE,PR_GEOCODE_FAIL,TQ_GOUT_MATCH_LEVEL,PR_REV_GROUP,DATA_SRCE_NBR,LAST_RTN_DATETM,
POSTL_ADDR_ID,SYS_SOURCE,SYS_TARGET_ID,SYS_AUTH_ID,SYS_CREATED_BY,SYS_CREATION_DATE,SYS_LAST_MODIFIED_DATE,SYS_ENT_STATE,
SYS_LAST_MODIFIED_BY,SYS_NC_TYPE,SYS_ERR_CODE,SYS_ERR_SVRTY 					
	  )
SEL 
REGIS_PRSNA_ID, 	MKTNG_PGM_NBR ,	LEGAL_ENT_NBR ,	CNTCT_POINT_CATEG_CODE,WIN_KEY,	SUBSCRPTN_OPT_NBR,SUBSCRPTN_OPT_IND,CNSMR_CHCE_DATETM ,	
PREF_CNTCT_POINT_IND,ADDR_LINE_1_TXT,ADDR_LINE_2_TXT,ADDR_LINE_3_TXT,STRET_NUM,	STRET_NAME,
APT_NUM,PO_BOX_NUM,	CITY_NAME,POSTL_AREA_CODE,TERR_NAME,CITY_CODE,TERR_CODE,CNTRY_CODE,LAT_MEAS,LONG_MEAS,GL_ACCURACY , 		
GL_MATCH_FLG,	DR_CLEANSE_LVL  ,VALID_CNTCT_POINT_IND 	,GUARDN_NAME,GUARDN_EMAIL_ADDR_TXT 	,GUARDN_CNSNT_IND,ACNLGMT_DATE,
POSTL_STATUS_CODE,PR_GEOCODE_FAIL,TQ_GOUT_MATCH_LEVEL,PR_REV_GROUP,DATA_SRCE_NBR,LAST_RTN_DATETM,
POSTL_ADDR_ID,SYS_SOURCE,SYS_TARGET_ID,SYS_AUTH_ID,SYS_CREATED_BY,SYS_CREATION_DATE,SYS_LAST_MODIFIED_DATE,SYS_ENT_STATE,
SYS_LAST_MODIFIED_BY,SYS_NC_TYPE,SYS_ERR_CODE,SYS_ERR_SVRTY
FROM DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_DUP2;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;



 .LABEL L9
INSERT INTO  MDM.CNTCT_POINT_CATEG
 (CNTCT_POINT_CATEG_CODE,CNTCT_POINT_CATEG_NAME,CNTCT_POINT_TYPE_CODE,INTRN_NETWK_IND,LOG_SOURCE_ID,LOG_UPDATE_USER,LOG_LOAD_ID)
VALUES('LN', 'Line' ,'S', null, null, 'dba', '1'); 
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L10
INSERT INTO MDM.ATTRIBUTE_VALUES 
  sel max(av_id)+1, (sel ATTRIBUTE_TYPE_ID from ATTRIBUTE_TYPES where ATTRIBUTE_TYPE='CONTACT_POINT_CATEGORY'), 'Y', 'Line', 'LN', 'LN', null, null, 'BackEnd', 'Rel 5.7.1', current_date, 'ACTIVE', null, null, null, null, null 
  from ATTRIBUTE_VALUES;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  
 .LABEL L11
UPDATE MDM.ID_SQR
  FROM (SEL MAX(AV_ID)+1 AS SEQ_NBR FROM MDM.ATTRIBUTE_VALUES) B
  SET SEQ_NR=B.SEQ_NBR
 WHERE DOC_NAME='AVID_SEQ_ID';
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L12
INSERT INTO ATTRIBUTE_VALUES_HIERARCHY (AV_ID_CHILD,AV_ID_PARENT,SYS_SOURCE)
Values ((SEL  MAX(AV_ID) FROM ATTRIBUTE_VALUES) , (SEL AV_ID FROM ATTRIBUTE_VALUES where AV_DESCRIPTION='Social Network Account') ,'BackEnd');
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L13
CREATE MULTISET TABLE MDM.OPT_OUT_I10_EMAIL_LIST_TEMP ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      LEAD_KEY_ID VARCHAR(18) CHARACTER SET LATIN NOT CASESPECIFIC,
      MKTNG_PGM_NBR DECIMAL(18,0),
      REGIS_PRSNA_ID DECIMAL(18,0),
      SUBSCRPTN_OPT_NBR DECIMAL(18,0),
      CNTCT_POINT_CATEG_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      EMAIL_ADDR_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      COMMUNICATION_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      RUN_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      DEPLOYED_DATE DATE FORMAT 'YYYY-MM-DD',
      ACTION_TIMESTAMP TIMESTAMP(0),
      LINK_URL VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      RECORD_TYPE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      MAILING_ID VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      WAVE_ID VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      LOAD_ID DECIMAL(18,0),
      LOAD_TS TIMESTAMP(0),
      MDM_LOAD_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      REGIS_CNSMR_ID_VAL VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ICRM_STG_LOAD_ID DECIMAL(18,0))
PRIMARY INDEX ( MKTNG_PGM_NBR ,REGIS_PRSNA_ID )
PARTITION BY MKTNG_PGM_NBR;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L14
CREATE MULTISET TABLE MDM.OPT_OUT_I10_LIST_PHONE ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      LEAD_KEY_ID VARCHAR(18) CHARACTER SET LATIN NOT CASESPECIFIC,
      MKTNG_PGM_NBR DECIMAL(18,0),
      REGIS_PRSNA_ID DECIMAL(18,0),
      SUBSCRPTN_OPT_NBR DECIMAL(18,0),
      CNTCT_POINT_CATEG_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      FULL_PHONE_NBR VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      VALID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      UNSUB CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DEPLOYED_DATE DATE FORMAT 'YYYY-MM-DD',
      LAST_ACTIVITY_TM TIMESTAMP(0),
      LOAD_ID DECIMAL(18,0),
      LOAD_TS TIMESTAMP(0),
      MDM_LOAD_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      REGIS_CNSMR_ID_VAL VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ICRM_STG_LOAD_ID DECIMAL(18,0))
PRIMARY INDEX ( MKTNG_PGM_NBR ,REGIS_PRSNA_ID )
PARTITION BY MKTNG_PGM_NBR;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L15
CREATE MULTISET TABLE MDM.POSTL_OPT_OUT_I10_TEMP ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      TRM_LEAD_KEY VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      REGIS_PRSNA_ID INTEGER,
      SUBSCRPTN_OPT_NBR INTEGER,
      CNTCT_POINT_CATEG_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      POSTL_DPLOYMT_DATE DATE FORMAT 'YYYY-MM-DD',
      LINK_WEB_URL VARCHAR(200) CHARACTER SET UNICODE NOT CASESPECIFIC,
      COMM_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      RUN_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      RESP_REC_TYPE_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      RESP_DATETM TIMESTAMP(6),
      MAILING_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      WAVE_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      MKTNG_PGM_NBR INTEGER,
      S_ADD1 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_ADD2 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_ADD3 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_CNTRY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ADDR_LINE_1_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LINE_2_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LINE_3_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      STRET_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      STRET_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      APT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      PO_BOX_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      CITY_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      TERR_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      CNTRY_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      POSTL_STATUS_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      LOAD_ID DECIMAL(18,0),
      LOAD_TS TIMESTAMP(0),
      MDM_LOAD_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      REGIS_CNSMR_ID_VAL VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ICRM_STG_LOAD_ID DECIMAL(18,0))
PRIMARY INDEX ( MKTNG_PGM_NBR ,REGIS_PRSNA_ID )
PARTITION BY MKTNG_PGM_NBR;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L16

REPLACE VIEW MDM.V_MATCHD_CNSMR_PRSNA
AS
LOCKING ROW FOR ACCESS
SELECT 
REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
,MATCHD_CNSMR_PRSNA_1.HSHLD_PRSNA_ID 
,REGIS_PRSNA_1.REGIS_PRSNA_ID 
,REGIS_PRSNA_1.MKTNG_PGM_NBR  
,REGIS_PRSNA_1.REGIS_CNSMR_ID_VAL
,REGIS_PRSNA_1.GVN_NAME
,REGIS_PRSNA_1.MID_NAME
,REGIS_PRSNA_1.FAMLY_NAME
,REGIS_PRSNA_1.FAMLY_NAME ||','|| REGIS_PRSNA_1.GVN_NAME AS FULL_NAME
,REGIS_PRSNA_1.BRTH_DATE
,REGIS_PRSNA_1.CNTRY_CODE AS CNTRY_NAME
,REGIS_PRSNA_1.NATIONAL_ID_NBR
,REGIS_PRSNA_1.PRSNA_STATUS_CODE
,TRIM(REGIS_PRSNA_1.NAME_PREFX_TXT) AS NAME_PREFX_TXT
,TRIM(REGIS_PRSNA_1.NAME_SUFFX_TXT) AS NAME_SUFFX_TXT
,REGIS_PRSNA_1.CNSMR_USER_NAME
,REGIS_PRSNA_1.GENDR_IND
,REGIS_PRSNA_1.LEGAL_ENT_NBR
,REGIS_PRSNA_1.LANG_CODE AS LANG_CODE
,REGIS_PRSNA_1.LANG_CODE AS LANG_NAME
,REGIS_PRSNA_1.DATA_ORIGIN_SRCE_NBR 
,PRSNA_POSTL_ADDR_1.ADDR_LINE_1_TXT
,PRSNA_POSTL_ADDR_1.ADDR_LINE_2_TXT
,PRSNA_POSTL_ADDR_1.ADDR_LINE_3_TXT
,PRSNA_POSTL_ADDR_1.STRET_NUM
,PRSNA_POSTL_ADDR_1.STRET_NAME
,PRSNA_POSTL_ADDR_1.APT_NUM
,PRSNA_POSTL_ADDR_1.PO_BOX_NUM
,PRSNA_POSTL_ADDR_1.CITY_NAME
,PRSNA_POSTL_ADDR_1.TERR_CODE
,PRSNA_POSTL_ADDR_1.TERR_CODE AS TERR_NAME
,PRSNA_POSTL_ADDR_1.POSTL_AREA_CODE
,PRSNA_POSTL_ADDR_1.WIN_KEY
,COALESCE(PRSNA_POSTL_ADDR_1.ADDR_LINE_1_TXT,'') ||  ' ' ||
COALESCE(PRSNA_POSTL_ADDR_1.ADDR_LINE_2_TXT,'') ||   ' ' ||
COALESCE(PRSNA_POSTL_ADDR_1.CITY_NAME,'') ||  ' ' ||
COALESCE(PRSNA_POSTL_ADDR_1.POSTL_AREA_CODE,'') AS FULL_ADDRESS
,MKTNG_PGM_1.MKTNG_PGM_NAME
,NULL (INTEGER)   AS  SYS_TARGET_ID
,NULL (VARCHAR(25))  AS SYS_AUTH_ID
,NULL (VARCHAR(25))  AS SYS_SOURCE
,NULL (VARCHAR(70))  AS SYS_CREATED_BY
,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE
,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25))  AS SYS_NC_TYPE
,NULL (VARCHAR(10000))  AS SYS_ERR_CODE
,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
,NULL (VARCHAR(200))  AS EMAIL_ADDR_TXT_1 
,NULL (SMALLINT) AS PHONE_CNTRY_NBR_1
,NULL (SMALLINT) AS PHONE_AREA_NBR_1
,NULL (SMALLINT) AS PHONE_EXCHG_NBR_1
,NULL  (BIGINT) AS PHONE_LINE_NBR_1
,NULL (VARCHAR(20)) AS PHONE_EXTSN_NUM_1
,NULL  (VARCHAR(20))  AS FULL_PHONE_NUM_1
,PRSNA_POSTL_ADDR_1.SUBSCRPTN_OPT_NBR AS SUBSCRPTN_OPT_NBR
,PRSNA_POSTL_ADDR_1.SUBSCRPTN_OPT_IND AS SUBSCRPTN_OPT_IND
,PRSNA_POSTL_ADDR_1.CNSMR_CHCE_DATETM  AS CNSMR_CHCE_DATETM
,'A'  CNTCT_POINT_TYPE_CODE
,'ADDRESS'  CNTCT_POINT_TYPE
,PRSNA_POSTL_ADDR_1.CNTCT_POINT_CATEG_CODE  AS CNTCT_POINT_CATEG_CODE
,CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_NAME  AS CNTCT_POINT_CATEG_NAME
,SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NAME
FROM REGIS_PRSNA REGIS_PRSNA_1
JOIN REGIS_PRSNA_POSTL_ADDR PRSNA_POSTL_ADDR_1
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_POSTL_ADDR_1.REGIS_PRSNA_ID
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_POSTL_ADDR_1.MKTNG_PGM_NBR
AND PRSNA_POSTL_ADDR_1.SUBSCRPTN_OPT_IND = 'I'
JOIN MKTNG_PGM MKTNG_PGM_1
ON REGIS_PRSNA_1.MKTNG_PGM_NBR = MKTNG_PGM_1.MKTNG_PGM_NBR
JOIN SUBSCRPTN_OPT SUBSCRPTN_OPT_1
ON PRSNA_POSTL_ADDR_1.SUBSCRPTN_OPT_NBR=SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NBR
AND PRSNA_POSTL_ADDR_1.MKTNG_PGM_NBR = SUBSCRPTN_OPT_1.MKTNG_PGM_NBR
JOIN CNTCT_POINT_CATEG CNTCT_POINT_CATEG_1
ON PRSNA_POSTL_ADDR_1.CNTCT_POINT_CATEG_CODE=CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_CODE
JOIN MATCHD_CNSMR_PRSNA MATCHD_CNSMR_PRSNA_1
ON REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID=MATCHD_CNSMR_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
AND REGIS_PRSNA_1.LEGAL_ENT_NBR=MATCHD_CNSMR_PRSNA_1.LEGAL_ENT_NBR
UNION ALL
SELECT 
REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
,MATCHD_CNSMR_PRSNA_1.HSHLD_PRSNA_ID 
,REGIS_PRSNA_1.REGIS_PRSNA_ID 
,REGIS_PRSNA_1.MKTNG_PGM_NBR  
,REGIS_PRSNA_1.REGIS_CNSMR_ID_VAL
,REGIS_PRSNA_1.GVN_NAME
,REGIS_PRSNA_1.MID_NAME
,REGIS_PRSNA_1.FAMLY_NAME
,REGIS_PRSNA_1.FAMLY_NAME ||','|| REGIS_PRSNA_1.GVN_NAME AS FULL_NAME
,REGIS_PRSNA_1.BRTH_DATE
,REGIS_PRSNA_1.CNTRY_CODE AS CNTRY_NAME
,REGIS_PRSNA_1.NATIONAL_ID_NBR
,REGIS_PRSNA_1.PRSNA_STATUS_CODE
,TRIM(REGIS_PRSNA_1.NAME_PREFX_TXT) AS NAME_PREFX_TXT
,TRIM(REGIS_PRSNA_1.NAME_SUFFX_TXT) AS NAME_SUFFX_TXT
,REGIS_PRSNA_1.CNSMR_USER_NAME
,REGIS_PRSNA_1.GENDR_IND
,REGIS_PRSNA_1.LEGAL_ENT_NBR
,REGIS_PRSNA_1.LANG_CODE AS LANG_CODE
,REGIS_PRSNA_1.LANG_CODE AS LANG_NAME
,REGIS_PRSNA_1.DATA_ORIGIN_SRCE_NBR 
, NULL (VARCHAR(500) ) AS ADDR_LINE_1_TXT
,NULL  (VARCHAR(500) )AS ADDR_LINE_2_TXT
,NULL  (VARCHAR(500) )AS ADDR_LINE_3_TXT
,NULL (VARCHAR(20))AS STRET_NUM
,NULL ( VARCHAR(100) )AS STRET_NAME
,NULL (VARCHAR(20) )AS APT_NUM
,NULL (VARCHAR(20) )AS PO_BOX_NUM
,NULL ( VARCHAR(100) )AS CITY_NAME
,NULL ( CHAR(8) )AS TERR_CODE
,NULL ( VARCHAR(100))AS  TERR_NAME
,NULL (VARCHAR(20)) AS POSTL_AREA_CODE
,NULL ( VARCHAR(100) )AS WIN_KEY
,NULL  (VARCHAR(10000))  AS FULL_ADDRESS
,MKTNG_PGM_1.MKTNG_PGM_NAME
,NULL (INTEGER)   AS  SYS_TARGET_ID
,NULL (VARCHAR(25))  AS SYS_AUTH_ID
,NULL (VARCHAR(25))  AS SYS_SOURCE
,NULL (VARCHAR(70))  AS SYS_CREATED_BY
,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE
,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25))  AS SYS_NC_TYPE
,NULL (VARCHAR(10000))  AS SYS_ERR_CODE
,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
,NULL (VARCHAR(200))  AS EMAIL_ADDR_TXT_1 
,PRSNA_PHONE_1.PHONE_CNTRY_NBR AS PHONE_CNTRY_NBR_1
,PRSNA_PHONE_1.PHONE_AREA_NBR  AS PHONE_AREA_NBR_1
,PRSNA_PHONE_1.PHONE_EXCHG_NBR AS PHONE_EXCHG_NBR_1
,PRSNA_PHONE_1.PHONE_LINE_NBR  AS PHONE_LINE_NBR_1
,PRSNA_PHONE_1.PHONE_EXTSN_NUM AS PHONE_EXTSN_NUM_1
,PRSNA_PHONE_1.FULL_PHONE_NUM  AS FULL_PHONE_NUM_1
,PRSNA_PHONE_1.SUBSCRPTN_OPT_NBR AS SUBSCRPTN_OPT_NBR
,PRSNA_PHONE_1.SUBSCRPTN_OPT_IND AS SUBSCRPTN_OPT_IND
,PRSNA_PHONE_1.CNSMR_CHCE_DATETM  AS CNSMR_CHCE_DATETM
,'P'  CNTCT_POINT_TYPE_CODE
,'PHONE'  CNTCT_POINT_TYPE
,PRSNA_PHONE_1.CNTCT_POINT_CATEG_CODE  AS CNTCT_POINT_CATEG_CODE
,CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_NAME  AS CNTCT_POINT_CATEG_NAME
,SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NAME
FROM REGIS_PRSNA REGIS_PRSNA_1
JOIN REGIS_PRSNA_PHONE PRSNA_PHONE_1
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_PHONE_1.REGIS_PRSNA_ID
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_PHONE_1.MKTNG_PGM_NBR
AND PRSNA_PHONE_1.SUBSCRPTN_OPT_IND = 'I'
JOIN MKTNG_PGM MKTNG_PGM_1
ON REGIS_PRSNA_1.MKTNG_PGM_NBR = MKTNG_PGM_1.MKTNG_PGM_NBR
JOIN SUBSCRPTN_OPT SUBSCRPTN_OPT_1
ON PRSNA_PHONE_1.SUBSCRPTN_OPT_NBR=SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NBR
AND PRSNA_PHONE_1.MKTNG_PGM_NBR = SUBSCRPTN_OPT_1.MKTNG_PGM_NBR
JOIN CNTCT_POINT_CATEG CNTCT_POINT_CATEG_1
ON PRSNA_PHONE_1.CNTCT_POINT_CATEG_CODE=CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_CODE
JOIN MATCHD_CNSMR_PRSNA MATCHD_CNSMR_PRSNA_1
ON REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID=MATCHD_CNSMR_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
AND REGIS_PRSNA_1.LEGAL_ENT_NBR=MATCHD_CNSMR_PRSNA_1.LEGAL_ENT_NBR
UNION ALL
SELECT 
REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
,MATCHD_CNSMR_PRSNA_1.HSHLD_PRSNA_ID 
,REGIS_PRSNA_1.REGIS_PRSNA_ID 
,REGIS_PRSNA_1.MKTNG_PGM_NBR  
,REGIS_PRSNA_1.REGIS_CNSMR_ID_VAL
,REGIS_PRSNA_1.GVN_NAME
,REGIS_PRSNA_1.MID_NAME
,REGIS_PRSNA_1.FAMLY_NAME
,REGIS_PRSNA_1.FAMLY_NAME ||','|| REGIS_PRSNA_1.GVN_NAME AS FULL_NAME
,REGIS_PRSNA_1.BRTH_DATE
,REGIS_PRSNA_1.CNTRY_CODE AS CNTRY_NAME
,REGIS_PRSNA_1.NATIONAL_ID_NBR
,REGIS_PRSNA_1.PRSNA_STATUS_CODE
,TRIM(REGIS_PRSNA_1.NAME_PREFX_TXT) AS NAME_PREFX_TXT
,TRIM(REGIS_PRSNA_1.NAME_SUFFX_TXT) AS NAME_SUFFX_TXT
,REGIS_PRSNA_1.CNSMR_USER_NAME
,REGIS_PRSNA_1.GENDR_IND
,REGIS_PRSNA_1.LEGAL_ENT_NBR
,REGIS_PRSNA_1.LANG_CODE AS LANG_CODE
,REGIS_PRSNA_1.LANG_CODE AS LANG_NAME
,REGIS_PRSNA_1.DATA_ORIGIN_SRCE_NBR 
, NULL (VARCHAR(500) ) AS ADDR_LINE_1_TXT
,NULL  (VARCHAR(500) )AS ADDR_LINE_2_TXT
,NULL  (VARCHAR(500) )AS ADDR_LINE_3_TXT
,NULL (VARCHAR(20))AS STRET_NUM
,NULL ( VARCHAR(100) )AS STRET_NAME
,NULL (VARCHAR(20) )AS APT_NUM
,NULL (VARCHAR(20) )AS PO_BOX_NUM
,NULL ( VARCHAR(100) )AS CITY_NAME
,NULL ( CHAR(8) )AS TERR_CODE
,NULL ( VARCHAR(100))AS  TERR_NAME
,NULL (VARCHAR(20)) AS POSTL_AREA_CODE
,NULL ( VARCHAR(100) )AS WIN_KEY
,NULL  (VARCHAR(10000))  AS FULL_ADDRESS
,MKTNG_PGM_1.MKTNG_PGM_NAME
,NULL (INTEGER)   AS  SYS_TARGET_ID
,NULL (VARCHAR(25))  AS SYS_AUTH_ID
,NULL (VARCHAR(25))  AS SYS_SOURCE
,NULL (VARCHAR(70))  AS SYS_CREATED_BY
,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE
,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25))  AS SYS_NC_TYPE
,NULL (VARCHAR(10000))  AS SYS_ERR_CODE
,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
,PRSNA_EMAIL_ADDR_1.EMAIL_ADDR_TXT AS EMAIL_ADDR_TXT_1 
,NULL (SMALLINT) AS PHONE_CNTRY_NBR_1
,NULL (SMALLINT) AS PHONE_AREA_NBR_1
,NULL (SMALLINT) AS PHONE_EXCHG_NBR_1
,NULL  (BIGINT) AS PHONE_LINE_NBR_1
,NULL (VARCHAR(20)) AS PHONE_EXTSN_NUM_1
,NULL  (VARCHAR(20))  AS FULL_PHONE_NUM_1
,PRSNA_EMAIL_ADDR_1.SUBSCRPTN_OPT_NBR AS SUBSCRPTN_OPT_NBR
,PRSNA_EMAIL_ADDR_1.SUBSCRPTN_OPT_IND AS SUBSCRPTN_OPT_IND
,PRSNA_EMAIL_ADDR_1.CNSMR_CHCE_DATETM  AS CNSMR_CHCE_DATETM
,'E'  CNTCT_POINT_TYPE_CODE
,'EMAIL'  CNTCT_POINT_TYPE
,PRSNA_EMAIL_ADDR_1.CNTCT_POINT_CATEG_CODE  AS CNTCT_POINT_CATEG_CODE
,CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_NAME  AS CNTCT_POINT_CATEG_NAME
,SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NAME
FROM REGIS_PRSNA REGIS_PRSNA_1
JOIN REGIS_PRSNA_EMAIL_ADDR PRSNA_EMAIL_ADDR_1
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_EMAIL_ADDR_1.REGIS_PRSNA_ID
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_EMAIL_ADDR_1.MKTNG_PGM_NBR
AND PRSNA_EMAIL_ADDR_1.SUBSCRPTN_OPT_IND = 'I'
JOIN MKTNG_PGM MKTNG_PGM_1
ON REGIS_PRSNA_1.MKTNG_PGM_NBR = MKTNG_PGM_1.MKTNG_PGM_NBR
JOIN SUBSCRPTN_OPT SUBSCRPTN_OPT_1
ON PRSNA_EMAIL_ADDR_1.SUBSCRPTN_OPT_NBR=SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NBR
AND PRSNA_EMAIL_ADDR_1.MKTNG_PGM_NBR = SUBSCRPTN_OPT_1.MKTNG_PGM_NBR
JOIN CNTCT_POINT_CATEG CNTCT_POINT_CATEG_1
ON PRSNA_EMAIL_ADDR_1.CNTCT_POINT_CATEG_CODE=CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_CODE
JOIN MATCHD_CNSMR_PRSNA MATCHD_CNSMR_PRSNA_1
ON REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID=MATCHD_CNSMR_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
AND REGIS_PRSNA_1.LEGAL_ENT_NBR=MATCHD_CNSMR_PRSNA_1.LEGAL_ENT_NBR;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;