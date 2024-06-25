<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="capital" select="ABCDEFGHIJKLMNOPQRSTUVWXYZ">
<xsl:variable name="lower" select="abcdefghijklmnopqrstuvwxyz">
<!--from homework 1-->

    <xsl:template match="/">
        <html>
            <head>
            </head>
            <body>
                <h2><center>All Authors and Books</center></h2>
                Number of Books: <xsl:value-of select="count(books/book)"/>
                <table border="1" style="margin: auto;">
                    <tr>
                        <th>Author</th>
                        <th>Title</th>
                    </tr>
                    <xsl:apply-templates select="books/book">
                </table>
                <hr/>
                <h2><center>John Steinbeck's Books</center></h2>
                <table border="1" style="margin: auto;">
                    <tr>
                        <th>Author</th>
                        <th>title</th>
                    </tr>
                    <xsl:apply-templates select="books/book[translate(author, $lower,$capital) = 'John Steinbeck']"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- start of book template -->
    <xsl:template match="book">
        <tr>
            <td><xsl:value-of select="position()"/>. <xsl:value-of select="author"/></td> 
            <td><xsl:value-of select="title"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>