<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/"> 
    <html>
        <body>
            <table border="1">
                <tr>
                    <th colspan="5">Weekly Payroll</th>
                </tr> 
                <tr>
                    <th>Name</th> 
                    <th>ID</th>
                    <th>Hours Worked</th> 
                    <th>Hourly Rate</th> 
                    <th>Salary</th>
                </tr>
                <xsl:apply-templates select="employees/employee"/> 
            </table>
        </body>
        </html>
    </xsl:template> 

    <xsl:template match="employee"> <tr>
        <td><xsl:value-of select="name"/></td> <td><xsl:value-of select="id"/></td> <td><xsl:value-of select="hoursworked"/></td> <td><xsl:value-of select="hourlyrate"/></td> <td>
        <xsl:if test="hoursworked > 40">
        <xsl:value-of select="format-number(hourlyrate * 40 + 1.5*hourlyrate*(hoursworked -
        40),'$###,###')"/> </xsl:if>
        <xsl:if test="hoursworked &lt;= 40">
        <xsl:value-of select="format-number(hourlyrate * hoursworked, '$###,###')"/>
        </xsl:if> </td>
        </tr> </xsl:template>
        </xsl:stylesheet>
22