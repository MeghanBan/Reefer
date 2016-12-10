<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:strip-space elements="*"/>
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
            <a href="#canto{@numeral}">
                <xsl:apply-templates/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="canto">
        <h2 id="canto{@numeral}">
            <xsl:value-of select="concat('Canto: ', @numeral)"/>
        </h2>
    </xsl:template>

    <xsl:template match="stanza">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="lb">
        <xsl:if test="(ancestor::stanza//lb)[1] &lt;&lt; current()">
            <br/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="punishment_phrase">
        <span class="punishment_phrase">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
