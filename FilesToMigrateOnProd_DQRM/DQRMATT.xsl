<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE SENT FROM TERADATA MDM ***********
			

<h2>DATA HERE</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_1/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_2/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_3/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_4/@Value"/></th> 
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_5/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_6/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_7/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_8/@Value"/></th> 
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_9/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_10/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_11/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_12/@Value"/></th> 
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_13/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_14/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_15/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_16/@Value"/></th> 
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_17/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_18/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_19/@Value"/></th>
		<th><xsl:value-of select="//XML_DATA/REPORT1/SQL_RESULT/COLUMN_HEADING_20/@Value"/></th> 
      </tr>
      <xsl:for-each select="//XML_DATA/REPORT1/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="COLUMN_VALUE_1/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_2/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_3/@Value"/></td>
		<td><xsl:value-of select="COLUMN_VALUE_4/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_5/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_6/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_7/@Value"/></td>
		<td><xsl:value-of select="COLUMN_VALUE_8/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_9/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_10/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_11/@Value"/></td>
		<td><xsl:value-of select="COLUMN_VALUE_12/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_13/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_14/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_15/@Value"/></td>
		<td><xsl:value-of select="COLUMN_VALUE_16/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_17/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_18/@Value"/></td>
        <td><xsl:value-of select="COLUMN_VALUE_19/@Value"/></td>
		<td><xsl:value-of select="COLUMN_VALUE_20/@Value"/></td>
      </tr>
      </xsl:for-each>
    </table>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>