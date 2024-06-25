<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="numbers">
        <html>
            <body>
                Variables' Valuea<br/>
                X = <xsl:value-of select="numbers/X"/><br/>
                Y = <xsl:value-of select="numbers/Y"/><br/>
                Z = <xsl:value-of select="numbers/Z"/><br/>

                The sum of X + Y =
                <xsl:value-of select="X + Y"/><br/>

                The diffrence of X - Y =
                <xsl:value-of select="X - Y"/><br/>

                The product of X * Y =
                <xsl:value-of select="X * Y"/><br/>

                The quoteint of X / Y =
                <xsl:value-of select="X div Y"/><br/>

                <xsl:call-template name="totalsum"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="totalsum">
        The sum of all numbers X + Y + Z: <xsl:value-of select="X + Y + Z"/>
    </xsl:template>
</xsl:stylesheet>
