<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/"> 
    <html>
        <body><center>
            <h2>Midterm-Joyce Wei</h2>
            <table border="1">
                <tr>
                    <th colspan="5">Weekly Food Purchase</th>
                </tr>
                <tr>
                    <th>Item</th>
                    <th>Quanity</th>
                    <th>Price</th>
                </tr>
                <xsl:for-each select="week/weekday">
                    <xsl:variable name="dayName" select="@name"/>
                    <tr>
                        <th colspan="5"><xsl:value-of select="$dayName"/></th>
                    </tr>
                    <xsl:apply-templates select="items/item">
                        <xsl:with-param name="dayName" select="$dayName"/>
                    </xsl:apply-templates>
                </xsl:for-each>
            </table>
            <table border="1">
                <tr>
                    <th colspan="5">No Purchase</th>
                </tr>
                <tr>
                    <td>
                        <ul>
                            <li>Tuesday</li>
                            <li>Thursday</li>
                            <li>Friday</li>
                            <li>Saturday</li>
                        </ul>
                    </td>
                </tr>
            </table>
            <table border="1">
                <tr>
                    <th>Day</th>
                    <th>Eggs Quantity</th>
                    <th>Cheese Quantity</th>
                </tr>
                <xsl:for-each select="week/weekday">
                    <xsl:variable name="dayName" select="@name"/>
                    <tr>
                        <td><xsl:value-of select="$dayName"/></td>
                        <td>
                            <xsl:value-of select="items/item[@name='egg']/@qty"/>
                        </td>
                        <td>
                            <xsl:value-of select="items/item[@name='cheese']/@qty"/>
                        </td>
                    </tr>
                    
                </xsl:for-each>
                <tr>
                        <th>total</th>
                        <xsl:variable name="totalEggs" select="sum(week/weekday/items/item[@name='egg']/@qty)"/>
                        <td><xsl:value-of select="$totalEggs"/></td>
                        <xsl:variable name="totalCheese" select="sum(week/weekday/items/item[@name='cheese']/@qty)"/>
                        <td><xsl:value-of select="$totalCheese"/></td>
                </tr>
            </table>
        </center></body> 
    </html>
</xsl:template>

<xsl:template match="item">
    <xsl:param name="dayName"/>
    <tr>
        <td><xsl:value-of select="@name"/></td>
        <td><xsl:value-of select="@qty"/></td>
        <td><xsl:value-of select="@price"/></td>
    </tr>
</xsl:template>
</xsl:stylesheet>