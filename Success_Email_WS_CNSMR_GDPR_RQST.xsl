<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE SENT FROM TERADATA MDM ***********
 <br/>
 <br/>
<strong>New GDPR Case ID has been received in 1CP with details as below: </strong>
 <br/>
GDPR CASE ID:  <xsl:value-of select="//XML_DATA/REPORT/Description/GDPR_CASE_ID/@Value"/> 
 <br/>
CASE STATUS:  <xsl:value-of select="//XML_DATA/REPORT/Description/CASE_STATUS/@Value"/> 
 <br/>
COUNTRY:  <xsl:value-of select="//XML_DATA/REPORT/Description/COUNTRY/@Value"/> 
 <br/>
RIGHTS TYPE:  <xsl:value-of select="//XML_DATA/REPORT/Description/RIGHTS_TYPE/@Value"/> 
 <br/>
CASE CREATION DATE:  <xsl:value-of select="//XML_DATA/REPORT/Description/CASE_CREATION_DATE/@Value"/> 
 <br/>
CASE IDENTITY VERIFICATION DATE:  <xsl:value-of select="//XML_DATA/REPORT/Description/CASE_IDENTITY_VERIFICATION_DATE/@Value"/> 
<br/>
<br/>
<br/>
<strong>Please use the given URL to review the GDPR Case ID created :- </strong>  <xsl:value-of select="//XML_DATA/REPORT/URL/@Value"/> 

<br/>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
