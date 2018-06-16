<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE SENT FROM TERADATA MDM ***********
 <br/>
 <br/>
 <strong>Rule Run Date: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_RUN_DATE /@Value"/>
<br/> 
<strong>Project Name: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/PROJECT_NAME/@Value"/>
<br/>
<strong>Project Number: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/PROJECT_ID/@Value"/>
<br/>
<strong>Rule Name: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_NAME/@Value"/>
<br/> 
<strong>Rule Number: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_NUMBER/@Value"/>
<br/>
<strong>Rule Description: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_DESC/@Value"/>
<br/>
<strong>Rule Revision: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_REVISION /@Value"/>
<br/>
<strong>Rule Frequency: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/FREQUENCY/@Value"/>
<br/>
<strong>Detail Query: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/DETAIL_QUERY/@Value"/>
<br/>
<strong>Rule creator : </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RuleCreatorName/@Value"/> - <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RuleCreatorEmail/@Value"/> ;
<br/>
<strong>Escalations : </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/escalationName/@Value"/> - <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/escalationEmail/@Value"/> 
<br/>

<strong>Instructions: </strong> <p> <pre> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/NOTES/@Value" disable-output-escaping="yes" /> </pre> </p>
<br/>
<br/>
<strong>Priority: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/SN_Priority/@Value"/>
<br/>
<strong>Error Message: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/ErrorMessage/@Value"/>
<br/>
<strong>Opened by (Requester): </strong> DQRM Administrator
<br/>
<strong>Category: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/SN_Category/@Value"/>
<br/>
<strong>Subcategory: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/SN_Subcategory/@Value"/>
<br/>
<strong>Migration Tasks: </strong> No
<br/>
<strong>Regional Identification: </strong> Global
<br/>
<strong>Environment: </strong> Prod
<br/>
<strong>Assignment Group: </strong> Teradata_CS_1CP_MS_Support
<br/>


<br/>
<br/>
<h2>RULE RUN DATA</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>PROJECT_ID</th>
        <th>RULE_NUMBER</th>
        <th>RULE_REVISION</th>
        <th>MEASURE_DATE</th>
        <th>MEASURE_TIME</th>
        <th>PROCESS_ID</th>
        <th>EXECUTION_DATE</th>
        <th>START_TIME</th>
		<th>END_TIME</th>
        <th>TOTAL_RECORDS_MEASURED</th>
        <th>TOTAL_DEVIATIONS_FOUND</th>
		<th>ACTUAL_THRESHOLD_PCT</th>
        <th>QUALITY_TRESHOLD_PCT</th>
		<th>THRESHOLD_FAILURE_FLAG</th>
        <th>REGION_CODE</th>
		<th>LEGAL_ENT_NBR</th>
        <th>LEGAL_ENT_NAME</th>
		<th>MKTNG_PGM_NBR</th>
        <th>MKTNG_PGM_DESC</th>
		<th>DATA_SRCE_NBR</th>
        <th>DATA_SRCE_NAME</th>
      </tr>
      <xsl:for-each select="XML_DATA/REPORT1/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="PROJECT_ID/@Value"/></td>
        <td><xsl:value-of select="RULE_NUMBER/@Value"/></td>
        <td><xsl:value-of select="RULE_REVISION/@Value"/></td>
        <td><xsl:value-of select="MEASURE_DATE/@Value"/></td>
        <td><xsl:value-of select="MEASURE_TIME/@Value"/></td>
        <td><xsl:value-of select="PROCESS_ID/@Value"/></td>
        <td><xsl:value-of select="EXECUTION_DATE/@Value"/></td>
        <td><xsl:value-of select="START_TIME/@Value"/></td>
		<td><xsl:value-of select="END_TIME/@Value"/></td>
		<td><xsl:value-of select="TOTAL_RECORDS_MEASURED/@Value"/></td>
        <td><xsl:value-of select="TOTAL_DEVIATIONS_FOUND/@Value"/></td>
		<td><xsl:value-of select="ACTUAL_THRESHOLD_PCT/@Value"/></td>
        <td><xsl:value-of select="QUALITY_TRESHOLD_PCT/@Value"/></td>
		<td><xsl:value-of select="THRESHOLD_FAILURE_FLAG/@Value"/></td>
        <td><xsl:value-of select="REGION_CODE/@Value"/></td>
		<td><xsl:value-of select="LEGAL_ENT_NBR/@Value"/></td>
        <td><xsl:value-of select="LEGAL_ENT_NAME/@Value"/></td>
		<td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_DESC/@Value"/></td>
		<td><xsl:value-of select="DATA_SRCE_NBR/@Value"/></td>
        <td><xsl:value-of select="DATA_SRCE_NAME/@Value"/></td>
      </tr>
      </xsl:for-each>
    </table>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>