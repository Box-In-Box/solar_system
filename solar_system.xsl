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
                    h1, h2, h3, h4, h5, h6, p { color: FFFFFF; }

                    a {
                        color: red;
                        text-decoration: none;
                    }

                    .mainText {
                        font-size: 350%;
                    }
                    .logoText {
                        font-size: 300%;
                    }
                    .scientistText {
                        color: 111111;
                    }

                    <!--Logo-->
                    .logo {
                        margin: 0;
                        margin-left: 20px;
                    }
                    .logoName {
                        display: inline-block;
                        text-align: center;
                        vertical-align: bottom;
                    }
                    
                    <!--Maue-->
                    .menu {
                        width: 800px;
                        overflow: hidden;
                        position: absolute;
                        left: 50%;
                        margin-left:-450px;
                        padding-top: 30px;
                    }
                    .meueDiv {
                        padding-bottom: 100px;
                        align: center;
                    }

                    .menu > li {
                        width: 20%;
                        float: left;
                        text-align: center;
                        line-height: 40px;
                        font-size: 30px;
                    }

                    .menu > li:hover {
                        background-color: #333333;
                        transition-duration: 0.5s;
                    }

                    <!--div-->
                    div { 
                        margin : 10px;   
                    }
                    .main {
                        margin : 20px;
                        overflow:auto;
                    }
                    .left {
                        float: left;
                    }
                    .right {
                        float: right;
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

                    <!--scientist-->
                    .name {
                        padding-top: 1px;
                        padding-bottom: 1px;
                        background: FFFFFF;
                        border-radius: 50%;
                    }
                    .scientist {
                        margin : 0;
                    }
                    .noMargin {
                        margin-bottom: 100px;
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
                <div class="meueDiv">
                    <xsl:call-template name="meue"/>
                </div>
                <div class="main">
                    <xsl:apply-templates select="root/information"/>
                    <hr/>
                    <xsl:apply-templates select="root/planets"/>
                    <hr/>
                    <xsl:apply-templates select="root/scientists"/>
                    <hr/>
                    <xsl:apply-templates select="root/information/links"/>
                    <hr/>
                    <h3>2022_XML_PROJECT</h3>
                </div>
            </body>
        </html>
        
    </xsl:template>

    <!--메뉴-->
    <xsl:template name="meue">
        <div class="left logo">
            <xsl:apply-templates select="root/information/image[@id='logo']"/>
        </div>

        <div class="logoName">
            <h1 class="logoText">BW_solar_system</h1>
        </div>

        <div align="center" >
                <h1 class="mainText">
                    태양계 정리
                </h1>
            </div>
        
        <ul class="menu">
            <li>
                <a href="#Infomation">태양계</a>
            </li>
            <li>
                <a href="#Planets">행성</a>
            </li>
            <li>
                <a href="#PlanetsTable">행성표</a>
            </li>
            <li>
                <a href="#Scientists">과학자</a>
            </li>
            <li>
                <a href="#Links">링크</a>
            </li>
        </ul>
    </xsl:template>

    <!--정보-->
    <xsl:template match="root/information">
        <a name="Infomation"></a>
        <div class="main">
            <div align="center">
                <h2>
                    <xsl:value-of select="notice"/>는
                    <xsl:value-of select="since"/>로 만들어 졌으며,
                </h2>
            </div>

            <xsl:for-each select="description">
                <div class="description" align="center">
                    <h2><xsl:value-of select="."/></h2>
                </div>
            </xsl:for-each>
        
            <div align="center">
                <xsl:apply-templates select="./image[@id='system']"/>
            </div>
        </div>
    </xsl:template>

    <!--행성-->
    <xsl:template match="root/planets">
        <a name="Planets"></a>
        <div class="main" align="center">
            <xsl:for-each select="planet">
                <div class="planetsub">
                    <h3 align="center"><xsl:value-of select="name[@nameType='Korean']"/><br/>
                    (<em><xsl:value-of select="translate(name[@nameType='English'],'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/></em>)</h3>
                    <div class="planet">
                        <xsl:choose>
                            <xsl:when test="name[.='mercury']">
                                <a href="https://astro.kasi.re.kr/learning/pageView/5133"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='venus']">
                                <a href="https://astro.kasi.re.kr/learning/pageView/5135"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='earth']">
                                <a href="https://astro.kasi.re.kr/learning/pageView/5138"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='mars']">
                                <a href="https://astro.kasi.re.kr/learning/pageView/5145"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='jupiter']">
                                <a href="https://astro.kasi.re.kr/learning/pageView/5148"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='saturn']">
                                <a href="https://astro.kasi.re.kr/learning/pageView/5152"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='uranus']">
                                <a href="https://astro.kasi.re.kr/learning/pageView/5157"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                            <xsl:when test="name[.='neptune']">
                                <a href="https://astro.kasi.re.kr/learning/pageView/5161"><xsl:call-template name="planetimage"/></a>
                            </xsl:when>
                        </xsl:choose>
                    </div>
                </div>
            </xsl:for-each>    
        </div>

        <hr/>
        <xsl:call-template name="planetsTable"/>
    </xsl:template>

    <!--행성 표-->
    <xsl:template name="planetsTable">
        <a name="PlanetsTable"></a>
        <h1 class="main">&lt; 행성들 특징 &gt;</h1>
        <div class="main">
            <xsl:for-each select="planet">
                <h3>ㆍ<xsl:value-of select="name[@nameType='Korean']"/> : <xsl:value-of select="description"/></h3>
            </xsl:for-each>
        </div>
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
        <a name="Scientists"></a>
        <xsl:for-each select="scientist">
            <div class="main scientist">
                <xsl:choose>
                    <xsl:when test="position()mod2=1">
                        <div class="left">
                            <div><xsl:apply-templates select="./image"/></div>
                            <div class="name" align="center">
                                    <h2 class="scientistText">[&#10;<xsl:value-of select="name[@nameType='Korean']"/>&#10;]<br/>
                                    (<xsl:value-of select="name[@nameType='English']"/>)</h2>
                            </div>
                        </div>

                        <div class="description">
                            <h2><xsl:value-of select="description"/></h2>
                            <div class="noMargin" align="center"><xsl:apply-templates select="./subImg/image"/></div>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="right">
                            <div><xsl:apply-templates select="./image"/></div>
                            <div class="name" align="center">
                                    <h2 class="scientistText">[&#10;<xsl:value-of select="name[@nameType='Korean']"/>&#10;]<br/>
                                    (<xsl:value-of select="name[@nameType='English']"/>)</h2>
                            </div>
                        </div>

                        <div class="description">
                            <h2 style="text-align: right"><xsl:value-of select="description"/></h2>
                            <div class="noMargin" align="center"><xsl:apply-templates select="./subImg/image"/></div>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="root/information/links">
        <a name="Links"></a>
        <div class="main">
            <h1>Links</h1>
            <xsl:for-each select="link">
                    <xsl:choose>
                        <xsl:when test="@name='우주의 끝을 찾아서'">
                                <h2>ㆍ<a href="https://www.youtube.com/watch?v=hFKe4ovOJVQ&amp;list=WL&amp;index=7"><xsl:value-of select="./@name"/></a> - <xsl:value-of select="."/></h2>
                        </xsl:when>
                        <xsl:when test="@name='태양계 행성 순서'">
                                <h2>ㆍ<a href="https://blog.naver.com/skydh_no1/222884790903"><xsl:value-of select="./@name"/></a> - <xsl:value-of select="."/></h2>
                        </xsl:when>
                        <xsl:when test="@name='태양계 정리'">
                                <h2>ㆍ<a href="https://m.blog.naver.com/jsy945/220893963552"><xsl:value-of select="./@name"/></a> - <xsl:value-of select="."/></h2>
                        </xsl:when>
                        <xsl:when test="@name='한국천문연구원'">
                                <h2>ㆍ<a href="https://astro.kasi.re.kr/index"><xsl:value-of select="./@name"/></a> - <xsl:value-of select="."/></h2>
                        </xsl:when>
                    </xsl:choose>       
            </xsl:for-each>
        </div>
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