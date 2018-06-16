<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
        <head>
</head>
            <body>
                <h1>Matched Records from Not Found Opt List</h1>
                <table border="1">
                    <tr>
                        <th>Profile Editor Optout Id</th>
                        <th>First Name Opt</th>
                        <th>Last Name Opt</th>
                        <th>Email Address Opt</th>
                        <th>Postal Address Opt</th>
                        <th>Marketing Program Number</th>
                        <th>Registration Persona Id</th>
                        <th>First Name Registration</th>
                        <th>Last Name Registration</th>
                    </tr>
		 <xsl:for-each select="ROOT/LINES/SQL_RESULT">
                    <tr>
                        <td><xsl:value-of select="PE_OPTOUT_ID/@Value"/></td>
                        <td><xsl:value-of select="GVN_NAME_OPT/@Value"/></td>
                        <td><xsl:value-of select="FAMLY_NAME_OPT/@Value"/></td>
                        <td><xsl:value-of select="EMAIL_ADDR_TXT_OPT/@Value"/></td>
                        <td><xsl:value-of select="ADDRESS_OPT/@Value"/></td>
                        <td><xsl:value-of select="MKTNG_PGM_NBR/@Value"/></td>
                        <td><xsl:value-of select="REGIS_PRSNA_ID/@Value"/></td>
                        <td><xsl:value-of select="GVN_NAME_REG/@Value"/></td>   
                        <td><xsl:value-of select="FAMLY_NAME_REG/@Value"/></td>   
                    </tr>
                 </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 