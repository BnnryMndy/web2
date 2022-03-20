<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="rss/channel">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"/>
</head>
<body>
    <h1><xsl:value-of select="title"/></h1>
    <h2 class="text-muted mb-4"><xsl:value-of select="description"/></h2>
    <div class="container">  
            <xsl:for-each select="item">
                <div class="card w-100 m-1">
                    <div class="card-body">
                        <h5 class="card-title"><a href="{link}"><xsl:value-of select="title"/></a></h5>
                        <p class="card-text"><xsl:value-of select="description"/></p>
                    </div>
                    <div class="card-footer text-muted">
                        <xsl:value-of select="pubDate"/>
                    </div>
                </div>
            </xsl:for-each>
    </div>

</body>
</html>
</xsl:template>
</xsl:stylesheet> 