<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/> 
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
    
    <!-- start of root template --> 
    <xsl:template match="/">
    <html> 
        <head>
    
        </head> 
        <body><center>
            <h2>Cars</h2>
            <table border="1">
                <tr>
                    <th>Make</th> 
                    <th>Model</th>
                    <th>Year</th> 
                    <th>Picture</th>  
                </tr>
            <xsl:apply-templates select="cars/car"/> 
            </table>
            <h2>Cars before 2022</h2>
            <table border="1">
                <tr>
                    <th>Make</th> 
                    <th>Model</th>
                    <th>Year</th> 
                    <th>Picture</th>  
                </tr>
            <xsl:apply-templates select="cars/car[year &lt; 2022]"/> 
            </table>
            <h2>Mustang Cars</h2>
            <table border="1">
                <tr>
                    <th>Make</th> 
                    <th>Model</th>
                    <th>Year</th> 
                    <th>Picture</th>  
                </tr>
            <xsl:apply-templates select="cars/car[contains(translate(model,$lowercase,$uppercase),'MUSTANG')]"/>
            </table>
        </center></body>
    </html>

</xsl:template>

    <xsl:template match="car">
        <tr>
        <td><xsl:value-of select="make"/></td> 
        <td><xsl:value-of select="model"/></td>
        <td><xsl:value-of select="year"/></td> 
        <td><img src="{picture}" style="width:400; height:300;"/></td> 
        </tr>
    </xsl:template>

</xsl:stylesheet>
