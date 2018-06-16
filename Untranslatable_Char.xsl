<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
<strong>Priority:</strong> P4-Low
<br/>
<strong>Impact:</strong> Medium
<br/>
<strong>Category:</strong> MDM
<br/>
<strong>Subcategory : </strong> <xsl:value-of select="//XML_DATA/REPORT/Error/@Value"/>
<br/>
<strong>Description: </strong> <xsl:value-of select="//XML_DATA/REPORT/ErrorMessage/@Value"/>  
<br/>
<br/>
<xsl:value-of select="//XML_DATA/REPORT/Desc/@Value"/>
<br/>
<br/>
 <h2>LOAD DETAILS</h2>
    <table border="1">
      <tr bgcolor="#9acd32">        
        <th>SOURCE_ID</th>
	<th>LOAD_ID</th>        
        <th>MKTNG_PGM_NBR</th>
        <th>REGIS_CNSMR_ID_VAL</th>
        <th>CNTRY_NAME</th> 
        <th>ERROR_FIELD</th>       
      </tr>
      <xsl:for-each select="XML_DATA/REPORT/SQL_RESULT">
      <tr>
        <td><xsl:value-of select="SYS_TARGET_ID/@Value"/></td>
	<td><xsl:value-of select="LOAD_ID/@Value"/></td>       
        <td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="REGIS_CNSMR_ID_VAL/@Value"/></td>
        <td><xsl:value-of select="//XML_DATA/REPORT/CNTRY_NAME/@Value"/></td>   
        <td><xsl:value-of select="ErrorField/@Value"/></td>    
      </tr>
      </xsl:for-each>
    </table>
<br/>
<br/>
<strong>Notification Condition: </strong> <xsl:value-of select="//XML_DATA/REPORT/Notification/@Value"/> 
</body>
</html>
</xsl:template>
</xsl:stylesheet>