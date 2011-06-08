<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 19, 2010</xd:p>
            <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
   
   <!-- This style sheet is divided into the following sections:
      
      HTML WRAPPER
      MAJOR DOCUMENT STRUCTURES
      PAGE, COLUMN, AND LINE BREAKS
      MAJOR TEXTUAL STRUCTURES
      SORTING AND FORMATTING LISTS
      ANNOTATIONS
      MANUSCRIPT FEATURES
      MISCELLANEOUS TEXTUAL FEATURES
      IMAGES      
   -->
   
   <!-- HTML WRAPPER: Note that this section (between the xsl:template tags) 
      places the entire contents enclosed within the text tags of your document into 
      the body tags of the Web page. 
   -->
   <xsl:template match="/">
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
            <!-- Grab title from the fileDesc element of the TEI header. -->
            <title>
               <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            <!-- Insert CSS Style Sheet -->
            <style>
               body {
                   margin:30px;
                   background-color: #FFFFFF;
                   width: 60em;
                   font-family: Verdana, Arial, Helvetica, sans-serif;
               }
               p {
               }
               div.pagebreak {
                   margin-top: 25px;
                   margin-bottom: 0px;
                   text-align: center;
               }
               fl_right {
                   float: right;
               }
               hr {
                   color: #888833;
                   clear: right;
               }
               div#letter {
                   border: 3px groove #666666;
                   padding: 5px;
               }
               h1 {
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                   font-size: 16pt;
                   font-style: normal;
                   line-height: 18pt;
               }
               h2 {
               }
               h3 {
               }
               sup {
               }
               img {
                   margin-top: 5px;
                   margin-bottom: 5px;
               }
               .nocancel {
                   text-decoration: none;
                   color: #000000;
               }
               .cancel {
                   text-decoration: line-through;
                   color: #FF0000;
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
               .ProjectTitle {
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                   font-size: 16pt;
                   font-style: normal;
                   font-weight: bolder;
                   line-height: 18pt;
               }
               .hang15 {
                   margin-left: 40px;
                   text-indent: -15px;
               }
               .hang25 {
                   margin-left: 40px;
                   text-indent: -25px;
               }
               .hang35 {
                   margin-left: 40px;
                   text-indent: -35px;
               }
               table {
                   text-align: right;
               }</style>
         </head>
         <body
            background="https://images.asc.ohio-state.edu/is/image/mediamanager/9/9846d5b7-ad8b-4ffa-be30-4c70ea5dac63.jpg?scale=0.4&amp;rgn=360,440,240,240&amp;op_brightness=20&amp;fmt=png">
            <!-- Create navigation links at the top of the page -->
            <p align="center"><span class="ProjectTitle"><xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title"/>
            </span><br/> A Personal Journal of Louisa A. Doane (1835– )</p>
            <hr/>
            <p align="center">
               <a href="http://people.cohums.ohio-state.edu/ulman1/LADoaneJournal/default.cfm" target="self"
                  >Project Web Site</a> | <a
                  href="http://suse1.cohums.ohio-state.edu/tomcat/cocoon/eng569/Doane-Journal.Doane-EdintroP5"
                  target="self"> Ed. Intro</a> || <strong>Views</strong>: <a
                  href="http://suse1.cohums.ohio-state.edu/tomcat/cocoon/eng569/Doane-Journal.Doane-ReadingP5"
                  >Reading</a>) | Diplomatic (current/<a
                  href="http://suse1.cohums.ohio-state.edu/tomcat/cocoon/eng569/Doane-Journal.Doane-DiplomaticP5#view"
                  target="self">about</a> | <a
                  href="http://suse1.cohums.ohio-state.edu/tomcat/cocoon/eng569/Doane-Journal.Doane-SplitviewP5"
                  target="self"> MS Image/Text</a>
               <br/><br/><strong>This edition is still being developed. Please do not cite until
                  this notice is removed.</strong>
            </p>
            <hr/>
            <!-- Insert the front and body sections of the XML source and invoke apply-templates. -->
            <xsl:apply-templates select="//tei:text/tei:front"/>
            <xsl:apply-templates select="//tei:text/tei:body"/>
            <br/>
            <hr/>
            <!-- Insert, count, encode by cardinal position, and link the explanatory annotations. -->
            <h1>Explanatory Annotations</h1>
            <xsl:for-each select="//tei:note[@xml:id]">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a>
                           <xsl:attribute name="name">
                              <xsl:value-of select="@xml:id"/>
                           </xsl:attribute>
                        </a>
                        <xsl:number count="//tei:note[@xml:id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a>
                           <xsl:attribute name="name">
                              <xsl:value-of select="@xml:id"/>
                           </xsl:attribute>
                        </a>
                        <xsl:number count="//tei:note[@xml:id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a>
                           <xsl:attribute name="name">
                              <xsl:value-of select="@xml:id"/>
                           </xsl:attribute>
                        </a>
                        <xsl:number count="//tei:note[@xml:id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:otherwise>
               </xsl:choose>

            </xsl:for-each>
            <!-- Insert the back section of the XML document's back section and invoke apply-templates. -->
             <xsl:apply-templates select="//tei:text/tei:back"/>

            <hr/>
            <!-- Describe this view of the journal. -->
            <p>
               <strong>About this View of the Journal</strong>
            </p>
            <p><a name="view"/>The text of the journal is organized by manuscript pages. Line breaks
               and page breaks reflect those in the manuscript; paragraph breaks are not reported.
               Spelling, punctuation, capitalization, and abbreviations are reported as they appear
               in the manuscript. Text highlighted by Doane with an underscore is underscored in
               this view. Recoverable text canceled by Doane is reported in red, strikethrough text;
               unrecoverable text canceled by Cox is reported with an ellipsis in red, strikethrough
               text. Text added by Cox between lines is reported between arrows (↑ ↓) indicating the
               position of the addition; text added in the margin is reported between pipes (|). All
               material added by the editor is surrounded by square brackets: uncertain readings are
               enclosed in square brackets and followed by a question mark, errors in the manuscript
               are indicated by sic, and text supplied by the editors for clarity is set in italics.
               Gaps in the manuscript (e.g., tears) are noted by ellipses within square brackets.
               Links to explanatory notes are numbered, colored, and underlined; links to textual
               annotations are lettered, colored, and underlined. Finally, the background consists
               of a tiled detail from a page of Doane's journal.</p>
            <hr/>
            <!-- Insert link to home page, creation date, and licensing statement.-->
            <p align="left">
               <a href="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/SSCoxHome.cfm"
                  target="self">Home</a>
               <br/>
               <br/>
               <emph>Created: <xsl:apply-templates select="//tei:profileDesc/tei:creation/tei:date"/></emph>
            </p>
            <p align="center">
               <xsl:value-of select="//tei:availability/tei:p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
         </body>
      </html>
   </xsl:template>

   <!-- MAJOR DOCUMENT STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->

   <xsl:template match="tei:front">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:body">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:back">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will be encoded, or whether they will be included, in your Web page. -->

   <xsl:template match="tei:pb">
      <hr/>
      <br/>
      <span class="pagebreak">[Page&#xA0;-&#xA0;<xsl:number count="tei:pb" format="1" level="any"
         />&#xA0;(<a><xsl:attribute name="HREF"
                  >http://people.cohums.ohio-state.edu/ulman1/LADoaneJournal/DoaneZoom.cfm?file=<xsl:value-of
                  select="@facs"/>.jpg</xsl:attribute>
            <xsl:attribute name="target">top</xsl:attribute>click to open page image in a new window</a>)]</span>
      <br/>
   </xsl:template>
   <xsl:template match="tei:lb">
      <br/>
      <a>
         <xsl:attribute name="name">
            <xsl:number count="tei:lb" format="0001" level="any"/>
         </xsl:attribute>
      </a>
      <xsl:number count="tei:lb" format="0001" level="any"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
   </xsl:template>
   <xsl:template match="tei:seg[@type='softhyphen']">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:p"><xsl:apply-templates/></xsl:template>

   <!-- MAJOR TEXTUAL STRUCTURES - VOYAGES, SECTIONS, AND DAILY ENTRIES. -->

   <!-- Template rule for top-level divs: Voyages. -->
   
   <xsl:template match="tei:div[@type='voyage']">
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='voyage']/tei:head">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="tei:div/tei:head[@type='voyage']">
      <h1>
         <xsl:apply-templates/>
      </h1>
   </xsl:template>   
   
   <!-- Template rule for second-level divs: Sections. -->
   
   <xsl:template match="tei:div[@type='section']">
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='section']/tei:head">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   
   <!-- Template rule for third-level divs: Entries. -->
   
   <xsl:template match="tei:div[@type='Entry']">
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='Entry']/tei:head">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="tei:div[@type='Entry']/tei:dateline">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   
   <!-- Template rule for editorial divs in back matter -->
   
   <xsl:template match="tei:div[@type='editorial']">
      <hr/>
      <br/>
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='editorial']/tei:head">
      <h1><xsl:apply-templates/></h1>
   </xsl:template>
   
   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->
   
   <xsl:template match="//tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25"><a>
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
            <xsl:apply-templates/></p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="tei:bibl/tei:ref">
      (<xsl:apply-templates/>)
   </xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']"><cite><xsl:apply-templates/></cite></xsl:template>   
