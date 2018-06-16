<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE SENT FROM TERADATA MDM ***********
 <br/>
 <br/>
<strong>Country: </strong> <xsl:value-of select="//XML_DATA/REPORT/CNTRY_CODE/@Value"/>
<br/>
<strong>Agency: </strong> <xsl:value-of select="//XML_DATA/REPORT/SOURCE_ID/@Value"/>
<br/>
<strong>MP: </strong> <xsl:value-of select="//XML_DATA/REPORT/MKTNG_PGM_NBR/@Value"/>
<br/>
<strong>Priority:</strong> <xsl:value-of select="//XML_DATA/REPORT/PRIORITY_TYPE/@Value"/>
<br/>
<strong>File_Format: </strong> <xsl:value-of select="//XML_DATA/REPORT/FILE_FORMAT/@Value"/>
<br/>
<strong>Migration Task : </strong> <xsl:value-of select="//XML_DATA/REPORT/MIG_TASK/@Value"/>
<br/>
<strong>Short Description: </strong> <xsl:value-of select="//XML_DATA/REPORT/PROCESS_NAME/@Value"/> - <xsl:value-of select="//XML_DATA/REPORT/Short_Description/@Value"/> - <xsl:value-of select="//XML_DATA/REPORT/ErrorMessage/@Value"/>
<br/>
<strong>Description: </strong> <xsl:value-of select="//XML_DATA/REPORT/Description/@Value"/> 
<br/>
<strong>Opened By(Requestor):</strong> MDM Administrator
<br/>
<strong>Category:</strong> Data Delivery 
<br/>
<strong>Sub Category: </strong> <xsl:value-of select="//XML_DATA/REPORT/SubCategory/@Value"/> 
<br/>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>