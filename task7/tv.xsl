<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="myDate" select="0000-00-00"/>
<xsl:template match="/">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"/>
</head>
<body>
    <div class="container">
        <div class="d-flex align-items-start">
            <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <xsl:for-each select="TVGrid/Event/Date[not(.=preceding::*)]">
                <button class="nav-link" id="v-pills-{.}-tab" data-bs-toggle="pill" data-bs-target="#v-pills-{.}" type="button" role="tab" aria-controls="v-pills-{.}" aria-selected="true">
                    <xsl:value-of select="."/>
                </button>
                </xsl:for-each>
            </div>
            <div class="tab-content" id="v-pills-tabContent">
            <xsl:for-each select="TVGrid/Event/Date[not(.=preceding::*)]">
                <xsl:variable name="i" select="." />
                <div class="tab-pane fade" id="v-pills-{.}" role="tabpanel" aria-labelledby="v-pills-{.}-tab">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                    <xsl:for-each select="/TVGrid/Event[Date=$i]">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <span class="badge bg-primary">
                                            <xsl:value-of select="Start"/>
                                        </span>&#x2007;
                                        <xsl:value-of select="Title"/>
                                    </h5>
                                    <p class="card-text">
                                        <xsl:value-of select="Info"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                    </div>     
                </div>
            </xsl:for-each>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
</xsl:template>
</xsl:stylesheet> 