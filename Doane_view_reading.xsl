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
   
   <xsl:variable name="View">Reading Text</xsl:variable>
   <xsl:variable name="aboutView"> This presentation of the Doane journal derives from the project's
      main XML file, Doane-Journal.xml, transformed with Doane_view_common.xsl and
      Doane_view_reading.xsl. In this "view" of the Doane journal, the text of the journal is
      organized by daily entries. The single horizontal line between daily entries has been added to
      the text to aid scanning the text; it does not appear in the manuscript. Line breaks in the
      manuscript are not reported; rather, lines wrap in the browser's window. Page breaks are not
      reported. Paragraph breaks follow those in the manuscript. Spelling, punctuation,
      capitalization, and abbreviations are reported as they appear in the manuscript (see the
      Markup Guidelines appendix for more information about the treatment of Doane's orthography).
      Text highlighted by Doane with an underscore is underscored in this view. Text canceled by
      Doane is suppressed. Text added by Doane between lines or in the margins is silently
      incorporated into the text. All material added by the editor is surrounded by square brackets:
      uncertain readings are enclosed in square brackets and followed by a question mark, and text
      supplied by the editor for clarity is set in italics and surrounded by square brackets. Gaps
      in the manuscript (e.g., from tears or unrecoverable cancelations) are indicated by elipses
      enclosed by square brackets. Links to notes are colored and superscripted. </xsl:variable>
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
      top:120px;
      width:150px;
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
      right: 255px;
      color: #f1f1f1;
      font-size: 36px;
      font-weight: bold;
      transition: 0.3s;
      z-index: 2;
      }
      .description {
      position: absolute;
      top: 90px;
      right: 655px;
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
      width:610px;
      margin-top:35px;
      margin-left:20px;
      padding:5px;
      background-color: rgba(209,209,209, 0.5);
      -webkit-border-radius: 10px;
      -moz-border-radius: 10 px;
      border-radius: 10px;	
      }
   </xsl:variable>
   
   
   <!-- Include common style sheet for Doane diary. -->
   <xsl:include href="Doane_view_common.xsl"/>
   
   <!-- Define additional templates required for the reading view. -->
   
   <xsl:template match="tei:pb"/>
   <xsl:template match="tei:lb"/>
   <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>   
   <xsl:template match="tei:div[@type='Entry']/tei:head/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>
   
   <!-- Put single line before each entry. -->    
   <xsl:template match="tei:div[@type='Entry']">
      <div class="Entry">
 <!--        <xsl:element name="a"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:element>-->
         <hr/><xsl:apply-templates/>
      </div>
   </xsl:template>
   <xsl:template match="tei:div[@type='section']">
         <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:opener/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:closer/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:seg[@type='softhyphen']"/>
   <xsl:template match="tei:p">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   
   <!-- Recoverable cancellations by the author or another hand -->
   <xsl:template match="tei:del"/>
   
   <!-- Figures -->
   <xsl:template match="tei:figure[@rend='embed']">
      <div class="fl_img_right">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="tei:figDesc"/></xsl:attribute>
         </img>
         <br/>
         <xsl:value-of select="tei:head"/>
      </div>
   </xsl:template>
   
   
</xsl:stylesheet>

