<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE BEING SENT FROM TERADATA MDM ***********
 <br/>
 <br/>
<strong>Following load_id failed :</strong> 
<xsl:value-of select="//XML_DATA/REPORT/Id/@Value"/>
<br/>
<strong>Type of Request:</strong> – Incident
<br/>
<strong>Urgency:</strong> Medium
<br/>
<strong>Priority:</strong> 4
<br/>
<strong>Impact:</strong> Medium
<br/>
<strong>Category:</strong> Profile Editor
<br/>
<strong>Subcategory :</strong>
<xsl:value-of select="//XML_DATA/REPORT/Error/@Value"/>
<br/>
<strong>Contact Phone #:</strong>
<xsl:value-of select="//XML_DATA/REPORT/Phone/@Value"/>
<br/>
<strong>Description:</strong> 
<xsl:value-of select="//XML_DATA/REPORT/Description/@Value"/> - <xsl:value-of select="//XML_DATA/REPORT/ErrorMessage/@Value"/>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>