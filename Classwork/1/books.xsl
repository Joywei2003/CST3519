<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="capital" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/> <xsl:variable name="X" select="2"/>

    <xsl:template match="/">
    <html>
        <head>
        </head>
        <body>
            <h2>All Authors and Books</h2>
            <table border="1">
                <tr>
                    <th>Author</th>
                    <th>Title</th>
                </tr>
                <xsl:for-each select="books/book">
                <tr>
                    <td><xsl:value-of select="author"/></td>
                    <td><xsl:value-of select="title"/></td>
                </tr>
                </xsl:for-each>
            </table>
                <hr/>
            <h2>Hemingway Books</h2>
            <table border = "1">
                <tr>
                    <th>Author</th>
                    <th>Title</th> 
                </tr>
                <xsl:for-each select="books/book">
                <xsl:if test="translate(author,$lowercase,$capital)='ERNEST HEMINGWAY'">
                <tr>
                    <td><xsl:value-of select="author"/></td> 
                    <td><xsl:value-of select="title"/></td>
                </tr> 
                </xsl:if>
                </xsl:for-each> 
            
            </table>
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>