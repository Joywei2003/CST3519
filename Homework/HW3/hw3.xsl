<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- start of root template --> 
    <xsl:template match="/">
    <html> 
        <head>
        </head> 
        <body><center>
            <h2>Top 10 programming languages</h2>
            <table border="1">
                <tr>
                    <th>Rank</th>
                    <th>Icon</th>
                    <th>Language</th>
                    <th>Index</th>
                </tr>
                
                <xsl:for-each select="root/row">
                    <xsl:sort select="rank" data-type="number" order="ascending"/>
                    <xsl:apply-templates select="root/row"/>
                    <tr>
                        <td><xsl:value-of select="rank"/></td> 
                        <td><img src="{icon}" style="width:40; height:30;"/></td> 
                        <td><xsl:value-of select="language"/></td> 
                        <td><xsl:value-of select="index"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            
            <h2>Top 5 programming languages</h2>
            <table border="1">
                <tr>
                    <th>Rank</th>
                    <th>Icon</th>
                    <th>Language</th>
                    <th>Index</th>
                </tr> 
                <xsl:apply-templates select="root/row[position() &lt; 6]">
                    <xsl:sort select="rank" data-type="number" order="ascending"/>
                </xsl:apply-templates>
                
                <xsl:for-each select="root/row">
                    <xsl:sort select="rank" data-type="number" order="ascending"/>
                    <xsl:if test="position() &lt; 6">
                    <tr>
                        <td><xsl:value-of select="rank"/></td> 
                        <td><img src="{icon}" style="width:40; height:30;"/></td> 
                        <td><xsl:value-of select="language"/></td> 
                        <td><xsl:value-of select="index"/></td>
                    </tr>
                        
                    </xsl:if>
                </xsl:for-each>
            </table>
        </center></body>
    </html>
    </xsl:template>

    <xsl:template match="row">
        <tr>
            <td><xsl:value-of select="rank"/></td> 
            <td><img src="{icon}" style="width:40; height:30;"/></td> 
            <td><xsl:value-of select="language"/></td> 
            <td><xsl:value-of select="index"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>