<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="capital" select="ABCDEFGHIJKLMNOPQRSTUVWXYZ">
<xsl:variable name="lower" select="abcdefghijklmnopqrstuvwxyz">

    <xsl:template match="/">
        <html>

            <head>
            </head>
            <body>
                <h2><center>All Authors and Books</center></h2>
                <table border="1" style="margin: auto;">
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

                <h2><center>John Steinbeck's Books</center></h2>
                <table border="1" style="margin: auto;">
                    <tr bgcolor="#9acd32">
                        <th>Author</th>
                        <th>title</th>
                    </tr>
                    <xsl:for-each select="books/book">
                    <xsl:if test="translate(author,$lowercase,$capital) = 'John Steinbeck'">
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