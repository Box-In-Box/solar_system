<?xml version="1.0" encoding="euc-kr"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>태양계 행성 정리</title>

                <style>
                    body {
                        background-image: url('etc/galaxy.png');
                        background-repeat: no-repeat;
                        background-size: cover;
                    }
                    <!--Text Color-->
                    h1 { color : FFFFFF; 
                        font-size: 300%;}
                    h2 { color : FFFFFF; }
                    h3 { color : FFFFFF; }
                    h4 { color : FFFFFF; }
                    h5 { color : FFFFFF; }
                    h6 { color : FFFFFF; }
                    p { color : FFFFFF; }

                    <!--div-->
                    div { 
                        margin : 10px;
                        <!--background-color : 333333-->        
                    }
                    .main {
                        margin : 20px;
                        overflow:auto;
                        <!--background-color : 111111;-->
                    }
                    .left {
                        float: left;
                    }
                    .right {
                        float: right;
                    }
                    .name {
                        padding-top: 1px;
                        padding-bottom: 1px;
                        background: silver;
                        border-radius: 50%;
                    }
                    .description {
                        white-space:pre;
                        word-wrap: break-word;
                    }
                    <!--planet-->
                    .planet {
                        display: inline-block;
                    }
                    .planetsub {
                        display: inline-block;
                        margin: 0;
                    }
                    .planet:hover {
                        background-image: url('etc/select.png');
                        background-position: center;
                        background-repeat: no-repeat;
                        background-size: cover;
                        cursor: pointer;
                    }
                    <!--Table-->
                    .tStyle {
                        width: 900px;
                        background-color: AAAAAA;
                        color : FFFFFF;
                        border-collapse: collapse;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
                        border-radius: 5px;
                        overflow: hidden;
                    }
                    .tStyle caption {
                        font-size: 20px;
                        margin-bottom: 30px;
                    }
                    .tStyle tr {
                        border-bottom: 1px solid #eee;
                    }
                    .tStyle tr:last-child {
                        border: none;
                    }
                    .tStyle tr:nth-child(odd) {
                        background-color: 666666;
                    }
                    .tStyle th,
                    .tStyle td {
                        padding: 12px;
                        text-align: center;
                        color: FFFFFF;
                    }
                    .tStyle tr th {
                        background-color: 333333;
                        color: FFFFFF;
                    }
                    .tStyle tr th:first-child {
                        font-size: 22px;
                        color: crimson;
                        border-radius: 5px 0 0 0;
                    }
                    .tStyle tr th:last-child {
                        border-radius: 0 5px 0 0;
                    }
                    .tStyle tr td:first-child {
                        font-size: 22px;
                        color: FFFFFF;
                    }
                    .tStyle tr td:last-child {
                        font-weight: 500;
                    }
                </style>
            </head>

            <body>
                <div class="main">
                    <xsl:apply-templates select="root/information"/>
                    <hr/>
                    <xsl:apply-templates select="root/planets"/>
                    <hr/>
                    <xsl:apply-templates select="root/scientists"/>

                </div>
            </body>
        </html>
        
    </xsl:template>

    <!--정보-->
    <xsl:template match="root/information">
        <div class="main">

            <div>
                <h1 align="center">태양계</h1>
            </div>

            <div>
                <h2>
                    <xsl:value-of select="notice"/>는
                    <xsl:value-of select="since"/>로 만들어 졌다.
                </h2>
            </div>

            <xsl:for-each select="description">
                <div>
                    <h3>
                        <xsl:value-of select="."/>
                    </h3>
                </div>
            </xsl:for-each>
        
            <div align="center">
                <xsl:apply-templates select="./image"/>
            </div>

        </div>
    </xsl:template>

    <!--행성-->
    <xsl:template match="root/planets">
        <div class="main" align="center">
            <xsl:for-each select="planet">
                <div class="planetsub">
                    <h3 align="center"><xsl:value-of select="name[@nameType='Korean']"/><br/>
                    (<em><xsl:value-of select="translate(name[@nameType='English'],'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/></em>)</h3>
                    <div class="planet">
                        <xsl:choose>
                            <xsl:when test="name[.='mercury']">
                                <a href="https://ko.wikipedia.org/wiki/%EC%88%98%EC%84%B1"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='venus']">
                                <a href="https://ko.wikipedia.org/wiki/%EA%B8%88%EC%84%B1"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='earth']">
                                <a href="https://ko.wikipedia.org/wiki/%EC%A7%80%EA%B5%AC"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='mars']">
                                <a href="https://ko.wikipedia.org/wiki/%ED%99%94%EC%84%B1"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='jupiter']">
                                <a href="https://ko.wikipedia.org/wiki/%EB%AA%A9%EC%84%B1"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='saturn']">
                                <a href="https://ko.wikipedia.org/wiki/%ED%86%A0%EC%84%B1"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='uranus']">
                                <a href="https://ko.wikipedia.org/wiki/%EC%B2%9C%EC%99%95%EC%84%B1"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='neptune']">
                                <a href="https://ko.wikipedia.org/wiki/%ED%95%B4%EC%99%95%EC%84%B1"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='pluto']">
                                <a href="https://ko.wikipedia.org/wiki/%EB%AA%85%EC%99%95%EC%84%B1"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                        </xsl:choose>
                    </div>
                </div>
            </xsl:for-each>
            <hr/>
            <xsl:call-template name="planetsTable"/>
        </div>
    </xsl:template>

    <!--행성 표-->
    <xsl:template name="planetsTable">
        <div class="main" align="center">
            <table class="tStyle" align="center">
                <tr>
                    <th>행성</th>
                    <th>크기(지름)</th>
                    <th>태양과의 거리</th>
                    <th>자전주기</th>
                    <th>공전주기</th>
                </tr>

                <xsl:for-each select="planet">
                    <tr>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="format-number(diameter, ',###')"/>km</td>
                        <td><xsl:value-of select="format-number(distance, ',###')"/>km</td>
                        <td><xsl:value-of select="rotation_period"/>일</td>

                        <xsl:choose>
                            <xsl:when test="revolution_period[@timeType='days']">
                                <p><td><xsl:value-of select="revolution_period"/>일</td></p>
                            </xsl:when>
                            <xsl:when test="revolution_period[@timeType='years']">
                                <p><td><xsl:value-of select="revolution_period"/>년</td></p>
                            </xsl:when>
                        </xsl:choose>
                        
                    </tr>
                </xsl:for-each>
            </table>
        </div>
    </xsl:template>

    <!--과학자-->
    <xsl:template match="root/scientists">
        <xsl:for-each select="scientist">
            <div class="main">
                <xsl:choose>
                    <xsl:when test="position()mod2=1">
                        <div class="left">
                            <div><xsl:apply-templates select="./image"/></div>
                            <div class="name" align="center">
                                    <h2>[&#10;<xsl:value-of select="name[@nameType='Korean']"/>&#10;]<br/>
                                    (<xsl:value-of select="name[@nameType='English']"/>)</h2>
                            </div>
                        </div>

                        <div class="description">
                            <h2><xsl:value-of select="description"/></h2>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="right">
                            <div><xsl:apply-templates select="./image"/></div>
                            <div class="name" align="center">
                                    <h2>[&#10;<xsl:value-of select="name[@nameType='Korean']"/>&#10;]<br/>
                                    (<xsl:value-of select="name[@nameType='English']"/>)</h2>
                            </div>
                        </div>

                        <div class="description">
                            <h2 style="text-align: right"><xsl:value-of select="description"/></h2>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!--행성 이미지-->
    <xsl:template name="planetimage">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="image/@src"/>
            </xsl:attribute>

            <xsl:attribute name="width">
                <xsl:value-of select="ceiling(image/@width div 2.5)"/>
            </xsl:attribute>

            <xsl:attribute name="height">
                <xsl:value-of select="ceiling(image/@height div 2.5)"/>
            </xsl:attribute>
        </img>
    </xsl:template>

    <!--이미지-->
    <xsl:template match="image">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="./@src"/>
            </xsl:attribute>

            <xsl:attribute name="width">
                <xsl:value-of select="./@width"/>
            </xsl:attribute>

            <xsl:attribute name="height">
                <xsl:value-of select="./@height"/>
            </xsl:attribute>
        </img>
    </xsl:template>

</xsl:stylesheet>