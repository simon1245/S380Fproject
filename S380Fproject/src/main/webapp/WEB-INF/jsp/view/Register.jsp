<!DOCTYPE html>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" /> 
<fmt:setBundle basename="messages" />
<html>
    <title><fmt:message key='register.title'/> - <fmt:message key='view.title'/></title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
        .w3-bar-block .w3-bar-item {padding:20px}
        h1 {letter-spacing: 6px}
        .menu {display: none}
        .star {
            color:#b30000;
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
                        <a href="<c:url value="/menu/viewcart" />" class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='viewCart'/></a>
                        <a href="<c:url value="/menu/vieworders" />" class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='viewOrder'/></a>
                        <security:authorize access="hasRole('ADMIN')">
                            <a href="<c:url value="/user/manage_user" />"class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='manageUser'/></a>
                            <a href="<c:url value="/menu/manage_menu" />"class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='manageMenu'/></a>
                        </security:authorize>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="/login" />" class="w3-right w3-button w3-medium"><fmt:message key='login'/></a>
                        <a href="<c:url value="/user/Register" />" class="w3-right w3-button w3-medium"><fmt:message key='register'/></a>
                    </c:otherwise>
                </c:choose>

                <c:choose>

                    <c:when test = "${language == 'en_US'}">  
                        <a href="<c:url value="/Register/zh-HK" />" class="w3-right w3-button w3-medium">??????</a>
                    </c:when>

                    <c:when test = "${language == 'zh_HK'}">  
                        <a href="<c:url value="/Register/en" />" class="w3-right w3-button w3-medium">English</a>
                    </c:when>

                </c:choose>
            </div>   
        </div>   


        <!-- content-->
        <div class="w3-container w3-white w3-padding-64 w3-large" id="reg" >
            <div class="w3-content">
                <h1 style="padding-top:20px"><fmt:message key='register'/></h1>
                <security:authorize access="!hasRole('ADMIN')">
                    <h4 style="margin-bottom:30px"><fmt:message key='register.descriptionHead'/> &nbsp<a href="<c:url value="/login" />"><fmt:message key='register.descriptionBody'/></a> &nbsp<fmt:message key='register.descriptionTail'/></h4>
                </security:authorize>
                <div class="w3-row  w3-border w3-border-brown w3-container w3-padding-32">
                    <form:form method="POST" enctype="multipart/form-data"
                               modelAttribute="webUser" autocomplete="nope">
                        <c:if test="${webUser.error_msg != null}">
                            Error Messages: ${webUser.error_msg}<br><br>
                        </c:if>
                        <form:label path="username"  class="w3-large"><span class="star">*</span><fmt:message key='register.username'/>: </form:label><br/>
                        <form:input type="text" path="username"  required="required"  class="w3-input" style="width:70%" autocomplete="new-User Name"  /><br/><br/>
                        <form:label path="password"  class="w3-large"><span class="star">*</span><fmt:message key='register.password'/>:</form:label><br/>
                        <form:input type="password"  path="password" autocomplete="new-password" required="required"   placeholder="Please input at least 8 character password" class="w3-input" style="width:70%"  /><br/><br/> 
                        <form:label path="confirm_password"  class="w3-large"><span class="star">*</span><fmt:message key='register.confirm_password'/>:</form:label><br/>
                        <form:input type="password"  path="confirm_password" required="required"  class="w3-input" style="width:70%"  /><br/><br/> 
                        <form:label path="full_name"  class="w3-large"><span class="star">*</span><fmt:message key='register.full_name'/>:</form:label><br/>
                        <form:input type="text"  path="full_name"  required="required" placeholder="Please input your fullname"  class="w3-input" style="width:70%"   /><br/><br/>
                        <form:label path="phone"  class="w3-large"><span class="star">*</span><fmt:message key='register.phone'/>:</form:label><br/>
                        <form:input type="tel"  path="phone"  required="required" pattern="^\d{8}$" placeholder="Please input an 8-digit number"   class="w3-input" style="width:70%"   /><br/><br/>
                        <form:label path="address"  class="w3-large"><span class="star">*</span><fmt:message key='register.address'/>:</form:label><br/>
                        <form:input type="text"  path="address"  required="required" placeholder="Please input a valid address"  class="w3-input" style="width:70%"  /><br/><br/>
                        <security:authorize access="hasRole('ADMIN')">
                            <form:label path="roles" class="w3-large"><fmt:message key='register.roles'/>:</form:label><br/>
                            <form:radiobutton  path="roles" value="ROLE_USER"  checked="checked" class="w3-check"/><fmt:message key='register.role_user'/>
                            <form:radiobutton  path="roles" value="ROLE_ADMIN"  class="w3-check" style="margin-left:10px"/><fmt:message key='register.role_admin'/>
                        </security:authorize>   
                        <security:authorize access="!hasRole('ADMIN')">
                            <form:checkbox style="display:none" path="roles" value="ROLE_USER" checked="true"   class="w3-check"/>
                        </security:authorize>

                        <br /><br />
                        <input name="submit" id="submit" type="submit" value="<fmt:message key='login.register'/>" class="w3-btn w3-left w3-round-large" style="background-color:#cbbeb5;width: 150px"/><br>
                    </form:form>
                    <br>
                </div>
                <br>
                <a href="<c:url value="/menu" />" class="w3-btn w3-light-grey w3-right w3-round-large" ><fmt:message key='backToMenuList'/></a>
            </div>
        </div>
    </body>

</html>
