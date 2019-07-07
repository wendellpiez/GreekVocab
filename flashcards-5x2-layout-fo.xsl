<?xml version="1.0" encoding="utf-8"?>

<!-- ============================================================= -->
<!-- XSL-FO for accounts worksheets
     ============================================================= -->


<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>
  
  
  <xsl:attribute-set name="trace">
    <!--<xsl:attribute name="border">thin solid blue</xsl:attribute>-->
  </xsl:attribute-set>
    
  <xsl:attribute-set name="cell">
    <xsl:attribute name="padding">6pt</xsl:attribute>
    <xsl:attribute name="font-family">Calibri</xsl:attribute>
    <xsl:attribute name="width">3.5in</xsl:attribute>
    <xsl:attribute name="height">130pt</xsl:attribute>
    <xsl:attribute name="border-width">2pt</xsl:attribute>
    <xsl:attribute name="border-color">white</xsl:attribute>
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="overflow">hidden</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simple" page-height="11in"
          page-width="8.5in"
          margin-top="0.5in" margin-bottom="0.5in"
          margin-left="0.75in" margin-right="0.75in">
          <fo:region-body region-name="content" margin-top="0in"
            margin-bottom="0in"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <xsl:apply-templates/>
    </fo:root>
  </xsl:template>

  <xsl:template match="/*">
    <fo:page-sequence master-reference="simple">
      <fo:flow flow-name="content">
          <xsl:apply-templates/>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>
  
  <xsl:template match="recto | verso">
    <fo:table font-size="10pt" width="7in" keep-together.within-page="10"><!-- 7.5in wide -->    
      <fo:table-column column-number="1" column-width="3.5in"/>
      <fo:table-column column-number="2" column-width="3.5in"/>
      <fo:table-body>
          <xsl:apply-templates/>
      </fo:table-body>
    </fo:table>
  </xsl:template>
  
  <xsl:template match="row">
    <fo:table-row>
      <xsl:apply-templates/>
      <xsl:if test="empty(*)">
        <fo:table-cell xsl:use-attribute-sets="cell">
          <xsl:call-template name="credit-block"/>
        </fo:table-cell>        
        <fo:table-cell  xsl:use-attribute-sets="cell">
          <xsl:call-template name="credit-block"/>
        </fo:table-cell>        
      </xsl:if>
    </fo:table-row>
  </xsl:template>

  <xsl:template name="credit-block">
    <fo:block-container  display-align="center" text-align="center">
    <fo:block font-size="90%" font-weight="bold">Dickinson College Core Ancient Greek Vocabulary Set</fo:block>
    <fo:block>http://dcc.dickinson.edu/greek-core-list</fo:block>
    <fo:block>524 of the commonest words in Ancient Greek</fo:block>
    <fo:block>Borrowed with thanks in the spirit of share-alike</fo:block>
    <fo:block margin-top="6pt">Set onto 3½" &#xD7; 2" cards via XML, XSLT and XSL-FO</fo:block>
      <fo:block>http://github.com/wendellpiez/GreekVocab</fo:block>
      <fo:block text-align="center" margin-top="6pt" font-size="80%">When printing on both sides of (8½" &#xD7; 11") perforated card stock sheets: flip vertically, on the <fo:inline font-style="italic">short</fo:inline> edge</fo:block>
    </fo:block-container>
  </xsl:template>
  
<xsl:template match="front"><!-- 130pt total -->
  <fo:table-cell xsl:use-attribute-sets="cell">
    <xsl:for-each select="dsp">
      <xsl:variable name="head">
        <xsl:call-template name="headword"/>
      </xsl:variable>
      <xsl:variable name="rest" select="substring-after(.,$head)"/>
      <fo:block-container height="42pt" overflow="hidden" xsl:use-attribute-sets="trace">
        <fo:block font-size="24pt">
        <xsl:value-of select="translate($head,',','')"/>
      </fo:block></fo:block-container>
      <fo:block-container height="60pt" overflow="hidden" xsl:use-attribute-sets="trace">
        <fo:block font-size="16pt" line-height="20pt">
        <xsl:value-of select="$rest"/><xsl:text> </xsl:text>
      </fo:block>
      </fo:block-container>
    </xsl:for-each>
    <xsl:call-template name="footer-line"/>
    </fo:table-cell>
</xsl:template>
  
  <xsl:template name="footer-line">
    <fo:block-container height="20pt" display-align="after" xsl:use-attribute-sets="trace">
      <fo:table width="100%" font-size="11pt">
        <fo:table-column column-number="1" column-width="20%"/>
        <fo:table-column column-number="2" column-width="80%"/>
        <fo:table-body>
          <fo:table-row>
            <fo:table-cell>
              <fo:block font-weight="bold">
                <xsl:value-of select="frq"/>
                <xsl:text> </xsl:text>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block text-align="end" font-style="italic">
                <xsl:value-of select="poS"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>

    </fo:block-container>
  </xsl:template>
  
  <xsl:template match="back">
    <fo:table-cell xsl:use-attribute-sets="cell">
      <xsl:variable name="whose" select="."/>
      <xsl:for-each select="dsp">
        <xsl:variable name="head">
          <xsl:call-template name="headword"/>
        </xsl:variable>
        <xsl:variable name="rest" select="substring-after(.,$head)"/>
        <fo:block-container height="24pt" overflow="hidden" xsl:use-attribute-sets="trace">
          <fo:block font-size="20pt" keep-together.within-line="24" text-align-last="justify">
            <xsl:value-of select="translate($head,',','')"/>
            <fo:leader leader-pattern="space"/>
            <fo:inline font-size="10pt" vertical-align="text-top">
              <xsl:value-of select="$whose/cat"/>
            </fo:inline>
          </fo:block></fo:block-container>
        <fo:block-container height="34pt" overflow="hidden" xsl:use-attribute-sets="trace">
          <fo:block font-size="13pt" line-height="16pt">
            <xsl:value-of select="$rest"/><xsl:text> </xsl:text>
          </fo:block></fo:block-container>
      </xsl:for-each>
      <xsl:for-each select="def">
        <fo:block-container height="42pt" overflow="hidden" xsl:use-attribute-sets="trace">
          <fo:block font-size="10pt" line-height="14pt">
            <xsl:apply-templates/>
          </fo:block></fo:block-container>
      </xsl:for-each>
      <xsl:call-template name="footer-line"/>
    </fo:table-cell>
  </xsl:template>
  
  
  <!--<xsl:template match="front/* | back/*">
      <fo:block>
        <xsl:apply-templates/>
      </fo:block>
  </xsl:template>-->
  
  
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
  
  
  
</xsl:stylesheet>
