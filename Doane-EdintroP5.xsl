<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Feb 19, 2010</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p></xd:p>
      </xd:desc>
   </xd:doc>
   <!-- 
   
   HTML WRAPPER: Note that this section (between the xsl:template tags) 
   places the entire contents enclosed within the TEI Header of your document into 
   the body element of the Web page. 
   
   -->
   <xsl:template match="tei:teiHeader">
      <html>
         <head>
            <!-- Populate meta element with keywords -->
            <xsl:element name="meta">
               <xsl:attribute name="name">keywords</xsl:attribute>
               <xsl:attribute name="content">
                  <xsl:for-each select="//tei:keywords[@scheme='#LCSH']/tei:term">
                     <xsl:choose>
                        <xsl:when test="current()=//tei:keywords[@scheme='#LCSH']/tei:term[1]">
                           <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
                     </xsl:choose>
                  </xsl:for-each>
               </xsl:attribute>
            </xsl:element>
            <title>
               <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            <style>
               body {
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                   font-size: 1em;
                   margin: 25px;
                   width: 800px;
                    
               }
               h1 {
                   font-size: 1.5em;
                   font-weight: bold;
                    
               }
               h2 {
                   font-size: 1.25em;
                   font-weight: bold;
                    
               }
               h3 {
                   font-size: 1em;
                   font-style: italic;
                    
               }
               p {
                   font-family:
                   Verdana, Arial, Helvetica, sans-serif;
                    
               }
               hr {
                   clear: right;
               }
               div.fl_mov_right {
                   float: right;
                   text-align: center;
                   width: 320;
                   margin: 5px 5px 5px 5px;
               }
               div.fl_aud_right {
                   float: right;
                   width: 200;
                   text-align: center;
                   margin: 5px 5px 5px 5px;
               }
               div.fl_img_right {
                   float: right;
                   text-align: center;
                   margin: 5px 5px 5px 5px;
               }
               .projectTitle {
                   text-align: center;
                    
               }
               .revTable {
                   font-size: 1em;
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                    
               }
               .links {
                   font-size: .85em;
                   text-align: center;
                    
               }
               .bibl {
                   text-indent: -1em;
                   margin-left: 1em;
                    
               }
               .blockquote {
                   margin-left: 2em;
               }
               .float_right {
                   float: right;
                   margin: 10px 10px 10px 10px;
                    
               }</style>
            <script type="text/javascript" src="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/AC_QuickTime_qtsrc.js" language="JavaScript">
            </script>
         </head>
         <body>
            <h1 class="projectTitle">
               <xsl:value-of select="//tei:titleStmt/tei:title"/>
            </h1>
            <p class="projectTitle">By <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:author"/></p>
            <hr/>
            <p class="links">[ <a href="#source">About the Source Document</a> | <a href="#edition"
                  >About the Electronic Edition</a> | <a href="#revision">Revision History</a> | <a
                  href="#view">About this Editorial Introduction</a> | <a
                     href="http://people.cohums.ohio-state.edu/ulman1/LADoaneJournal/default.cfm">Project Web
                  site</a>] 
               <br/><br/><xsl:element name="a">
                  <xsl:attribute name="href"
                     >DoaneJournal-Reading.html</xsl:attribute>
                  <strong>Link to the Text of the Journal</strong>
               </xsl:element>
               <br/><br/><strong>This edition is still being developed. Please do not cite until
                  this notice is removed.</strong>
            </p>
            <hr/>
     <!-- Order and apply templates for the sections of the header you wish to include. -->
            <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']"/>
            <xsl:apply-templates
               select="tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']"/>
            <xsl:apply-templates select="tei:fileDesc/tei:publicationStmt"/>
            <xsl:apply-templates select="tei:fileDesc/tei:titleStmt"/>
            <xsl:apply-templates select="tei:encodingDesc/tei:projectDesc"/>
            <xsl:apply-templates select="tei:encodingDesc/tei:editorialDecl"/>
            <xsl:apply-templates select="tei:encodingDesc/tei:refsDecl"/>
            <xsl:apply-templates select="tei:revisionDesc"/>
            <hr/>
            <p>
               <strong>About this Editorial Introduction</strong>
            </p>
            <p><a name="view"/>Text on this page is derived from the TEI Header element of the
               edition's XML source document, Doane-Journal.xml.</p>
            <hr/>
            <p>&#x2192; <a href="DoaneJournal-Reading.html">Link to the text of the journal</a>.
            </p>
         </body>
      </html>
   </xsl:template>
   
   <!-- Add the introductory notes. -->
   <xsl:template match="tei:notesStmt/tei:note[@type='introductory']">
         <h2>Introduction</h2>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- Add information about your source document. -->
   <xsl:template match="tei:notesStmt/tei:note[@type='descriptive']">
      <hr/>
      <a name="source"/>
      <h2>About the Source Document</h2>
      <p>Title: "<xsl:value-of select="//tei:biblFull/tei:titleStmt/tei:title"/>" <br/>Author: <xsl:value-of
         select="//tei:biblFull/tei:titleStmt/tei:author"/>
         <br/>Extent: <xsl:value-of select="//tei:biblFull/tei:extent"/>
      </p>
         <xsl:apply-templates/>
      <p>
         <xsl:apply-templates select="tei:fileDesc/tei:publicationStmt"/>
      </p>
   </xsl:template>
   <xsl:template match="tei:refsDecl">
      <h3>Encoding Conventions</h3>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:availability">
      <p>
         <em>
            <xsl:apply-templates/>
         </em>
      </p>
      <p>
         <em>
            <xsl:value-of select="//tei:publicationStmt/tei:pubPlace"/>, <xsl:value-of
               select="//tei:publicationStmt/tei:date"/>
         </em>
      </p>
   </xsl:template>

   <!-- Add information about your electronic document. -->
   <xsl:template match="tei:projectDesc">
      <h3>Project Description</h3>
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="tei:titleStmt">
      <hr/>
      <a name="edition"/>
      <h2>About the Electronic Edition</h2>
      <p>Title: <xsl:value-of select="tei:title"/>
         <br/>Editors: <xsl:for-each select="tei:editor/tei:persName">
            <xsl:choose>
               <xsl:when test="current()=//tei:titleStmt/tei:editor[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.</p>
      <xsl:apply-templates select="tei:respStmt"/>
   </xsl:template>
   <xsl:template match="tei:respStmt">
      <p>
      <xsl:value-of select="tei:resp"/>
      <xsl:for-each select="tei:persName">
            <xsl:choose>
               <xsl:when test="current()=//tei:respStmt/tei:persName[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.
      </p>
   </xsl:template>
   <xsl:template match="tei:editorialDecl">
      <h3>Editorial Method</h3>
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Add information about the revision history of your document. -->
   <xsl:template match="tei:revisionDesc">
         <p align="center">
            <xsl:value-of select="//tei:availability/tei:p[@xml:id='CreativeCommons']"
               disable-output-escaping="yes"/>
         </p>
         <hr/>
         <a name="revision"/>
         <h2>Revision History</h2>
      <table width="90%">
         <tr>
            <td>
               <h3>Date</h3>
            </td>
            <td>
               <h3>Role</h3>
            </td>
            <td>
               <h3>Name</h3>
            </td>
            <td>
               <h3>Change</h3>
            </td>
         </tr>
         <xsl:for-each select="tei:change">
            <tr class="revTable" valign="top">
               <td nowrap="nowrap">
                  <xsl:value-of select="@when"/>
               </td>
               <td nowrap="nowrap">
                  <xsl:value-of select="tei:respStmt/tei:resp"/>
               </td>
               <td nowrap="nowrap">
                  <a><xsl:attribute name="HREF"><xsl:value-of select="@who"/></xsl:attribute>HLU</a>
               </td>
               <td>
                  <xsl:value-of select="text()"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <!-- Format miscellaneous elements -->
   <xsl:template match="//tei:p">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="tei:q[@rend='block']">
      <br/>
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:name">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:name[@type='ship']">
      <i><xsl:apply-templates/></i>
   </xsl:template>
   <xsl:template match="tei:foreign">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='italics']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:emph[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="tei:bibl/tei:ref">
      (<xsl:apply-templates/>)
   </xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']"><cite><xsl:apply-templates/></cite></xsl:template>   
   <xsl:template match="tei:date">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->
   <xsl:template match="tei:figure[@rend='link']"> 
      <a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a></xsl:template>
   <xsl:template match="tei:figure[@rend='embed']">
      <div class="fl_img_right">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
               <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
         </img>
         <br/>
         <xsl:value-of select="tei:head"/>
      </div>
   </xsl:template> 
  
   <!-- Suppress some unused elements in the XML file. -->
   <xsl:template match="tei:text"/>
   <xsl:template match="tei:editor"/>
   <xsl:template match="tei:principal"/>
   <xsl:template match="tei:editionStmt"/>
   <xsl:template match="tei:extent"/>
   <xsl:template match="tei:encodingDesc"/>
   <xsl:template match="tei:profileDesc"/>
   <xsl:template match="tei:idno"/>
   <xsl:template match="tei:publisher"/>
   <xsl:template match="tei:pubPlace"/>
   <xsl:template match="tei:availability/tei:p[@xml:id='CreativeCommons']"/>
</xsl:stylesheet>
