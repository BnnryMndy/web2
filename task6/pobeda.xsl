<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"/>
</head>
<body>
   <h1>Топ-10 Генералов</h1>
   <div class="container">
      <xsl:for-each select="generals/person">
         <xsl:sort select="votes" />
         <xsl:if test="position() &lt; 11">
            <article>
               <h3><xsl:value-of select="name"/></h3>
               <h5>годы жизни (<xsl:value-of select="lifedates"/>гг)</h5>
               <p>Голосов: <xsl:value-of select="votes"/></p>
               <p>
                  <xsl:value-of select="description"/>
                  <a href="{url}">Подробнее ...</a>
               </p>
               
            </article>
         </xsl:if>
      </xsl:for-each>
   </div>
   
</body>
</html>
</xsl:template>
</xsl:stylesheet> 