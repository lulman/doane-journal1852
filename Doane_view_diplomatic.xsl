<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="xd tei"
   version="2.0">
   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Oct 29, 2011</xd:p>
         <xd:p><xd:b>Author:</xd:b> lulman</xd:p>
         <xd:p></xd:p>
      </xd:desc>
   </xd:doc>
   
   <!-- Declare variables that will "localize" references to them in Stephens-Common.xsl -->
   
   <xsl:variable name="View">Diplomatic Transcription</xsl:variable>
   <xsl:variable name="aboutView">This presentation of the Doane journal derives from the project's
      main XML file, Doane-Journal.xml, transformed with Doane_view_common.xsl and
      Doane_view_diplomatic.xsl. This "view" of the journal is organized by manuscript pages. Line
      breaks and page breaks reflect those in the manuscript; paragraph breaks are not reported.
      Spelling, punctuation, capitalization, and abbreviations are reported as they appear in the
      manuscript (see the Markup Guidelines appendix for more information about the treatment of
      Doane's orthography). Text highlighted by Doane with an underscore is underscored in this
      view. Recoverable text canceled by Doane is reported in square brackets; unrecoverable text
      canceled by Doane is reported with an ellipsis between square brackets. Text added by Doane
      between lines is reported between arrows (↑ ↓) indicating the position of the addition; text
      added in the margin is reported between pipes (|). All material added by the editor is
      surrounded by square brackets: uncertain readings are followed by a question mark, errors in
      the manuscript are indicated by sic, and text supplied by the editors for clarity is set in
      italics. Gaps in the manuscript (e.g., tears and unrecoverable cancelations) are noted by
      ellipses within square brackets. Links to explanatory notes are numbered, colored, and
      superscripted.</xsl:variable>
   <xsl:variable name="bodyRule">
      body {
      font-family: Times, Times New Roman, serif;
      font-size: 1em;
      width: 800px;
      margin-left: 50px;
      margin-right: 50px;
      margin-top: 100px;
      }
   </xsl:variable>
   <xsl:variable name="navBarRule">
      #navBar {
      position: fixed;
      width: 150px;
      top:120px;
      float : left;
      text-align : left;
      <!--margin-left: 10px;-->
      margin-top:0px;
      background-color: rgba(255, 255, 255, 1);
      }
      #viewMenu {
      position: fixed;
      top:120px;
      left: 865px;
      width:150px;
      margin-top: 0px;
      }
      .close {
      position: absolute;
      top: 90px;
      right: 260px;
      color: #f1f1f1;
      font-size: 36px;
      font-weight: bold;
      transition: 0.3s;
      z-index: 2;
      }        
      .description {
      position: absolute;
      top: 90px;
      right: 650px;
      color: #f1f1f1;
      font-size: 16px;
      font-weight: bold;
      transition: 0.3s;
      z-index: 2;
      }
   </xsl:variable>
   <xsl:variable name="maintextRule">
      #maintext {
      float:right;
      top:100px;
      width:610px;
      margin-top:35px;
      margin-left:20px;
      padding:5px;
      background-color: rgba(209,209,209, 0.5);
      -webkit-border-radius: 10px;
      -moz-border-radius: 10 px;
      border-radius: 10px;	
      }
      span.linenumber {
      font-family: Verdana, Arial, Helvetica, sans-serif;
      font-size: .80em;
      }
   </xsl:variable>
   
   <!-- Include common style sheet for Smith diaries. -->
   
   <xsl:include href="doane_view_common.xsl"/>
   
   <!-- Define templates required for the diplomatic view. -->
   
   <xsl:template match="tei:div[@type='Entry']">
      <div class="Entry">
<!--         <xsl:element name="a"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:element>
-->         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   <xsl:template match="tei:pb">
      <br/><hr/>
      <span class="pagebreak">[Page&#xA0;-&#xA0;<xsl:number count="tei:pb" format="1" level="any"/>
         &#xA0;(<a><xsl:attribute
            name="href"><xsl:value-of select="@facs"/>.jpg</xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>click to open page image in a new window</a>)]</span>
      <!--<br/>-->
   </xsl:template>  
   
   <xsl:template match="tei:lb"><br/><a><xsl:attribute name="id"><xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/></xsl:attribute>
   </a><span class="linenumber"><xsl:number  count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/></span>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
   </xsl:template>
   <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:add[@place='above']"> &#x2191; <xsl:apply-templates/> &#x2193; </xsl:template>
   <xsl:template match="tei:add[@place='below']"> &#x2193; <xsl:apply-templates/> &#x2191; </xsl:template>
   <xsl:template match="tei:add[@place='inline']">&#x7c;<xsl:apply-templates/>&#x7c;</xsl:template>
   <xsl:template match="tei:add[@place='margin']">&#x7c;<xsl:apply-templates/>&#x7c;</xsl:template>
  
  <!-- Deletions -->
   <xsl:template match="tei:del[@rend='overstrike']">[<span class="cancel"><xsl:apply-templates></xsl:apply-templates></span>]</xsl:template>
   <xsl:template match="tei:del[@rend='overwritten']">[<xsl:apply-templates></xsl:apply-templates>]</xsl:template>
   <xsl:template match="tei:del[@rend='erased']">[<xsl:apply-templates></xsl:apply-templates>]</xsl:template>
      
   <xsl:template match="tei:seg[@type='softhyphen']">
      <xsl:apply-templates/>
   </xsl:template>    
   <xsl:template match="tei:p"><xsl:apply-templates/></xsl:template>
   <xsl:template match="tei:figure[@rend='embed']"/>
   
   
</xsl:stylesheet>