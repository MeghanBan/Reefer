<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Dante's Inferno Reading View</title>
            </head>
            <body>
                <h1>Dante's Inferno</h1>
                <h2>Contents</h2>
                <ul>
                    <xsl:apply-templates select="//toc"/>
                </ul>
                <hr/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="toc">
        <li>
            <xsl:apply-templates select="item"/>
        </li>
    </xsl:template>
   
    <xsl:template match="canto">
        <h2><xsl:apply-templates select="@numeral"/></h2>
        <xsl:text>Canto: </xsl:text>
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="sb">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="lb">
        <p><xsl:apply-templates/></p>
        <xsl:if test="following-sibling::line">
            <br/>
            <xsl:text>&#x0a;</xsl:text>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>