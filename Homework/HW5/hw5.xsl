<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html> 
            <body>
                <table border="1"> 
                    <tr>
                        <th colspan="5">All Fishes</th> 
                    </tr>
                    <tr>
                        <th>Name</th>
                        <th>Box Quantity</th> 
                        <th>Quantity in Box</th> 
                        <th>Unit Price</th>
                        <th>Total Price</th>
                    </tr>
                    <xsl:apply-templates select="fishes/fish"/> 
                    <tr>
                        <td colspan="4" align="right" style="font-weight:bold">Grand Total</td> 
                        <td align="right">
                            <xsl:call-template name="grandtotal">
                                <xsl:with-param name="allfishes" select="fishes/fish"/>
                            </xsl:call-template> 
                        </td>
                    </tr> 
                </table>
            </body> 
        </html>
    </xsl:template>

    <!-- start of fish template --> 
    <xsl:template match="fish">
        <tr>
            <td><xsl:value-of select="@name"/></td>
            <td><xsl:value-of select="box"/></td>
            <td><xsl:value-of select="boxqty"/></td>
            <td align="right"><xsl:value-of select="format-number(unitprice, '$###,###')"/></td> 
            <td align="right"><xsl:value-of select="format-number(box * boxqty * unitprice,'$####,###')"/></td> 
        </tr>
    </xsl:template>
        
    <!-- start of grandtotal template --> 
    <xsl:template name="grandtotal">
        <xsl:param name="allfishes"/>
        <xsl:param name="total" select="0"/>
            <xsl:choose>
                <xsl:when test="$allfishes">
                    <xsl:variable name="priceperbox" select="$allfishes[1]/box * $allfishes[1]/boxqty * $allfishes[1]/unitprice"/>
                    <!-- call the template again to process the other fish --> 
                    <xsl:call-template name="grandtotal">
                        <xsl:with-param name="allfishes" select="$allfishes[position() > 1]"/>
                        <xsl:with-param name="total" select="$total + $priceperbox">
                        </xsl:with-param> 
                    </xsl:call-template>
                </xsl:when> 
                <xsl:otherwise>
                    <xsl:value-of select="format-number($total,'$###,###')"/> 
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
