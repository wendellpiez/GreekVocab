<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns:classical="http://wendellpiez.com/ns/classical"
    version="3.0">
    

<xsl:function name="classical:gimme-td">
    <xsl:param name="tr" as="element(tr)"/>
    <xsl:param name="class" as="xs:string"/>
    <xsl:sequence select="$tr/td[contains-token(@class,$class)]"/>
</xsl:function>
    
    
    <xsl:template match="/">
       <list>
           <xsl:apply-templates select="/*/table/tbody/tr"/>
       </list>
    </xsl:template>
    
    <xsl:template match="tr">
        <item>
            <xsl:apply-templates select="classical:gimme-td(.,'views-field-title')"/>
            <xsl:apply-templates select="classical:gimme-td(.,'views-field-field-greek-definition')"/>
            <xsl:apply-templates select="classical:gimme-td(.,'views-field-field-greek-part-of-speech')"/>
            <xsl:apply-templates select="classical:gimme-td(.,'views-field-field-greek-semantic-group')"/>
            <xsl:apply-templates select="classical:gimme-td(.,'views-field-title')"/>
            <xsl:apply-templates select="classical:gimme-td(.,'views-field-field-greek-frequency-rank')"/>
        </item>
    </xsl:template>
    
    
    <xsl:variable name="example">
    <tr class="odd">
        <td class="views-field views-field-title node-greek-vocabulary-lists" >
            <div><a href="/greek-core/%CE%BA%CE%B1%CE%AF">καί</a></div>          </td>
        <td class="views-field views-field-field-greek-definition node-greek-vocabulary-lists" >
            <div>and, also, even; καί...καί both...and</div>          </td>
        <td class="views-field views-field-field-greek-part-of-speech" >
            conjunction: coordinating          </td>
        <td class="views-field views-field-field-greek-semantic-group" >
            Conjunctions/Adverbs          </td>
        <td class="views-field views-field-field-greek-frequency-rank active" >
            3          </td>
    </tr>
    </xsl:variable>
    
    <xsl:template match="td[contains-token(@class,'views-field-title')]">
        <ent>
<!-- more to do here inferring Greek values -->
            <xsl:value-of select="normalize-space(.)"/>
        </ent>
    </xsl:template>
   
   
    <xsl:template match="td[contains-token(@class,'views-field-field-greek-definitione')]">
        <def>
            <xsl:value-of select="normalize-space(.)"/>
        </def>
    </xsl:template>
    <xsl:template match="td[contains-token(@class,'views-field-field-greek-part-of-speech')]">
        <poS>
            <xsl:value-of select="normalize-space(.)"/>
        </poS>
    </xsl:template>
    <xsl:template match="td[contains-token(@class,'views-field-field-greek-semantic-group')]">
        <gmr>
            <xsl:value-of select="normalize-space(.)"/>
        </gmr>
    </xsl:template>
    <xsl:template match="td[contains-token(@class,'views-field-field-greek-frequency-rank active')]">
        <frq>
            <xsl:value-of select="normalize-space(.)"/>
        </frq>       
    </xsl:template>
    
    
</xsl:stylesheet>