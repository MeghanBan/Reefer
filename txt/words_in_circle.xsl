<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <results>
            <xsl:apply-templates select="//circle"/>
        </results>
    </xsl:template>
    
    <xsl:template match="circle">
        <xsl:variable name="words" select="tokenize(., '\s+')"/>
        <circle number="{@number}">
            <count>
                <xsl:value-of select="count($words)"/>
            </count>
        </circle>
    </xsl:template>
    
    <!--<xsl:template match="punishment_phrase">
        <xsl:variable name="torture_words" select="tokenize(., 'torture_word')"/>
        <punishment_phrase>
            <count>
                <xsl:value-of select="count($torture_words)"/>
            </count>
        </punishment_phrase>
    </xsl:template>-->
    
</xsl:stylesheet>
