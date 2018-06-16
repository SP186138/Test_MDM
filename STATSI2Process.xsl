<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  ***** MESSAGE SENT FROM TERADATA MDM ***********
 <br/>
 <br/>
<strong>Type of Request:</strong> – Alert
<br/>
<strong>Urgency:</strong> Medium
<br/>
<strong>Priority:</strong> P2-High
<br/>
<strong>Impact:</strong> Medium
<br/>
<strong>Category:</strong> MDM
<br/>
<strong>Subcategory : </strong> Wrapper Validation
<br/>
<strong>Description: </strong> Mentioned below is a list/s of load ids with EDW count as 0 though the staging count is non-zero  
<br/>
<br/>
Operations,
Please refer to the table below for details, identify root cause and reprocess the affected load id(s).

<br/>
<br/>
  <h2>LOAD DETAILS</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>LOAD_ID</th>
        <th>SOURCE_ID</th>
        <th>DATA_SOURCE</th>
        <th>MKTNG_PGM_NBR</th>
        <th>MKTNG_PGM_NAME</th>
        <th>LEGAL_ENT_NBR</th>
        <th>LEGAL_ENT_NAME</th>
        <th>STAGING_COUNT</th>
	<th>STAGING_REJECT_COUNT</th>
        <th>STAGING_REJECT_DESC</th>
        <th>ACTIVE_COUNT</th>
        <th>DUPLICATE_COUNT</th>
		<th>WEBSITE_REGIS_COUNT</th>
        <th>TOTAL_ERROR_COUNT</th>
        <th>ERROR_DESC</th>
        <th>ERROR_COUNT</th>
      </tr>
      <xsl:for-each select="XML_DATA">
      <tr>
        <td><xsl:value-of select="REPORT/SQL_RESULT/LOAD_ID/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/SOURCE_ID/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/DATA_SOURCE/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/MKTNG_PGM_NAME/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/LEGAL_ENT_NBR/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/LEGAL_ENT_NAME/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/STAGING_NBR/@Value"/></td>
	<td><xsl:value-of select="REPORT/SQL_RESULT/STG_REJECT_CNT/@Value"/></td>
	<td><xsl:value-of select="REPORT/SQL_RESULT/STG_REJECT_DESC/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/ACTIVE_NBR/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/DUPLICATE_NBR/@Value"/></td>
		<td><xsl:value-of select="REPORT/SQL_RESULT/WEBSITE_REGIS_NBR/@Value"/></td>
        <td><xsl:value-of select="REPORT/SQL_RESULT/TOTAL_ERROR_NBR/@Value"/></td>
        <td><xsl:value-of select="REPORT1/message/@Value"/></td>
        <td><xsl:value-of select="ERROR_CODE_NBR/@Value"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

