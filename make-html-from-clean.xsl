<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="Dickinson-core-list">
        <html>
            <head>
                <style type="text/css">
                    
.front, .back        {  display: block; border: thin solid black;
                    padding-top: 1in; padding-bottom: 0in; padding-right: 0.25in; padding-left: 0.25in;
                    margin-top: 1em; page-break-inside:avoid; height: 3in; width: 5in }
.headword           {  display: block; font-family: 'DejaVu Serif'; font-weight: bold;
font-size: 140% }
.def                {  display: block; font-size: 120%; margin-top: 0.5in }
.poS                {  display: block; font-style: italic; margin-top: 0.5in }
.front .poS         {  float: right; padding-right: 0.25in; color: grey }
.cat                {  display: inline-block; font-weight: bold; font-size: 90%; font-family: 'DejaVu Sans' }
.frq                {  display: inline-block; float: right; padding-right: 0.25in }
                </style>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="entry">
       <section class="entry">
           <div class="front">
               <xsl:apply-templates mode="front"/>
           </div>
           <div class="back">
               <xsl:apply-templates mode="back"/>
           </div>
       </section>
    </xsl:template>
    
    <xsl:template match="poS" mode="front">
        <p class="{ local-name() }">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="*" mode="front"/>
    
    <xsl:template match="dsp" mode="front">
        <h3 class="headword">
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    <xsl:template match="dsp" mode="back"/>
    
    <xsl:template match="*" mode="back">
        <p class="{ local-name() }">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>