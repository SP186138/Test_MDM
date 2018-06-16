<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE SENT FROM TERADATA MDM ***********
 <br/>
 <br/>
<strong>PROJECT_ID: </strong> <xsl:value-of select="//XML_DATA/REPORT/PROJECT_ID/@Value"/>
<br/>
<strong>FREQUENCY: </strong> <xsl:value-of select="//XML_DATA/REPORT/Frequency/@Value"/>
<br/>
<strong>PROCESS_ID(LOAD_ID): </strong> <xsl:value-of select="//XML_DATA/REPORT/RULE_ID/@Value"/>
<br/>
<strong>Priority:</strong> <xsl:value-of select="//XML_DATA/REPORT/PRIORITY_TYPE/@Value"/>
<br/>

<strong>ErrorMessage: </strong> <xsl:value-of select="//XML_DATA/REPORT/ErrorMessage/@Value"/> 
<br/>
<strong>Opened by(Requester):</strong>DQRM Administrator
<br/>
<strong>Category:</strong> DQRM 
<br/>
<strong>Subcategory:</strong> DQRM Process Failure 
<br/>
<strong>MigrationTask:</strong> No 
<br/>
<strong>RegionalIdentification:</strong> Global 
<br/>
<strong>Environment:</strong> PROD 
<br/>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>