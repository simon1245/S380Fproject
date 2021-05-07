<!DOCTYPE html>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" /> 
<fmt:setBundle basename="messages" />

<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <title><fmt:message key='menu.title'/></title>
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
        .w3-bar-block .w3-bar-item {padding:20px}
        h1 {letter-spacing: 6px}
        .menu {display: none}
        img {
            height: inherit;
            max-width: 90%
        }

    </style>
    <body>
        <!-- Navbar (sit on top) -->
        <div class="w3-top w3-hide-small">
            <div class="w3-bar w3-xlarge w3-dark-grey w3-opacity w3-hover-opacity-off" id="myNavbar">
                <a href="<c:url value="/menu" />" class="w3-bar-item w3-button"><fmt:message key='home'/></a>
                <a href="<c:url value="/menu/#menu" />" class="w3-bar-item w3-button"><fmt:message key='menu'/></a>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}"> 
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post">
                            <input type="submit" value="Log out" class="w3-bar-item w3-button w3-right w3-dark-grey w3-opacity w3-medium" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                            <a href="<c:url value="/user/edit/${pageContext.request.userPrincipal.name}" />"class="w3-bar-item w3-button w3-right w3-medium"><u>${pageContext.request.userPrincipal.name}</u></a>
                                </security:authorize>
                        <a href="<c:url value="/menu/viewcart" />" class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='viewCart'/></a>
                        <security:authorize access="hasRole('ADMIN')">
                            <a href="<c:url value="/user/manage" />"class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='manageUser'/></a>
                        </security:authorize>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="/login" />" class="w3-right w3-button w3-medium"><fmt:message key='login'/></a>
                        <a href="<c:url value="/user/Register/#reg" />" class="w3-right w3-button w3-medium"><fmt:message key='register'/></a>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test = "${language == 'en_US'}">  
                        <a href="<c:url value="/menu/zh-HK" />" class="w3-right w3-button w3-medium">中文</a>
                    </c:when>

                    <c:when test = "${language == 'zh_HK'}">  
                        <a href="<c:url value="/menu/en" />" class="w3-right w3-button w3-medium">English</a>
                    </c:when>
                </c:choose>

            </div>   
        </div>   
        <!-- Header with image -->
        <header class="w3-container w3-center w3-opacity" style="background-color:#D2CBC4; padding:128px 16px">
            <h1 class="w3-xlarge w3-text-black"><fmt:message key='menu.restaurant'/></h1>
            <h1 class="w3-text-black"><fmt:message key='menu.orderingSys'/></h1>
            <br>
            <p><a href="#menu" class="w3-button w3-large w3-black"><fmt:message key='menu.letMeSee'/></a></p>
        </div>
    </header>

    <!-- Menu Container -->
    <div class="w3-container w3-white w3-padding-64 w3-large" id="menu">
        <div class="w3-content">
            <h1 class="w3-center w3-xxxlarge w3-text-brown" style="margin-bottom:64px"><fmt:message key='menu.menuName'/></h1>
            <div class="w3-row w3-center w3-border w3-border-brown ">
                <security:authorize access="hasRole('ADMIN')">
                    <a href="<c:url value="/menu/create" />" class="w3-right w3-btn w3-dark-grey w3-round-large w3-medium" style=" margin: 10px;"><fmt:message key='menu.description'/></a>
                </security:authorize>
                <a href="<c:url value="/menu/viewcart"/>" class="w3-right w3-btn w3-round-large w3-medium" style="background-color:#cbbeb5; margin: 10px;"><fmt:message key='menu.viewCart'/></a><br><br>
                <c:choose>
                    <c:when test="${fn:length(menus) == 0}">
                        <h3 class="w3-center"><fmt:message key='menu.noMenu'/></h3>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${menus}" var="menu" varStatus="loop">
                            <c:if test="${(loop.index) ==0 || (loop.index)%4==0}">
                                <div class="w3-row-padding w3-padding-16 w3-center">
                                    <c:set var= "close" value= "${loop.index+3}" />
                                </c:if>
                                <div class="w3-quarter w3-cell">
                                    <c:set var= "count" value= "0" />
                                    <c:forEach items="${images}" var="image">
                                        <c:if test="${count==0}">
                                            <c:if test="${image.food_id == menu.food_id}">
                                                <img src="data:image/jpg;base64,${image.base64img}" alt="No image" style="width:85%"/>
                                                <c:set var= "count" value= "1" />
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${count==0}"> 
                                        <img src=""  style="width:85%">
                                    </c:if>
                                    <h2><b class="w3-xlarge w3-text-brown">${menu.name}</b></h2>
                                    <i class="w3-small w3-text-dark_grey">${menu.description}</i><p></p>
                                    <b class="w3-large w3-text-brown ">HKD ${menu.price}</b><p></P>
                                    <a href="<c:url value="/menu/view/${menu.food_id}" />" class=" w3-large w3-btn w3-dark-grey w3-round-large w3-center" style="margin-bottom:10px"><fmt:message key='menu.viewMore'/></a> 
                                    <br>
                                    <c:choose>
                                        <c:when test="${menu.available}">
                                            <a href="<c:url value="/menu/addtoCart">
                                                   <c:param name="food_Id" value="${menu.food_id}" />
                                               </c:url>"><fmt:message key='menu.addToCart'/></a>
                                        </c:when>    
                                        <c:otherwise>
                                            <p class="w3-text-dark-grey w3-large" style="text-shadow:1px 1px 0 #444"><fmt:message key='menu.soldOut'/></p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <c:if test="${(loop.index) == close }">
                                </div>  
                            </c:if>    
                        </c:forEach>

                    </c:otherwise>
                </c:choose>

            </div></div></div>
    <br><br>
    <!-- Footer -->
    <footer class="w3-container w3-dark-grey" style="padding:32px">
        <a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom"> <fmt:message key='menu.to_the_top'/></a>
    </footer>               
</body>

</html>