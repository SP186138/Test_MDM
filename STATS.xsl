<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
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
      <xsl:for-each select="XML_DATA/REPORT/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="LOAD_ID/@Value"/></td>
        <td><xsl:value-of select="SOURCE_ID/@Value"/></td>
        <td><xsl:value-of select="DATA_SOURCE/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_NAME/@Value"/></td>
        <td><xsl:value-of select="LEGAL_ENT_NBR/@Value"/></td>
        <td><xsl:value-of select="LEGAL_ENT_NAME/@Value"/></td>
        <td><xsl:value-of select="STAGING_NBR/@Value"/></td>
	<td><xsl:value-of select="STG_REJECT_CNT/@Value"/></td>
	<td><xsl:value-of select="STG_REJECT_DESC/@Value"/></td>
        <td><xsl:value-of select="ACTIVE_NBR/@Value"/></td>
        <td><xsl:value-of select="DUPLICATE_NBR/@Value"/></td>
		<td><xsl:value-of select="WEBSITE_REGIS_NBR/@Value"/></td>
        <td><xsl:value-of select="TOTAL_ERROR_NBR/@Value"/></td>
        <td><xsl:value-of select="ERR_DESC/@Value"/></td>
        <td><xsl:value-of select="ERROR_CODE_NBR/@Value"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

