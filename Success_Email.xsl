<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE SENT FROM TERADATA MDM ***********
 <br/>
 <br/>
<strong>File_Format: </strong> <xsl:value-of select="//XML_DATA/REPORT/FILE_FORMAT/@Value"/>
<br/>
<strong>Migration Task : </strong> <xsl:value-of select="//XML_DATA/REPORT/MIG_TASK/@Value"/>
<br/>
<strong>Description: </strong> <xsl:value-of select="//XML_DATA/REPORT/Description/@Value"/> 
<br/>
<strong>Category:</strong> Data Delivery 
<br/>
<strong>Sub Category: </strong> <xsl:value-of select="//XML_DATA/REPORT/SubCategory/@Value"/> 
<br/>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>