<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:strip-space elements="*"/>
    
    <xsl:output indent="yes"/>
  
    <xsl:variable name="deck" as="element()">
        <deck>
          <xsl:apply-templates select="Dickinson-core-list/*"/>
        </deck>
    </xsl:variable>
    
<!-- Sorting the deck into tables for presentation -->
    
    <xsl:template match="/">
      <xsl:processing-instruction name="xml-stylesheet"> type="text/css" href="page-layout-grid.css"</xsl:processing-instruction>
      <xsl:processing-instruction name="xml-stylesheet"> type="text/xsl" href="layout-html.xsl"</xsl:processing-instruction>
      <pages>
        
      <xsl:for-each-group select="$deck/card" group-adjacent="ceiling(position() div 10)">
        <page>
        <recto>
          <xsl:for-each-group select="current-group()" group-by="ceiling(position() div 2)">
            <row>
              <xsl:apply-templates select="current-group()/front" mode="layout"/>
            </row>
          </xsl:for-each-group>
          <xsl:for-each select="1 to floor( (10 - (count(current-group()))) div 2 )">
            <row/>
          </xsl:for-each>
        </recto>
        <verso>
          <xsl:for-each select="1 to floor( (10 - (count(current-group()))) div 2 )">
            <row/>
          </xsl:for-each>
          <xsl:for-each-group select="current-group()" group-by="ceiling(position() div 2)">
            <xsl:sort select="position()" order="descending"/>
            <row>
              <xsl:apply-templates select="current-group()/back" mode="layout">
                <xsl:sort select="position()"/>
              </xsl:apply-templates>
            </row>
          </xsl:for-each-group>
        </verso>
        </page>
      </xsl:for-each-group>
      </pages>
    </xsl:template>

<xsl:mode name="layout" on-no-match="shallow-copy"/>
  
    
  <!-- Producing the deck  -->
    
    <xsl:template match="entry">
       <card n="{frq}">
           <front>
             <xsl:apply-templates mode="layout"/>
           </front>
           <back>
               <xsl:apply-templates mode="layout"/>
           </back>
       </card>
    </xsl:template>
    
    
  
</xsl:stylesheet>