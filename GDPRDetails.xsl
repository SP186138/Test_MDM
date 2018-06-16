<?xml version="1.0" encoding="UTF-8" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <head>
 <style>
p.ex1 {
    margin-left: 10cm;
	font-family: Arial, Helvetica, sans-serif;
}
h2{
    font-size: 100%;
}
h3 {
    font-size: 100%;
}
h4 {
    font-size: 100%;
}
h5 {
    font-size: 100%;
}
h6 {
    font-size: 100%;
}
h7 {
    font-size: 100%;
}
h8 {
    font-size: 100%;
}
h9 {
    font-size: 100%;
}
h10 {
    font-size: 100%;
}
th {
    background-color: #000000;
	color:#ffffff;
}
tr:nth-child(even) {
    background-color: #DCC8E7;
}
table,th,td {
        border: 1px solid black;
}
</style>
 </head>
 <body>
 <p class="ex1"><b>1, CONSUMER PLACE CONSUMER DETAILS</b></p>
 <br/>
<h1><b>Registration</b></h1>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Given Name</th>
		<th>Middle Name</th>
        <th>Family Name</th>
		<th>Full Name</th>
        <th>Birth Date</th>
        <th>Gender</th>
        <th>User Name</th>
        <th>National ID</th>
	    <th>Language</th>
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
		<td><xsl:value-of select="GVN_NAME/@Value"/></td>
		<td><xsl:value-of select="MID_NAME/@Value"/></td>
        <td><xsl:value-of select="FAMLY_NAME/@Value"/></td>
		<td><xsl:value-of select="FULL_NAME/@Value"/></td>
        <td><xsl:value-of select="BRTH_DATE/@Value"/></td>
        <td><xsl:value-of select="GENDR_IND/@Value"/></td>
        <td><xsl:value-of select="CNSMR_USER_NAME/@Value"/></td>
        <td><xsl:value-of select="NATIONAL_ID_NBR/@Value"/></td>
		<td><xsl:value-of select="LANG_NAME/@Value"/></td>
	      </tr>
      </xsl:for-each>
    </table>
	<br/>
	<h2><b>Email</b></h2>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Subscription ID</th>
        <th>Subscription Text</th>
        <th>Subscription Opt Indicator</th>
        <th>Subscription Opt Timestamp</th>
        <th>Email Address</th>		    
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/EMAIL_RESULTS/SQL_RESULT">
      <tr>
	  <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
	  <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
	  <td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
      <td><xsl:value-of select="SUBSCRPTN_OPT_NBR/@Value"/></td>       
      <td><xsl:value-of select="SUBSCRPTN_OPT_NAME/@Value"/></td>
	  <td><xsl:value-of select="SUBSCRPTN_OPT_IND_NAME/@Value"/></td>
	  <td><xsl:value-of select="CNSMR_CHCE_DATETM/@Value"/></td>
	  <td><xsl:value-of select="EMAIL_ADDR_TXT/@Value"/></td>	  
	      </tr>
      </xsl:for-each>
    </table>
	<br/>
	<h3><b>Phone</b></h3>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Subscription ID</th>
        <th>Subscription Text</th>
        <th>Subscription Opt Indicator</th>
        <th>Subscription Opt Timestamp</th>
        <th>Phone Number</th>		      
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/PHONE_RESULTS/SQL_RESULT">
      <tr>
	  <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
	  <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
      <td><xsl:value-of select="SUBSCRPTN_OPT_NBR/@Value"/></td>       
      <td><xsl:value-of select="SUBSCRPTN_OPT_NAME/@Value"/></td>
	  <td><xsl:value-of select="SUBSCRPTN_OPT_IND/@Value"/></td>
	  <td><xsl:value-of select="CNSMR_CHCE_DATETM/@Value"/></td>
	  <td><xsl:value-of select="FULL_PHONE_NUM/@Value"/></td>	  
	      </tr>
      </xsl:for-each>
    </table>
	<br/>
	<h4><b>Postal</b></h4>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Subscription ID</th>
        <th>Subscription Text</th>
        <th>Subscription Opt Indicator</th>
        <th>Subscription Opt Timestamp</th>
        <th>Postal Address</th>
		<th>Address Type</th>
		<th>Country</th>	
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/ADDRESS_RESULTS/SQL_RESULT">
      <tr>
	  <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
	  <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
	  <td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
      <td><xsl:value-of select="SUBSCRPTN_OPT_NBR/@Value"/></td>       
      <td><xsl:value-of select="SUBSCRPTN_OPT_NAME/@Value"/></td>
	  <td><xsl:value-of select="SUBSCRPTN_OPT_IND/@Value"/></td>
	  <td><xsl:value-of select="CNSMR_CHCE_DATETM/@Value"/></td>
	  <td><xsl:value-of select="FULL_ADDRESS/@Value"/></td>
	  <td><xsl:value-of select="ADDRESS_TYPE/@Value"/></td>
	  <td><xsl:value-of select="CNTRY_DESC/@Value"/></td>
	      </tr>
      </xsl:for-each>
    </table>
	<br/>
	<h5><b>Dependents</b></h5>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Sequence Number</th>
        <th>Dependent Name</th>
        <th>Dependent Birth Date</th>      
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/DPEND/SQL_RESULT">
      <tr>
	  <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
	  <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
      <td><xsl:value-of select="DPEND_SEQ_NBR/@Value"/></td>       
      <td><xsl:value-of select="DPEND_NAME/@Value"/></td>
	  <td><xsl:value-of select="DPEND_BRTH_DATE/@Value"/></td>
	  </tr>
      </xsl:for-each>
    </table>
	<br/>
	<h6><b>Pets</b></h6>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Sequence Number</th>
        <th>Pet Name</th>
        <th>Pet Birth Date</th>      
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/PET_RESULT/SQL_RESULT">
      <tr>
	  <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
	  <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
      <td><xsl:value-of select="PET_SEQ_NBR/@Value"/></td>
      <td><xsl:value-of select="PET_NAME/@Value"/></td>
	  <td><xsl:value-of select="PET_BRTH_DATE/@Value"/></td>
	  </tr>
      </xsl:for-each>
    </table>
	<br/>
	<h7><b>Traits</b></h7>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Sequence Number</th>
        <th>Trait Number</th>
		<th>Trait Name</th> 
        <th>Trait Type</th>
		<th>Trait Text</th>
		<th>Trait Date</th>     		
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/TRAIT_DETAILS/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="TRT_SEQ_NBR/@Value"/></td>
        <td><xsl:value-of select="TRT_NBR/@Value"/></td>
		<td><xsl:value-of select="TRT_NAME/@Value"/></td>
        <td><xsl:value-of select="TRAIT_TYPE/@Value"/></td>
		<td><xsl:value-of select="TRT_TXT/@Value"/></td>
		<td><xsl:value-of select="TRT_DATE/@Value"/></td>
	  </tr>
      </xsl:for-each>
    </table>
	<br/>
		<h8><b>Consumer Actions</b></h8>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Consumer Action Type</th>
        <th>Consumer Action Sub-Type</th>
		<th>Number Of Actions</th> 		
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/CONSUMER_ACTIONS/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="CNSMR_ACTN_TYPE_CODE/@Value"/></td>
        <td><xsl:value-of select="CNSMR_ACTN_NUM/@Value"/></td>
		<td><xsl:value-of select="NBR_OF_ACTNS/@Value"/></td>
	  </tr>
      </xsl:for-each>
    </table>
	<br/>

		<h10><b>Loyalty Tier History</b></h10>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Loyalty Account Number</th>
		<th>Tier Join Date</th>
		<th>Tier Expiry Date</th>
		<th>Loyalty Level</th>
		<th>Process Date</th>
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/LOYALTY_TIER_HISTORY/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="LYLTY_ACCT_NUM/@Value"/></td>
		<td><xsl:value-of select="TIER_JOIN_DATE/@Value"/></td>
		<td><xsl:value-of select="TIER_EXPR_DATE/@Value"/></td>
		<td><xsl:value-of select="LYLTY_LVL_CODE/@Value"/></td>
		<td><xsl:value-of select="PROCESS_DATE/@Value"/></td>
	  </tr>
      </xsl:for-each>
    </table>
	<br/>
		<h11><b>Loyalty</b></h11>
    <table>
      <tr>
        <th>Registration ID</th>
        <th>Marketing Program Name</th>
		<th>Marketing Program Number</th>
        <th>Loyalty Account Number</th>
		<th>Point Balance</th>
      </tr>
      <xsl:for-each select="//MESSAGE/XML_DATA/REPORT/V_REGIS_PRSNA/LOYALTY/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="LYLTY_ACCT_NUM/@Value"/></td>
		<td><xsl:value-of select="ENDG_PTS_QTY/@Value"/></td>
	  </tr>
      </xsl:for-each>
    </table>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>