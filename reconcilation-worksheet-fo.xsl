<?xml version="1.0" encoding="utf-8"?>

<!-- ============================================================= -->
<!-- XSL-FO for accounts worksheets
     ============================================================= -->

<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simple" page-height="11in"
          page-width="8.5in"
          margin-top="0.5in" margin-bottom="0.5in"
          margin-left="0.5in" margin-right="0.5in">
          <fo:region-body region-name="content" margin-top="1in"
            margin-bottom="0.5in"/>
          <fo:region-before region-name="header" extent="1in"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <xsl:apply-templates/>
    </fo:root>
  </xsl:template>

  <xsl:template match="/*">
    <fo:page-sequence master-reference="simple">
      <fo:static-content flow-name="header">
        <fo:block text-align="right" font-size="9pt">
          <!--<xsl:apply-templates select="author | date"/>-->
          <fo:block>
            <xsl:text>page </xsl:text>
            <fo:page-number/>
          </fo:block>
        </fo:block>
      </fo:static-content>
      <fo:static-content flow-name="xsl-footnote-separator">
        <fo:block end-indent="4in" margin-top="12pt" margin-bottom="8pt"
          border-width="0.5pt" border-bottom-style="solid"/>
      </fo:static-content>
      <fo:flow flow-name="content">
        <fo:block space-before="20pt" font-family="serif" font-size="11pt"
          line-height="13pt" line-height-shift-adjustment="disregard-shifts">
          <xsl:call-template name="header"/>
          <xsl:call-template name="worksheet"/>
          <xsl:call-template name="summary"/>
        </fo:block>
      </fo:flow>
      
    </fo:page-sequence>

  </xsl:template>
  
  <xsl:template name="header">
    <fo:block margin-left="0.5in">
      <fo:block>Account Reconciliation Worksheet</fo:block>
      <xsl:apply-templates/>
      <fo:block space-before="6pt">
        <xsl:text>Starting balance: </xsl:text>
        <fo:inline font-family="monospace">
          <xsl:value-of select="/*/starting"/>
        </fo:inline>
      </fo:block>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="name">
    <fo:block font-size="120%" font-weight="bold">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="number | date">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="statement | starting"/>
  
  <xsl:template name="worksheet">
    <xsl:for-each select="/*/statement">
    <fo:table space-before="0.5in" font-size="10pt"><!-- 7.5in wide -->
      <fo:table-column column-number="1" column-width="0.5in"/>
      <fo:table-column column-number="2" column-width="1.5in"/>
      <fo:table-column column-number="3" column-width="1.0in"/>
      <fo:table-column column-number="4" column-width="2.5in"/>
      <fo:table-column column-number="5" column-width="1.0in"/>
      <fo:table-column column-number="6" column-width="1.0in"/>
      <fo:table-body>
        <xsl:apply-templates select="entry" mode="table">
          <!-- sorting by date year string first, then date string -->
          <xsl:sort select="date/replace(.,'.+/','')" order="ascending"/>
          <xsl:sort select="date" order="ascending"/>
        </xsl:apply-templates>
      </fo:table-body>
    </fo:table>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="entry" mode="table">
    <fo:table-row>
      <xsl:if test="exists(split)"><!-- Empty cells when there's a split -->
        <fo:table-cell xsl:use-attribute-sets="cell"
          padding-right="3pt" text-align="end">
          <fo:block/>
        </fo:table-cell>
        <fo:table-cell xsl:use-attribute-sets="cell"
          padding-left="0pt">
          <xsl:call-template name="account-col"/>
          <fo:block>[split]</fo:block>
        </fo:table-cell>
      </xsl:if>
      <xsl:apply-templates select="account, date, party, charge" mode="table"/>
    </fo:table-row>
    <xsl:for-each select="split/entry">
      <fo:table-row>
        <xsl:apply-templates select="account" mode="table"/>
        <!-- We need a cell even when 'remarks' is missing -->
        <fo:table-cell xsl:use-attribute-sets="cell" border-top="none">
          <xsl:apply-templates select="remarks" mode="col"/>
          <fo:block>
            <xsl:apply-templates select="remarks" mode="cell-contents"/>
          </fo:block>
        </fo:table-cell>
        <xsl:apply-templates select="charge" mode="table"/>
        
      </fo:table-row>
    </xsl:for-each>
  </xsl:template>
  
  
  <xsl:template match="date | charge" mode="table">
    <fo:table-cell xsl:use-attribute-sets="cell">
      <xsl:apply-templates select="." mode="col"/>
      <xsl:if test="../parent::split">
        <xsl:attribute name="border-top">none</xsl:attribute>
      </xsl:if>
      <fo:block>
        <xsl:apply-templates/>
      </fo:block>
    </fo:table-cell>
  </xsl:template>
  
  <xsl:template match="account" mode="table">
    <fo:table-cell xsl:use-attribute-sets="cell"
      padding-right="3pt" text-align="end">
      <xsl:apply-templates select="." mode="col"/>
      <xsl:if test="../parent::split">
        <xsl:attribute name="border-top">none</xsl:attribute>
      </xsl:if>
      <fo:block>
        <xsl:value-of select="replace(normalize-space(.),'^(\d+)\s*(.*)$','$1')"/>
      </fo:block>
    </fo:table-cell>
    <fo:table-cell xsl:use-attribute-sets="cell"
      padding-left="0pt">
      <xsl:if test="../parent::split">
        <xsl:attribute name="number-columns-spanned">2</xsl:attribute>
        <xsl:attribute name="border-top">none</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="." mode="col"/>
      <fo:block>
        <xsl:value-of select="replace(normalize-space(.),'^(\d+)\s*(.*)$','$2')"/>
      </fo:block>
    </fo:table-cell>
  </xsl:template>
  
  <xsl:template match="party" mode="table">
    <fo:table-cell xsl:use-attribute-sets="cell" number-columns-spanned="2">
      <xsl:apply-templates select="." mode="col"/>
      <fo:block>
        <xsl:apply-templates/>
      </fo:block>
      <xsl:apply-templates select="../remarks" mode="cell-contents"/>
    </fo:table-cell>
  </xsl:template>
  
  <xsl:template match="remarks" mode="table">
    <fo:table-cell xsl:use-attribute-sets="cell">
      <xsl:apply-templates select="." mode="col"/>
      <fo:block><!-- Possibly redundant but required for validity. -->
        <xsl:apply-templates select="." mode="cell-contents"/>
      </fo:block>
    </fo:table-cell>
  </xsl:template>
  
  <xsl:template match="remarks" mode="cell-contents">
      <fo:block font-size="80%" font-family="serif">
        <xsl:apply-templates/>
      </fo:block>
  </xsl:template>
  
  <xsl:attribute-set name="cell">
    <xsl:attribute name="border-top">thin solid black</xsl:attribute>
    <xsl:attribute name="padding-top">2pt</xsl:attribute>
    <xsl:attribute name="padding-left">5pt</xsl:attribute>
    <xsl:attribute name="padding-right">5pt</xsl:attribute>
    <xsl:attribute name="font-family">monospace</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:template match="account" mode="col" name="account-col">
    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
    <xsl:attribute name="font-size">75%</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="date | party | remarks" mode="col"/>
  
  <xsl:template match="charge" mode="col">
    <xsl:attribute name="text-align">end</xsl:attribute>
    <xsl:attribute name="padding-right">0pt</xsl:attribute>
  </xsl:template>
  
  <xsl:template name="summary">
    <xsl:for-each select="/*">
      <fo:table margin-left="0.5in" space-before="0.5in" font-size="12pt" text-align="end" keep-together="always">
        <!-- 3in wide -->
        <fo:table-column column-number="1" column-width="2.5in"/>
        <fo:table-column column-number="2" column-width="1in"/>
        <fo:table-body>
          <fo:table-row>
            <fo:table-cell>
              <fo:block>Beginning Balance</fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block font-family="monospace">
                <xsl:value-of select="format-number(/*/starting,'0.00')"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
          <fo:table-row>
            <fo:table-cell>
              <fo:block>Total Expenses</fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block font-family="monospace">
                <xsl:value-of select="format-number(sum(/*/statement/entry/charge[number(.) lt 0]),'0.00')"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
          <fo:table-row>
            <fo:table-cell>
              <fo:block>Payment</fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block font-family="monospace">
                <xsl:value-of select="format-number(sum(/*/statement/entry/charge[number(.) gt 0]),'0.00')"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
          <fo:table-row>
            <fo:table-cell>
              <fo:block>Ending Balance</fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block font-family="monospace">
                <xsl:value-of select="format-number(sum(/*/statement/entry/charge) + number(/*/starting),'0.00')"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </xsl:for-each>
  </xsl:template>
  
  
</xsl:stylesheet>
