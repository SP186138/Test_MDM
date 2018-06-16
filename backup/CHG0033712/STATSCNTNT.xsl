<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>ERROR DETAILS</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>CNTNT_ELEM_ID</th>
        <th>CNTNT_ELEM_ITEM_NBR</th>
        <th>CNTNT_ELEM_ITEM_NAME</th>
        <th>CNTNT_ELEM_ITEM_QTY</th>
        <th>CATEG_CODE</th>
        <th>SEG_CODE</th>
        <th>BRAND_CODE</th>
        <th>SUB_BRAND_CODE</th>
	<th>ITEM_VERS_CODE</th>
        <th>GLOBAL_FORM_CODE</th>
        <th>PROD_ITEM_UPC</th>
        <th>SYS_ERROR_ID</th>
        <th>SYS_ERR_CODE</th>
        <th>SYS_ERR_SVRTY</th>
        <th>SYS_LOAD_ID</th>
      </tr>
      <xsl:for-each select="XML_DATA/REPORT/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="CNTNT_ELEM_ID/@Value"/></td>
        <td><xsl:value-of select="CNTNT_ELEM_ITEM_NBR/@Value"/></td>
        <td><xsl:value-of select="CNTNT_ELEM_ITEM_NAME/@Value"/></td>
        <td><xsl:value-of select="CNTNT_ELEM_ITEM_QTY/@Value"/></td>
        <td><xsl:value-of select="CATEG_CODE/@Value"/></td>
        <td><xsl:value-of select="SEG_CODE/@Value"/></td>
        <td><xsl:value-of select="BRAND_CODE/@Value"/></td>
        <td><xsl:value-of select="SUB_BRAND_CODE/@Value"/></td>
	<td><xsl:value-of select="ITEM_VERS_CODE/@Value"/></td>
	<td><xsl:value-of select="GLOBAL_FORM_CODE/@Value"/></td>
        <td><xsl:value-of select="PROD_ITEM_UPC/@Value"/></td>
        <td><xsl:value-of select="SYS_ERROR_ID/@Value"/></td>
        <td><xsl:value-of select="SYS_ERR_CODE/@Value"/></td>
        <td><xsl:value-of select="SYS_ERR_SVRTY/@Value"/></td>
        <td><xsl:value-of select="SYS_LOAD_ID/@Value"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

