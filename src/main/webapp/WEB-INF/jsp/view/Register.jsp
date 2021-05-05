<!DOCTYPE html>
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <title>Regisration -Food Ordering System</title>
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
                <a href="<c:url value="/menu" />" class="w3-bar-item w3-button">HOME</a>
                <a href="<c:url value="/menu/#menu" />" class="w3-bar-item w3-button">Menu</a>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}"> 
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post">
                            <input type="submit" value="Log out" class="w3-bar-item w3-button w3-right w3-dark-grey w3-opacity w3-medium" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <security:authorize access="hasRole('ADMIN')">
                            <a href="<c:url value="/user/manage" />"class="w3-bar-item w3-button w3-right w3-medium">Manage User</a>
                        </security:authorize>
                       <a href="<c:url value="/menu/viewcart" />" class="w3-bar-item w3-button w3-right w3-medium">View cart</a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="/login" />" class="w3-right w3-button w3-medium">Login</a>
                        <a href="<c:url value="/user/Register" />" class="w3-right w3-button w3-medium">Register</a>
                    </c:otherwise>
                    </c:choose>
                </div>   
            </div>   
         

        <!-- content-->
         <div class="w3-container w3-white w3-padding-64 w3-large" id="reg" >
          <div class="w3-content">
          <h1 style="padding-top:20px">Register</h1>
        <security:authorize access="!hasRole('ADMIN')">
            <h4 style="margin-bottom:30px">If you already have a account, click <a href="<c:url value="/login" />">here</a> to log in!</h4>
        </security:authorize>
       <div class="w3-row  w3-border w3-border-brown w3-container w3-padding-32">
            <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="webUser">
            <form:label path="username"  class="w3-large">Username: </form:label><br/>
            <form:input type="text" path="username" class="w3-input" style="width:70%"  /><br/><br/>
            <form:label path="password"  class="w3-large">Password:</form:label><br/>
            <form:input type="password"  path="password" class="w3-input" style="width:70%"  /><br/><br/>         
            <security:authorize access="hasRole('ADMIN')">
                <form:label path="roles" class="w3-large">Roles:</form:label><br/>
                <form:checkbox path="roles" value="ROLE_USER" checked="true" class="w3-check"/>ROLE_USER
                <form:checkbox path="roles" value="ROLE_ADMIN"  class="w3-check" style="margin-left:10px"/>ROLE_ADMIN
            </security:authorize>   

            <br /><br />
            <input type="submit" value="Register" class="w3-btn w3-left w3-round-large" style="background-color:#cbbeb5;width: 150px"/><br>
        </form:form>
        <br>
        </div>
        <br>
        <a href="<c:url value="/menu" />" class="w3-btn w3-light-grey w3-right w3-round-large" >Return to Menu List</a>
        </div></div>
    </body>
</html>
