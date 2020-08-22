<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="2.0" exclude-result-prefixes="tei">
   <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Feb 19, 2010</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p/>
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
   <xsl:template match="/">
   <!-- HTML WRAPPER: Note that this template 
      places the entire contents enclosed within the text tags of your document into 
      the HTML of the Web page. 
   -->
      <html>
         <head>
            <!-- Creat the head of the HTML document -->
            <!-- First, populate meta element with keywords -->
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
               <xsl:value-of
                  select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            <!-- LOCAL JS CALLS -->
            <link rel="stylesheet" href="jquery-ui.css"/>
            <link href="doane_journal.css" rel="stylesheet" type="text/css" />
            <script src="jquery-1.8.3.min.js"/>
            <script src="jquery-ui-1.9.2.custom.js"/>
            
            <!-- CREATE TOGGLE BUTTON FOR DIPLOMATIC/REGULARIZED SPELLING -->
<!--            <script>
               $(document).ready(function(){
               $("button").click(function(){
               $(".pencil").toggleClass("penciltoggle");
               $(".ink").toggleClass("inktoggle");
               });
               });
            </script>
-->            
            <!-- CALL VARIABLES (Needed here?) -->  
            <style>
               <xsl:value-of select="$maintextRule"/>
               <xsl:value-of select="$navBarRule"/>
               <xsl:value-of select="$bodyRule"/>
            </style>
            
            <!-- DECLARE FONTS -->
            <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>
            <link href='http://fonts.googleapis.com/css?family=Fanwood+Text' rel='stylesheet' type='text/css'/>
                   
         </head>
         
         <!-- BUILD THE BODY OF THE HTML PAGE -->
         
         <body>
            
            <!-- BUILD THE MENUBAR -->
            <div id="skiptocontent"><a href="#maincontent">skip to main content</a></div>       
            <div class="masthead">
               <div id="navigation">
               <ul class="nav">
                  <li class="link"><a class="main"  href="./doane_journal.html#introduction">Historical Introduction</a>
                     <ul class="sub">
                        <li><a href="./doane_journal.html#crossing">Shipboard Discipline</a></li>
                        <li><a href="./doane_journal.html#julyfourth">4th of July Abroad</a></li>
                        <li><a href="./doane_journal.html#epidemics">Epimenics at Sea</a></li>
                        <li><a href="./doane_journal.html#merchantships">19th Century Merchant Vessels</a></li>
                        <li><a href="./doane_journal.html#burialatsea">Burial at Sea</a></li>
                        <li><a href="./doane_journal.html#medical">Medicine Aboard Ships</a></li>
                        <li><a href="./doane_journal.html#food">Diet Aboard Ships</a></li>
                        <li><a href="./doane_journal.html#gender">Gender and Class</a></li>
                        <li><a href="./doane_journal.html#capehorn">Cape Horn</a></li>
                        <li><a href="./doane_journal.html#discipline">Violence Aboard Ships</a></li>
                     </ul>
                  </li>
                  <li class="link"><a class="main"  href="./sscox_journal.html#projectDescription">Editorial Introduction</a>
                     <ul class="sub">
                        <li><a href="./doane_journal.html#projectDescription">Project Description</a></li>
                        <li><a href="./doane_journal.html#source">The Source Document</a></li>
                        <li><a href="./doane_journal.html#edition">The Electronic Edition</a></li>
                        <li><a href="./doane_journal.html#revHistory">Revision History</a></li>
                     </ul>
                  </li>
                  <li class="link"><a class="main"  href="">Views of the Journal</a>
                     <ul class="sub">
                        <li><a href="./doane_reading.html">By Journal Entry</a></li>
                        <li><a href="./doane_diplomatic.html">By MS Page</a></li>
                        <li><a href="./doane_splitview.html">Facsimile/Text</a></li>
                     </ul>
                  </li>
                  <li class="link"><a class="main"  href="">Appendices</a>
                     <ul class="sub">
                        <li><a href="./doane_appendices_markup.html">Markup Guidelines</a></li>
                        <li><a href="./doane_appendices_hand.html">Guide to Doane`'s Hand</a></li>
                        <li><a href="./doane_appendices_zoomindex.html">Images of the MS Pages</a></li>
                        <li><a href="./doane_appendices_maps.html">Maps</a></li>
                        <li><a href="./doane_journal.html#peopleMentioned">People Mentioned</a></li>
                        <li><a href="./doane_journal.html#placesMentioned">Places Mentioned</a></li>
                        <li><a href="./doane_journal.html#organizationsMentioned">Organizations Mentioned</a></li>
                        <li><a href="./doane_journal.html#shipsMentioned">Ships Mentioned</a></li>
                        <li><a href="./doane_journal.html#worksCited">Works Cited</a></li>
                        <li><a href="./doane_appendices_acknowledgements.html">Acknowledgements</a></li>
                        <li><a href="./doane_appendices_editors.html">About the Editors</a></li>
                     </ul>
                  </li>
                  <li class="link"><a class="main"  href="">Source Files</a>
                     <ul class="sub">
                        <li><a href="./Doane_Journal.xml">TEI: Source Markup</a></li>
                        <li><a href="./Doane_view_common.xsl">XSL: Base Stylesheet</a></li>
                        <li><a href="./Doane_view_diplomatic.xsl">XSL: MS Page View</a></li>
                        <li><a href="./Doane_view_reading.xsl">XSL: Entry View</a></li>
                        <li><a href="./Doane_view_splitview.xsl">XSL: Text/Facs View</a></li>
                        <li><a href="./Doane_view_edintro.xsl">XSL: Ed. Intro</a></li>
                        <li><a href="./doane_journal.css">CSS: Style Sheet</a></li>
                        <li><a href="./doane_journal.odd.txt">ODD: TEI Customization</a></li>
                        <li><a href="./doane_journal.rnc.txt">RNC: Schema</a></li>
                     </ul>
                  </li>
               </ul> <!-- End ul class nav -->
            </div> <!-- End div id navigation -->
            
               <div id="titleBar">
                  <p align="center"><span class="projectTitle">Louisa A. Doane's Journal of Two Ocean Voyages, 1852-1853</span><br/>by Louisa A. Doane</p>
                  <!-- Horizontal rule beneath page title -->
                  <hr style="border: 2px solid crimson;"/>
               </div> <!-- END titleBar -->
            </div> <!-- END masthead -->
            <!-- BUILD THE VERTICAL IMAGE BAR -->
            
            <div id="navBar">
               
               <div id="display1"><!-- Begin display1 -->
                  <button class="modalb" id="b1"><img id="myImg1" src="image_clipper_ship.jpg" alt="Clipper ship in full sail" title="Clipper ship in full sail" width="100"/></button>
                  <div id="myModal1" class="modal">
                     <a href="image_clipper_ship_longdesc.html" class="description">[Description]</a><br/>
                     <button class="modalb close" onclick="document.getElementById('myModal1').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img1" src="image_clipper_ship.jpg" alt="Clipper ship in full sail"/>
                     <div id="caption1">
                        The American Clipper Ship Great Republic<br/><cite>The Illustrated London News</cite>, 1855
                        <br/>Courtesy Library of Congress Prints and Photographs Online Catalog
                     </div>
                  </div> <!-- End myModal1 -->
               </div> <!-- End display1 -->
               
               <!-- Begin display2 -->
               <div id="display2">
                  <button class="modalb" id="b2"><img id="myImg2" src="image_OldHarborMarseille03.jpg" alt="The old harbor of Marseille" title="The old harbor of Marseille" width="100"/></button>
                  <div id="myModal2" class="modal">
                     <a href="image_OldHarborMarseille03_longdesc.html" class="description">[Description]</a><br/>
                     <button class="modalb close" onclick="document.getElementById('myModal2').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img2" src="image_OldHarborMarseille03.jpg" alt="The old harbor of Marseille"/>
                     <div id="caption2">
                        The Old Harbor, Marseille<br/>Courtesy Library of Congress Prints and Photographs Online Catalog
                     </div>
                  </div> <!-- End myModal2 -->
                  <script>		
                     // Get the second modal
                     var modal2 = document.getElementById('myModal2');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img2 = document.getElementById('b2');
                     var modalImg2 = document.getElementById("img2");
                     var captionText2 = document.getElementById("caption2");
                     img2.onclick = function(){
                     modal2.style.display = "block";
                     modalImg2.src = this.img.src;
                     captionText2.innerHTML = this.alt;
                     }
                     
                     // Get the span element that closes the modal 
                     var span = document.getElementsByClassName("close")[0];
                     
                     // When the user clicks on span (x), close the modal 
                     span.onclick = function() {
                     modal2.style.display = "none";
                     }
                  </script>
               </div> <!-- End display2 -->
               
               <!-- Begin display3 -->         
               <div id="display3">
                  <button class="modalb" id="b3"><img id="myImg3" src="image_ChineseMiners_Chinca_Islands.jpg" alt="Chinese guano miners, Chinca Islands" title="Chinese guano miners, Chinca Islands" width="100"/></button>
                  <div id="myModal3" class="modal">
                     <a href="image_ChineseMiners_Chinca_Islands_longdesc.html" class="description">[Description]</a><br/>
                     <button class=" modalb close" onclick="document.getElementById('myModal3').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img3" src="image_ChineseMiners_Chinca_Islands.jpg" alt="Chinese miners, Chinca Islands"/>
                     <div id="caption3">
                        Chinese guano miners, Chinca Islands, 1865<br/><cite>Rays of Sunlight from South America</cite>, by Alexander Gardner (1865)<br/>
                        Courtesy National Museum of American History<br/>
                     </div>
                  </div> <!-- End myModal3 -->
                  <script>
                     
                     // Get the modal
                     var modal3 = document.getElementById('myModal3');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img3 = document.getElementById('b3');
                     var modalImg3 = document.getElementById("img3");
                     var captionText3 = document.getElementById("caption3");
                     img3.onclick = function(){
                     modal3.style.display = "block";
                     modalImg3.src = this.img.src;
                     captionText3.innerHTML = this.alt;
                     }
                     
                     // Get the span element that closes the modal
                     var span = document.getElementsByClassName("close")[0];
                     
                     // When the user clicks on span (x), close the modal
                     span.onclick = function() {
                     modal3.style.display = "none";
                     }
                  </script>
               </div> <!-- End display3 -->
               <!--
                  
               <!-\- Begin display4 -\->
               
               <div id="display4">
                  <button class="modalb" id="b4"><img id="myImg4" src="image_sscox_illus_PoetsCorner.jpg" alt="Poet's Corner, Westminster Abbey. Illustration from A Buckeye Abroad (1854)" title="Poet's Corner, Westminster Abbey. Illustration from A Buckeye Abroad (1854)" width="100"/></button>
                     <div id="myModal4" class="modal">
                        <a href="image_sscox_illus_PoetsCorner_longdesc.html" class="description">[Description]</a><br/>
                        <button class="modalb close" onclick="document.getElementById('myModal4').style.display='none'">[Close]</button>
                        <img class="modal-content" id="img4" src="image_sscox_illus_PoetsCorner.jpg" alt="Poet's Corner, Westminster Abbey. Illustration from A Buckeye Abroad (1854)."/>
                        <div id="caption4">
                           Poet's Corner, Westminster Abbey.<br/>Illustration from <cite>A Buckeye Abroad</cite><br/>Cincinnati: Moore, Anderson, 1854.
                        </div> <!-\- End myModal4 -\->
                        <script>
                           
                           // Get the modal
                           var modal4 = document.getElementById('myModal4');
                           
                           // Get the image and insert it inside the modal - use its "alt" text as a caption
                           var img4 = document.getElementById('b4');
                           var modalImg4 = document.getElementById("img4");
                           var captionText4 = document.getElementById("caption4");
                           img4.onclick = function(){
                           modal4.style.display = "block";
                           modalImg4.src = this.img.src;
                           captionText4.innerHTML = this.alt;
                           }
                           
                           // Get the span element that closes the modal
                              var span = document.getElementsByClassName("close")[0];
                              
                              // When the user clicks on span (x), close the modal
                                 span.onclick = function() {
                                 modal4.style.display = "none";
                                 }
                        </script>
                     </div> <!-\- End modal4 -\->
               </div> <!-\- End display 4 -\->
                     
                     <!-\- Begin display5 -\->
                     
                     <div id="display5">
                        <button class="modalb" id="b5"><img id="myImg5" src="image_sscox_illus_Pompeii.jpg" alt="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854)" title="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854)" width="100"/></button>
                           <div id="myModal5" class="modal">
                              <a href="image_sscox_illus_Pompeii_longdesc.html" class="description">[Description]</a><br/>
                              <button class="modalb close" onclick="document.getElementById('myModal5').style.display='none'">[Close]</button>
                              <img class="modal-content" id="img5" src="image_sscox_illus_Pompeii.jpg" alt="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854) "/>
                              <div id="caption5">
                                 A Villa in Pompeii<br/>Illustration from <cite>A Buckeye Abroad</cite> <br/>Cincinnati: Moore, Anderson, 1854
                              </div>
                           </div> <!-\- End myModal5 -\->
                           <script>
  
               
                              // Get the modal
                              var modal5 = document.getElementById('myModal5');
                              
                              // Get the image and insert it inside the modal - use its "alt" text as a caption
                              var img5 = document.getElementById('b5');
                              var modalImg5 = document.getElementById("img5");
                              var captionText5 = document.getElementById("caption5");
                              img5.onclick = function(){
                              modal5.style.display = "block";
                              modalImg5.src = this.img.src;
                              captionText5.innerHTML = this.alt;
                              }
                              
                              // Get the span element that closes the modal
                                 var span = document.getElementsByClassName("close")[0];
                                 
                                 // When the user clicks on span (x), close the modal
                                    span.onclick = function() {
                                    modal5.style.display = "none";
                                    }
                           </script>
                     </div> 
            <!-\- End display5 -\->
-->  
               <script>
                  // Get the first modal
                  var modal1 = document.getElementById('myModal1');
                  
                  // Get the image and insert it inside the modal - use its "alt" text as a caption
                  var img1 = document.getElementById('b1');
                  var modalImg1 = document.getElementById("img1");
                  var captionText1 = document.getElementById("caption1");
                  img1.onclick = function(){
                  modal1.style.display = "block";
                  modalImg1.src = this.img.src;
                  captionText1.innerHTML = this.alt;
                  }
                  
                  // Get the span element that closes the modal
                  var span = document.getElementsByClassName("close")[0];
                  
                  // When the user clicks on span (x), close the modal
                  span.onclick = function() {
                  modal1.style.display = "none";
                  }
               </script>
               
            </div> <!-- End div id NavBar -->
            
            <!-- END THE VERTICAL IMAGE BAR -->
            <!-- START RIGHT MENU -->   
            <div id="viewMenu">
               <p class="aboutView"><a href="#View">About this view.</a></p>
               <div class="container">
                  <p class="font-size-label">Font Size <button id="up">+</button> <button id="down">-</button></p>
                  <!--<p id="font-size"></p>-->
                                                     
                  <!-- Start NINES Widget -->
                  <form method="get"
                     style="font-size-adjust:none;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.231;color:#000000;"
                     action="http://www.nines.org/search">
                     <div
                        style="background:url(image-widget_tower_white.jpg) no-repeat scroll left top;height:56px;width:157px;font-size:12px;margin:0;padding:125px 0 0 22px;text-align:left;font-family:'Times New Roman',Times,serif;font-size-adjust:none;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.231;color:#000000;">
                        <a href="http://nines.org"
                           style="text-decoration:none; float:left; margin-top:-125px; height:120px; width:120px;"
                           >&#160;</a>
                        <input type="text" name="q" onclick="this.form.target='_blank';return true;"
                           size="16" maxlength="255" value=""
                           style="width:100px;-x-system-font:none;font-family:arial,helvetica,clean,sans-serif;font-size-adjust:none;font-stretch:normal;font-style:normal;font-variant:normal;font-weight:normal;line-height:normal;margin:0;margin-top:3px;margin-bottom:5px;padding:0;text-align:left;color:#000000;" />
                        <input type="submit" value="Search NINES"
                           style="width:100px;padding:1px;-x-system-font:none;font-family:arial,helvetica,clean,sans-serif;font-size:99%;font-size-adjust:none;font-stretch:normal;font-style:normal;font-variant:normal;font-weight:normal;line-height:normal;margin:0;margin-left:7px;text-align:left;color:#000000;"
                        />
                     </div>
                  </form>
                  <!-- End NINES Widget -->
                  <!-- END RIGHT MENU -->
               </div> <!-- End div class "container" -->
            </div> <!-- End div id "View Menu" -->
            
            
            <!-- Apply templates to the tei:body. -->
            
            <xsl:element name="div">
               <xsl:attribute name="id">maintext</xsl:attribute>
               <xsl:element name="div"><xsl:attribute name="id">maincontent</xsl:attribute></xsl:element>
               <xsl:apply-templates select="/tei:TEI/tei:text/tei:body"/>
               
            <!-- Insert, count, encode by cardinal position, and link the explanatory annotations. -->
  
               <!-- Horizontal rule between text of letters and explanatory annotations -->
               <hr style="border:2px solid crimson;"/>
               
               <h2>Explanatory Annotations</h2>
               <hr/>
            <xsl:for-each select="//tei:body//tei:note[@resp='ed']">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a>
                           <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"/>.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:otherwise>
               </xsl:choose>

            </xsl:for-each>
            
               <!-- LIST OF WORKS CITED NOT INCLUDED IN "VIEWS" -->
<!--               <hr style="border:2px solid crimson;"/>
               <a name="WorksCited"/>
            <h2>List of Works Cited</h2>
               <hr/>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl"/>
-->               
               <hr style="border:2px solid crimson;"/>
               <!-- Describe this view of the journal. -->
            <h2>About this View of the Journal</h2>
               <hr/>
            <p><a name="view"/><xsl:value-of select="$aboutView"/></p>
               
            <hr/>
            <a href="#top">Top of Page</a>
               
            <!-- Insert link to home page, creation date, and licensing statement.-->
            <p align="left">
               <br/>
               <br/>
               <emph>Created: <xsl:apply-templates
                     select="//tei:TEI/tei:teiHeader/tei:profileDesc/tei:creation/tei:date"/></emph>
            </p>
            <p align="center">
               <xsl:value-of
                  select="//tei:teiCorpus/tei:teiHeader/tei:availability/tei:p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script src="index.js"></script>
               
          </xsl:element>                      
         </body>                  
      </html>
   </xsl:template>

   <!-- MAJOR DOCUMENT STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->
   
<!-- ENTRY TEMPLATE DEFINED IN SEPARATE VIEWS -->
<!--   <xsl:template match="tei:div[@type='Entry']">
         <div class="Entry">
            <xsl:element name="a"><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:element>
            <xsl:apply-templates/>
         </div>
   </xsl:template>
-->   
   <xsl:template match="tei:div[@type='Entry']/tei:dateline">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will be encoded, or whether they will be included, in your Web page. -->

   <xsl:template match="tei:ab/tei:persName">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:addrLine">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='letter']/tei:head">
      <p><xsl:apply-templates/></p>
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
      <h1>
         <xsl:apply-templates/>
      </h1>
   </xsl:template>

   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->

   <xsl:template match="//tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25">
            <a>
               <xsl:attribute name="name">
                  <xsl:value-of select="@xml:id"/>
               </xsl:attribute>
            </a>
            <xsl:apply-templates/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:note[@type='introductory']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:note[@resp='ed']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:ref"><xsl:apply-templates/></xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:listPlace">
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"
               /></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"
                  /></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
               <xsl:value-of select="tei:country"/>
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: <xsl:value-of
                  select="tei:location/tei:geo"/>)</xsl:if>. <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- ANNOTATIONS -->

   <xsl:template match="tei:TEI//tei:ptr[@type='noteAnchor']">
      <a>
         <xsl:attribute name="name">p<xsl:value-of select="@target"></xsl:value-of>
         </xsl:attribute>
         <xsl:attribute name="class">notePointer</xsl:attribute>
      </a>
      <a>
         <xsl:attribute name="href">#n<xsl:value-of select="@target"/></xsl:attribute>
         <xsl:attribute name="class">annotation</xsl:attribute>
         <xsl:attribute name="title"><xsl:value-of select="normalize-space(following::tei:note[1])"></xsl:value-of></xsl:attribute>
         <sup class="noteAnchor">
            <xsl:number level="any" count="tei:TEI//tei:ptr[@type='noteAnchor']"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="tei:note[@xml:id]"/>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <!-- Handshifts -->
<!--   <xsl:template match="tei:handShift"> [<xsl:value-of select="@new"/>] </xsl:template>-->
   <xsl:template match="tei:handShift"/>

   <!-- Gaps in your transcript of the source text (tears in the page, and so on). -->
   <xsl:template match="tei:gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ] </xsl:template>
   <xsl:template match="tei:damage"> [<em>Damage: <xsl:value-of select="@agent"/> (<xsl:value-of
            select="@extent"/>
         <xsl:value-of select="@unit"/>)</em>] </xsl:template>

   <!-- Editorial emendations -->
   <xsl:template match="tei:supplied">[<xsl:apply-templates/>] </xsl:template>

   <!-- Additions by the author or another hand. -->
   <xsl:template match="tei:add">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Unclear passages. -->
   <xsl:template match="tei:unclear"> [<xsl:apply-templates/>?] </xsl:template>

   <!-- Alternate between Cox's original pencil and overwritten ink. -->
   
   <xsl:template match="tei:app/tei:lem">
      <span class="pencil"><xsl:apply-templates/></span>
   </xsl:template>
   
   <xsl:template match="tei:app/tei:rdg">
      <span class="ink inktoggle"><xsl:apply-templates/></span>
   </xsl:template>
      
   <!-- Original encoding indicating pencil and ink in displayed text -->
<!--   
   <xsl:template match="tei:app/tei:lem">
      <span class="pencil">[p&gt;]<xsl:apply-templates/>[&lt;p]</span>
   </xsl:template>
   
   <xsl:template match="tei:app/tei:rdg">
      <span class="ink inktoggle">[i&gt;]<xsl:apply-templates/>[&lt;i]</span>
   </xsl:template>
--> 
   
   
<!--  NOT USED IN THIS EDITION
      
   <xsl:template match="tei:distinct[@type='babyTalk']">
      <xsl:apply-templates/> [sic] 
   </xsl:template>
-->
   
   <!--MISCELLANEOUS TEXTUAL FEATURES. -->

   <!-- Quotes -->
   <xsl:template match="tei:q">
      <q>
      <xsl:apply-templates/>
      </q>
   </xsl:template>
   <xsl:template match="//tei:quote[@type='blockquote']">
      <p class="blockquote">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <!-- Choice Elements -->
   <xsl:template match="tei:choice/tei:abbr">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:expan"/>
   <xsl:template match="tei:choice/tei:sic">
      <span class="sic"><xsl:apply-templates/>[sic]</span>
   </xsl:template>
<!--  Suppress this markup in this edition (see following rule)
   <xsl:template match="tei:choice/tei:corr">
      <span class="corr corrtoggle"><xsl:apply-templates/></span>
   </xsl:template>
-->   
   <xsl:template match="tei:choice/tei:corr"/>
   
   <!-- The log of the Asia.  -->
   <xsl:template match="tei:table[@xml:id='log']">
      <table cellpadding="5px" class="log">
         <xsl:for-each select="tei:row">
            <tr>
               <xsl:for-each select="tei:cell">
               <td class="logcell" nowrap="nowrap">
                  <xsl:apply-templates/>               
               </td>
               </xsl:for-each>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <!-- Passages in languages other than your document's base language. -->  
   <xsl:template match="tei:foreign">
         <xsl:apply-templates/>
   </xsl:template>

   <!-- Names -->
   <xsl:template match="tei:rs">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:note/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:person/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Text highlighted in the source document -->

   <xsl:template match="tei:hi[@rend='underline']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->

   <xsl:template match="tei:figure[@rend='link']"> [<a>
         <xsl:attribute name="href">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt"><xsl:value-of select="tei:figDesc"/> </xsl:attribute>
         <xsl:attribute name="target">_blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a>].
   </xsl:template>
   
   <xsl:template match="tei:figure[@rend='namedanchor']">
      <a>
      <xsl:attribute name="name">
         <xsl:value-of select="tei:graphic/@url"/>
      </xsl:attribute>
   </a>
   </xsl:template>
   

</xsl:stylesheet>