<!--   <xsl:template match="tei:bibl/tei:ref/tei:title[@level='a']">
      "<a><xsl:attribute name="HREF"><xsl:value-of select="../@target"/></xsl:attribute>      
      <xsl:apply-templates/></a>"
   </xsl:template>
   <xsl:template match="//tei:bibl/tei:ref/tei:title[@level='m']">
      <cite><a><xsl:attribute name="HREF"><xsl:value-of select="../@target"/></xsl:attribute>      
         <xsl:apply-templates/></a></cite>
   </xsl:template>
-->   <xsl:template match="tei:listPlace">
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"/></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"/></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
            <xsl:value-of select="tei:country"/> 
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: 
            <xsl:value-of select="tei:location/tei:geo"/>)</xsl:if>. 
            <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>
      
   <!-- ANNOTATIONS -->
   
   <xsl:template match="tei:ptr[@type='noteAnchor']">
      <a>
         <xsl:attribute name="href">#<xsl:value-of select="@target"/></xsl:attribute>
         <sup>
            <xsl:number level="any" count="tei:ptr[@type='noteAnchor']"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="tei:note[@xml:id]"/>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <!-- Hanshifts -->
    <xsl:template match="tei:handShift">[<xsl:value-of select="@new"/>] </xsl:template>
   
   <!-- Gaps in your transcript of the source text (tears in the page, and so on). -->
    <xsl:template match="tei:gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ]
    </xsl:template>
   <xsl:template match="tei:damage">
      [<em>Damage: <xsl:value-of select="@agent"/>
         (<xsl:value-of select="@extent"/> <xsl:value-of select="@unit"/>)</em>]
   </xsl:template>

   <!-- Editorial emendations: supplied text. -->
    <xsl:template match="tei:supplied">[<i><xsl:apply-templates/></i>]</xsl:template>

   <!-- Additions by the author or another hand. -->
    <xsl:template match="tei:add[@place='above']">
       &#x2191;<xsl:apply-templates/>&#x2193;
    </xsl:template>
   <xsl:template match="tei:add[@place='below']">
      &#x2193;<xsl:apply-templates/>&#x2191;
   </xsl:template>
   
   <!-- Recoverable cancellations by the author or another hand -->
    <xsl:template match="tei:del">
       <span class="cancel">
          <xsl:apply-templates/>
       </span>
    </xsl:template>
   
   <!-- Unclear passages. -->
    <xsl:template match="tei:unclear">[<xsl:apply-templates/>?]</xsl:template>
   
   <!-- Nonstandard or erroneous text for which you have encoded a correct or regularized alternative. -->
   <xsl:template match="tei:choice/tei:orig">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:reg"/>   
   <xsl:template match="tei:choice/tei:sic">
      <xsl:apply-templates/> [sic]
   </xsl:template>
   <xsl:template match="tei:choice/tei:corr"/>   
   
   <!--MISCELLANEOUS TEXTUAL FEATURES. -->

   <!-- Quotes -->
    <xsl:template match="tei:q">
      <xsl:apply-templates/>
    </xsl:template>
   
   <!-- Abbreviations -->
   <xsl:template match="tei:choice/tei:abbr">
      <xsl:apply-templates/>
    </xsl:template>
   <xsl:template match="tei:choice/tei:expan"/>
   
   <!-- Passages in languages other than your document's base language. -->
   <xsl:template match="tei:foreign">
      <em><xsl:apply-templates/></em>
   </xsl:template>

   <!-- Names -->
   <xsl:template match="tei:rs"><xsl:apply-templates></xsl:apply-templates></xsl:template>
   <xsl:template match="tei:name[@type='ship']">
      <em><xsl:apply-templates/></em>
   </xsl:template>
 
   <!-- Text highlighted in the source document -->
   
   <xsl:template match="tei:hi[@rend='underlined']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
    
   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->

   <xsl:template match="tei:figure[@rend='link']"> 
      [<a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a>]. </xsl:template>
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
</xsl:stylesheet>
