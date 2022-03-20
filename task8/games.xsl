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
            <!-- tabs menu -->
            <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <xsl:for-each select="ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Dictionaries/Dictionary">
                    <xsl:if test="@Code = 'Genre'">
                        <xsl:for-each select="DictionaryItem">
                            <!-- tab button -->
                                <button class="nav-link" id="v-pills-{@Code}-tab" data-bs-toggle="pill" data-bs-target="#v-pills-{@Code}" type="button" role="tab" aria-controls="v-pills-{@Code}" aria-selected="true">
                                    <xsl:value-of select="Name"/>
                                </button>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
            </div>
            <!-- /tabs menu -->

            <!-- all tabs -->
            <div class="tab-content" id="v-pills-tabContent">
                <xsl:for-each select="ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Dictionaries/Dictionary">
                    <xsl:if test="@Code = 'Genre'">
                        <xsl:for-each select="DictionaryItem">
                            <!-- tab -->
                            <div class="tab-pane fade" id="v-pills-{@Code}" role="tabpanel" aria-labelledby="v-pills-{@Code}-tab">
                                <div class="row row-cols-1 row-cols-md-3 g-4">
                                    <xsl:for-each select="Elements/Element">
                                        <xsl:variable name="thisGameId" select="@ID"/>
                                        <!-- card -->
                                        <div class="col">
                                            <div class="card">
                                                <div class="card-body">
                                                    <img src="{/ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Items/Item[@ID=$thisGameId]/Images/Image[@Type='logo190x140']}" alt="" class="game-image"/>
                                                    <h5 class="card-title">
                                                        <xsl:value-of select="/ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Items/Item[@ID=$thisGameId]/Name"/>
                                                    </h5>
                                                    <p class="card-text">
                                                        <xsl:value-of select="/ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Items/Item[@ID=$thisGameId]/Properties/Property[@Code='Description80']"/>
                                                    </p>
                                                    <a href="{/ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Items/Item[@ID=$thisGameId]/Properties/Property[@Code='OrderUrl']}">
                                                        Ссылка на игру                                                
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /card -->
                                    </xsl:for-each>
                                </div>
                            </div>
                            <!-- /tab -->
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
            </div>
            <!-- /all tabs -->
        </div>
        <!-- /d-flex -->
    </div>
    <!-- /container  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
</xsl:template>
</xsl:stylesheet> 