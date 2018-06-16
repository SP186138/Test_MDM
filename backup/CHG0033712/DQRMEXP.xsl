<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <body>
 ***** MESSAGE SENT FROM TERADATA MDM ***********
 <br/>
 <br/>
<strong>Description: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/NOTES/@Value"/>
<br/>
<strong>Rule Run Date: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_RUN_DATE/@Value"/>
<br/>
<strong>Project Number: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/PROJECT_ID/@Value"/>
<br/>
<strong>Project Name:</strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/PROJECT_NAME/@Value"/>
<br/>
<strong>Rule Number: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_NUMBER/@Value"/>
<br/>
<strong>Rule Name : </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_NAME/@Value"/>
<br/>
<strong>Rule Description: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_DESC/@Value"/>
<br/>
<strong>Rule Revision: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/RULE_REVISION/@Value"/>
<br/>
<strong>Summary Query: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/QUERY/@Value"/>
<br/>
<strong>Detail Query: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/DETAIL_QUERY/@Value"/>
<br/>
<strong>Error Message: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/ERRORMSG/@Value"/>
<br/>
<strong>Instructions: </strong> <xsl:value-of select="//XML_DATA/REPORT/SQL_RESULT/BUS_IMPACT_NOTES/@Value"/>
<br/>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>