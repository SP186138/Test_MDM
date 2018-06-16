<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>ERROR DETAILS INCENTIVE</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>INCTV_NBR</th>
        <th>MKTNG_PGM_NBR</th>
        <th>INCTV_NAME</th>
        <th>INCTV_DESC</th>
        <th>INCTV_VAL_AMT</th>
        <th>INCTV_VAL_PCT</th>
        <th>INCTV_START_DATE</th>
        <th>INCTV_END_DATE</th>
	<th>INCTV_EXPRN_DATETM</th>
        <th>INCTV_EXPRN_DAY_CNT</th>
        <th>INCTV_CRTN_DATE</th>
        <th>INCTV_STATUS_CODE</th>
        <th>INCTV_TYPE_CODE</th>
        <th>BRAND_NAME</th>
        <th>ALT_SYS_INCTV_ID</th>
		<th>COUPN_TYPE_CODE</th>
        <th>OTHER_INCENTIVE_TXT</th>
        <th>BUNDLE_PACK_IND</th>
        <th>PREMARKET_OFFER_IND</th>
		<th>EXT_INCTV_CD</th>
        <th>COUPN_EXT_CD</th>
        <th>INCTV_UOM_CD</th>
        <th>TGT_DST_QTY</th>
		<th>CLRNG_HS_CD</th>
        <th>SYS_ERROR_ID</th>
        <th>SYS_ERR_CODE</th>
        <th>SYS_ERR_SVRTY</th>
		 <th>SYS_LOAD_ID</th>
        <th>SYS_WORKFLOW_ID</th>
      </tr>
      <xsl:for-each select="XML_DATA/REPORT/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="INCTV_NBR/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="INCTV_NAME/@Value"/></td>
        <td><xsl:value-of select="INCTV_DESC/@Value"/></td>
        <td><xsl:value-of select="INCTV_VAL_AMT/@Value"/></td>
        <td><xsl:value-of select="INCTV_VAL_PCT/@Value"/></td>
        <td><xsl:value-of select="INCTV_START_DATE/@Value"/></td>
        <td><xsl:value-of select="INCTV_END_DATE/@Value"/></td>
	<td><xsl:value-of select="INCTV_EXPRN_DATETM/@Value"/></td>
	<td><xsl:value-of select="INCTV_EXPRN_DAY_CNT/@Value"/></td>
        <td><xsl:value-of select="INCTV_CRTN_DATE/@Value"/></td>
        <td><xsl:value-of select="INCTV_STATUS_CODE/@Value"/></td>
        <td><xsl:value-of select="INCTV_TYPE_CODE/@Value"/></td>
        <td><xsl:value-of select="BRAND_NAME/@Value"/></td>
        <td><xsl:value-of select="ALT_SYS_INCTV_ID/@Value"/></td>
	   <td><xsl:value-of select="COUPN_TYPE_CODE/@Value"/></td>
        <td><xsl:value-of select="OTHER_INCENTIVE_TXT/@Value"/></td>
        <td><xsl:value-of select="BUNDLE_PACK_IND/@Value"/></td>
        <td><xsl:value-of select="PREMARKET_OFFER_IND/@Value"/></td>
        <td><xsl:value-of select="EXT_INCTV_CD/@Value"/></td>
        <td><xsl:value-of select="COUPN_EXT_CD/@Value"/></td>
	<td><xsl:value-of select="INCTV_UOM_CD/@Value"/></td>
	<td><xsl:value-of select="TGT_DST_QTY/@Value"/></td>
        <td><xsl:value-of select="CLRNG_HS_CD/@Value"/></td>
        <td><xsl:value-of select="SYS_ERROR_ID/@Value"/></td>
        <td><xsl:value-of select="SYS_ERR_CODE/@Value"/></td>
        <td><xsl:value-of select="SYS_ERR_SVRTY/@Value"/></td>
        <td><xsl:value-of select="SYS_LOAD_ID/@Value"/></td>
		<td><xsl:value-of select="SYS_WORKFLOW_ID/@Value"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

