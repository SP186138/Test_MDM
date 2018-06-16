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
Approval Type: <xsl:value-of select="//XML_DATA/REPORT/ApprovalType/@Value"/>       
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
<br/>TRAIT Detail<br/>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>TRT_NBR</th>
        <th>TRT_NAME</th>
        <th>LEGAL_ENT_NBR</th>
        <th>MKTNG_PGM_NBR</th>            
      </tr>
      <xsl:for-each select="XML_DATA/REPORT">
      <tr>
        <td><xsl:value-of select="TRT_NBR/@Value"/></td>
        <td><xsl:value-of select="TRT_NAME/@Value"/></td>
        <td><xsl:value-of select="LEGAL_ENT_NBR/@Value"/></td>
        <td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>            
      </tr>
      </xsl:for-each>
    </table>
	<br/>
	PREDEFINED TRAIT Detail<br/>
	<table border="1">
      <tr bgcolor="#9acd32">
        <th>TRT_NBR</th>
        <th>TRT_NAME</th>
        <th>PREDFND_TRT_VAL_NBR</th>
        <th>PREDFND_TRT_VAL_NAME</th>  
		<th>PREDFND_TRT_TXT</th> 		
      </tr>
      <xsl:for-each select="XML_DATA/REPORT1/PREDFND_TRT_VAL_IN_DUMMY">
      <tr>
        <td><xsl:value-of select="TRT_NBR/@Value"/></td>
        <td><xsl:value-of select="TRT_NAME/@Value"/></td>
        <td><xsl:value-of select="PREDFND_TRT_VAL_NBR/@Value"/></td>
        <td><xsl:value-of select="PREDFND_TRT_TXT/@Value"/></td>            
		<td><xsl:value-of select="PREDFND_TRT_TXT_LOCAL/@Value"/></td>   
      </tr>
      </xsl:for-each>
    </table>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>