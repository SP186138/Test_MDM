<?xml version="1.0" encoding="ISO-8859-1" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
 <html>
 <head>
   	<style>
   	  body {
   	    font-family:Arial;
   	    font-size:12px;
   	  }
   	  table {
   	  	border-style:outset;
   	  	border-width:0px 1px 4px 4px;
   	  }
   	  td {
   	  	border-style:groove;
		border-width: 1px 1px 0px 0px;
		}
   	</style>
   </head>
 <body>
 <br/>
 <br/>
		<xsl:value-of select="//XML_DATA/REPORT/DocumentAction/@Value"/> request for <xsl:value-of select="//XML_DATA/REPORT/DocumentType/@Value"/> is <xsl:value-of select="//XML_DATA/REPORT/APPROVED_REJECTED/@Value"/> by <xsl:value-of select="//XML_DATA/REPORT/LOGIN_NAME/@Value"/>
<br/>  
Approval Type:<xsl:value-of select="//XML_DATA/REPORT/ApprovalType/@Value"/>    
<br/> 
Comments: <xsl:value-of select="//XML_DATA/REPORT/Comment/@Value"/>    
<br/>  
<br/> 
Approvers Group:
<br/>  
<xsl:value-of select="//XML_DATA/REPORT/approvers/@Value" disable-output-escaping="yes"/> 
<br/> 
Requested By  
<br/> <xsl:value-of select="//XML_DATA/REPORT/creatorDetails/@Value"/> 
<br/>  
Approval ID:  <xsl:value-of select="//XML_DATA/REPORT/DocumentInstance/@Value"/>
<br/>
 <br/>
 
<h2>DATA HERE</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>SUBSCRPTN_OPT_NBR</th>
        <th>LEGAL_ENT_NBR</th>
        <th>MKTNG_PGM_NBR</th>
        <th>DATA_SRCE_NBR</th>
        <th>CR_NUM</th>
        <th>CR_DESC</th>
        <th>ENG_TXT</th>
        <th>LOCAL_TXT</th>
	<th>BRAND_CODE</th>
        <th>COMMENTS</th>     
      </tr>
      <xsl:for-each select="XML_DATA/REPORT">
      <tr>
        <td><xsl:value-of select="SUBSCRPTN_OPT_NBR/@Value"/></td>
        <td><xsl:value-of select="LEGAL_ENT_NBR/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
        <td><xsl:value-of select="DATA_SRCE_NBR/@Value"/></td>
        <td><xsl:value-of select="CR_NUM/@Value"/></td>
        <td><xsl:value-of select="CR_DESC/@Value"/></td>
        <td><xsl:value-of select="ENG_TXT/@Value"/></td>
        <td><xsl:value-of select="LOCAL_TXT/@Value"/></td>
	<td><xsl:value-of select="BRAND_CODE/@Value"/></td>
	<td><xsl:value-of select="COMMENTS/@Value"/></td>        
      </tr>
      </xsl:for-each>
    </table>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>