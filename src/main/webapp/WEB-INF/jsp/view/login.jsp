<!DOCTYPE html>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" /> 
<fmt:setBundle basename="messages" />

<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <title><fmt:message key='login.title'/></title>
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
        .w3-bar-block .w3-bar-item {padding:20px}
        h1 {letter-spacing: 6px}
        .menu {display: none}
    </style>
    <body>
        <!-- Navbar (sit on top) -->
        <div class="w3-top w3-hide-small">
            <div class="w3-bar w3-xlarge w3-dark-grey w3-opacity w3-hover-opacity-off" id="myNavbar">
                <a href="<c:url value="/menu"  /> " class="w3-bar-item w3-button"><fmt:message key='home'/></a>
                <a href="<c:url value="/menu/#menu" />" class="w3-bar-item w3-button"><fmt:message key='menu'/></a>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}"> 
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post">
                            <input type="submit" value="Log out" class="w3-bar-item w3-button w3-right w3-dark-grey w3-opacity w3-medium" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <security:authorize access="hasRole('ADMIN')">
                            <a href="<c:url value="/user/manage" />" class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='login.manageUser'/></a>
                        </security:authorize>
                        <a href="<c:url value="/menu/viewcart" />" class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='login.viewCart'/></a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="/login" />" class="w3-right w3-button w3-medium"><fmt:message key='login.login'/></a>
                        <a href="<c:url value="/user/Register" />" class="w3-right w3-button w3-medium"><fmt:message key='login.register'/></a>
                    </c:otherwise>
                </c:choose>

                <c:choose>

                    <c:when test = "${language == 'en_US'}">  
                        <a href="<c:url value="/login/zh-HK" />" class="w3-right w3-button w3-medium">中文</a>
                    </c:when>

                    <c:when test = "${language == 'zh_HK'}">  
                        <a href="<c:url value="/login/en" />" class="w3-right w3-button w3-medium">English</a>
                    </c:when>

                </c:choose>

            </div>   
        </div>   
        <!-- content-->

        <div class="w3-container w3-white w3-padding-64 w3-large" >
            <div class="w3-content">                
                <c:if test="${param.error != null}">
                    <div class="w3-container w3-brown w3-opacity">
                        <p><fmt:message key='login.loginFailure'/></p>
                    </div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="w3-container w3-sand w3-opacity">
                        <p><fmt:message key='login.logout'/></p>
                    </div>
                </c:if>
                <h1 style="padding-top:20px"><fmt:message key='login.description'/></h1>
                <security:authorize access="!hasRole('USER') and !hasRole('ADMIN')">            
                    <h4 style="margin-bottom:30px"><fmt:message key='login.descriptionHead'/> &nbsp <a href="<c:url value="/user/Register" />"> <fmt:message key='login.descriptionBody'/></a> &nbsp <fmt:message key='login.descriptionTail'/></h4>
                    <div class="w3-row  w3-border w3-border-brown w3-container w3-padding-32">
                        <form method="POST" enctype="multipart/form-data"  modelAttribute="webUser">
                            <label for="username" class="w3-large"><fmt:message key='login.username'/>:</label><br/>
                            <input type="text" id="username" name="username" class="w3-input" style="width:80%"/><br/><br/>
                            <label for="password" class="w3-large"><fmt:message key='login.password'/>:</label><br/>
                            <input type="password" id="password" name="password" class="w3-input" style="width:80%"/><br/><br/>
                            <input type="checkbox" id="remember-me" name="remember-me" class="w3-check"  />
                            <label for="remember-me" class="w3-large"><fmt:message key='login.rememberMe'/></label><br/><br/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <br>
                            <input type="submit" value="<fmt:message key='login.login'/> " class="w3-btn w3-left w3-round-large" style="background-color:#cbbeb5;width:150px " /><br>
                        </form>
                    </security:authorize>      
                    <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                        <fmt:message key='login.logged_in'/> <br>
                    </security:authorize>
                    <br>
                </div>
                <br>
                <a href="<c:url value="/menu" />" class="w3-btn w3-light-grey w3-right w3-round-large" ><fmt:message key='login.backToMenuList'/></a>
            </div>
        </div>
    </body>
</html>
