<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:variable name="card-properties">width: 3.5in; margin-left: 0in; max-height: 2in; height: 2in; overflow: hidden; border: thin dotted white; padding: 0.25in</xsl:variable>
  
  <xsl:template match="pages">
    <html>
      <head>
        <style type="text/css">
          
          @page { size: us-letter; margin: 0.3in 0in 0.5in 0.5in }        
          td * {  margin: 0px }</style>
      </head>
      <body style="display: block; font-family: Calibri">
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  
<!-- Doing this in a very XSLT 1.0 way for clarity in this rare circumstance -->

  <xsl:template match="recto | verso">
    <table class="{ local-name() }" style="display: table; page-break-inside:avoid; border-spacing: 0.25in 0in; table-layout: fixed">
      <xsl:apply-templates/>
    </table>
  </xsl:template>
  
  <xsl:template match="row">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

<!-- Big pulls -->

  <xsl:template match="front">
    <td class="front" style="{ $card-properties }">
      <xsl:for-each select="dsp">
        <xsl:variable name="head">
          <xsl:call-template name="headword"/>
        </xsl:variable>
        <xsl:variable name="rest" select="substring-after(.,$head)"/>
        <h3 class="headword" style="font-size: 160%; height: 0.4in; overflow: hidden">
          <xsl:value-of select="translate($head,',','')"/>
        </h3>
        <p class="headword" style="font-size: 120%; height: 0.7in; overflow: hidden">
          <xsl:value-of select="$rest"/><xsl:text> </xsl:text>
        </p>
      </xsl:for-each>
      <table class="footer" style="width: 100%">
        <colgroup>
          <col style="width: 20%; height: 0.25in"/>
          <col style="width: 80%; height: 0.25in; font-style: italic; color: grey; text-align: end"/>
        </colgroup>
        <tr>
          <td class="frq" style="width: 20%; height: 0.25in">
            <xsl:value-of select="frq"/>
            <xsl:text> </xsl:text>
          </td>
          <td class="poS" style="width: 80%; height: 0.25in; font-style: italic; text-align: right;  font-size: 80%">
            <xsl:value-of select="poS"/>
          </td>
        </tr>
      </table>
    </td>
  </xsl:template>
  
  
  
  
  <xsl:template match="back">
    <td class="back" style="{$card-properties}">
      <p class="cat" style="float: right; font-weight: bold; font-size: 80%; display: block; text-align: right">
        <xsl:value-of select="cat"/>
      </p>
      
      <xsl:for-each select="dsp">
        <xsl:variable name="head">
          <xsl:call-template name="headword"/>
        </xsl:variable>
        <xsl:variable name="rest" select="substring-after(.,$head)"/>
        <h3 class="headword" style="font-size: 125%; height: 0.3in; overflow: hidden">
          <xsl:value-of select="translate($head,',','')"/>
        </h3>
        <p class="headword" style="font-size: 100%; height: 0.45in; overflow: hidden">
          <xsl:value-of select="$rest"/><xsl:text> </xsl:text>
        </p>
      </xsl:for-each>
      <xsl:for-each select="def">
        <p class="def" style="font-size: 80%; height: 0.45in; overflow: hidden">
          <xsl:apply-templates/>
        </p>
      </xsl:for-each>
      
      <table class="footer" style="width: 100%">
        <colgroup>
          <col style="width: 20%; height: 0.25in"/>
          <col style="width: 80%; height: 0.25in; text-align: right; font-style: italic"/>
        </colgroup>
        
        <tr>
          <td class="frq" style="width: 20%; height: 0.25in">
          <xsl:value-of select="frq"/>
        </td>
        <td class="poS" style="width: 80%; font-size: 80%; font-style: italic; height: 0.25in; text-align: right">
          <xsl:value-of select="poS"/>
        </td>
        </tr>
      </table>
    </td>
  </xsl:template>
  

  <xsl:template name="headword">
    <xsl:choose>
      <xsl:when test="contains(., ' ')">
        <xsl:value-of select="substring-before(., ' ')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="string(.)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!--<xsl:template match="dsp">
    <p class="dsp" style="font-size: 120%; font-weight: bold; height: 0.75in; overflow: hidden">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="def">
    <p class="def" style="font-size: 80%;
      height: 0.75in; overflow: hidden">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="poS">
    <p class="poS" style="display: inline-block; width: 80%; font-style: italic; height: 0.25in">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="front/poS">
    <p class="poS" style="display: inline-block; width: 80%; color: grey; font-style: italic; float: right; text-align: right; height: 0.25in">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="frq">
    <p class="frq" style="display: inline-block; height: 0.25in">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="back/frq">
    <p class="frq" style="display: inline-block; float: right; text-align: right; height: 0.25in">
      <xsl:apply-templates/>
    </p>
  </xsl:template>-->
  
  
</xsl:stylesheet>