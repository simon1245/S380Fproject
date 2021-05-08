<!DOCTYPE html>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" /> 
<fmt:setBundle basename="messages" />
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <title><fmt:message key='edit.titleHEAD'/>${menu.food_id} - <fmt:message key='create.title'/></title>
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
        .w3-bar-block .w3-bar-item {padding:20px}
        h1,h2,h3 {letter-spacing: 3px}
        .menu {display: none}
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
                            <input type="submit" value="<fmt:message key='logOutButton'/>" class="w3-bar-item w3-button w3-right w3-dark-grey w3-opacity w3-medium" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                            <a href="<c:url value="/user/edit_user/${pageContext.request.userPrincipal.name}" />"class="w3-bar-item w3-button w3-right w3-medium"><u>${pageContext.request.userPrincipal.name}</u></a>
                                </security:authorize>
                        <a href="<c:url value="/menu/viewcart" />" class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='viewCart'/></a>
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
                        <a href="<c:url value="/edit_menu/zh-HK" />" class="w3-right w3-button w3-medium">中文</a>
                    </c:when>

                    <c:when test = "${language == 'zh_HK'}">  
                        <a href="<c:url value="/edit_menu/en" />" class="w3-right w3-button w3-medium">English</a>
                    </c:when>

                </c:choose>
            </div>   
        </div>   
        <!-- content-->
        <div class="w3-container w3-white w3-padding-64 w3-large">
            <div class="w3-content">
                <h1><fmt:message key='edit.titleHEAD'/>${menu.name}</h1>
                <div class="w3-row  w3-border w3-border-brown w3-container w3-padding-32">
                    <form:form method="POST" enctype="multipart/form-data"
                               modelAttribute="MenuForm">   
                        <form:label path="foodname" class="w3-xlarge"><b><fmt:message key='edit.foodName'/>:</b></form:label><br />
                        <form:input type="text" path="foodname" class="w3-input" style="width:80%"/><br /><br />
                        <form:label path="price" class="w3-xlarge"><b><fmt:message key='edit.price'/>:</b></form:label><br />
                        <form:input path="price" rows="5" cols="30" class="w3-input" style="width:80%" /><br /><br />
                        <form:label path="description" class="w3-xlarge"><b><fmt:message key='edit.description'/>:</b></form:label><br />
                        <form:textarea path="description" rows="5" cols="30" style="width:80%" /><br /><br />
                        <span class="w3-xlarge" style="margin-right: 20px"><b><fmt:message key='edit.avail'/>:</b></span><form:checkbox path="available" value="true"  class="w3-check"/><br />
                        <c:if test="${fn:length(menu.attachments) > 0}">
                            <span class="w3-xlarge" style="margin-bottom: 20px"> <b><fmt:message key='edit.attachments'/>:</b></span><br/>
                            <ul>
                                <c:forEach items="${menu.attachments}" var="attachment">
                                    <li>
                                        <c:out value="${attachment.name}" />
                                        [<a href="<c:url
                                                value="/menu/delete/${menu.food_id}/${attachment.name}"
                                                />"><fmt:message key='edit_menu.delete'/></a>]
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:if>
                        <br>
                        <span class="w3-xlarge" style="margin-bottom: 20px"><b><fmt:message key='edit.addAttachment'/>:</b></span><br />
                        <input type="file" name="attachments" multiple="multiple"/><br/><br/>
                        <input type="submit" value="<fmt:message key='edit.save'/>"class="w3-btn w3-left w3-round-large" style="background-color:#cbbeb5;width:100px;"/><br/><br/>
                    </form:form>
                </div>
                <br>
                <a href="<c:url value="/menu" />" class="w3-btn w3-dark-grey w3-right w3-round-large w3-large" style=" margin-left:10px;"><fmt:message key='backToMenuList'/></a>
                <a href="<c:url value="/menu/view/${menu.food_id}" />" class="w3-btn w3-dark-grey w3-right w3-round-large w3-opacity w3-hover-opacity-off" ><fmt:message key='comment.returnHead'/>${menu.name}<fmt:message key='comment.returnTail'/> </a>
            </div></div>
    </body>
</html>