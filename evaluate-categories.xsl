<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
  
  <xsl:output indent="yes"/>
  
  <xsl:template match="/">
    <categories>
      <xsl:for-each-group select="*/entry" group-by="normalize-space(cat)">
        <xsl:sort select="count(current-group())" order="descending"/>
        <category count="{count(current-group())}">
          <xsl:value-of select="current-grouping-key()"/>
        </category>
      </xsl:for-each-group>
    </categories>
  </xsl:template>
    
</xsl:stylesheet>