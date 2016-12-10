<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Dante's Inferno</title>
            </head>
            <body>
                <h1>Dante's Inferno</h1>
                <h2>Contents</h2>
                <ul>
                    <xsl:apply-templates select="//toc"/>
                </ul>
                <hr/>
                <xsl:apply-templates select="//body"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="toc">
        <xsl:apply-templates select="item"/>
    </xsl:template>

    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="canto">
        <h2>
            <xsl:value-of select="concat('Canto: ', @numeral)"/>
        </h2>
    </xsl:template>
    
    <xsl:template match="stanza">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="lb">
        <xsl:if test="preceding-sibling::lb">
            <br/>
            <xsl:text>&#x0a;</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="punishment_phrase">
        <xsl:if test="preceding-sibling::punishment_phrase">
            <br/>
            <xsl:text>&#x0a;</xsl:text>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>