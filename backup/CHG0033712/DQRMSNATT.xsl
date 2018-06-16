<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE SENT FROM TERADATA MDM ***********

<h2>DATA HERE</h2>
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