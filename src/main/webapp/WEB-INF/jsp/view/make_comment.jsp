<!DOCTYPE html>
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <title>Comment on #${menu.food_id} -Food Ordering System</title>
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
        <div class="w3-container w3-white w3-padding-64 w3-large">
          <div class="w3-content">
              <h1>Comment on #${menu.food_id}</h1>
               <div class="w3-row  w3-border w3-border-brown w3-container w3-padding-16">
                <form:form method="POST" enctype="multipart/form-data"
                           modelAttribute="CommentForm">
                    <h3><b>Food ID:  </b><i>#${menu.food_id}</i></h3>
                    <h3><b>Food Name: </b><i>${menu.name}</i></h3>   <br />
                    <form:label path="detail"><h3><b>Comments:</b></h3></form:label>
                    <form:textarea path="detail" rows="5" cols="30"  style="width:80%"/><br /><br />
                    <input type="submit" value="Submit" class="w3-btn w3-round-large" style="background-color:#cbbeb5"/>
                </form:form>
                </div>
               <br>
               <a href="<c:url value="/menu" />" class="w3-btn w3-light-grey w3-right w3-round-large" style=" margin-left:10px;" >Return to Menu List</a>
               <a href="<c:url value="/menu/view/${menu.food_id}" />" class="w3-btn w3-dark-grey w3-right w3-round-large w3-opacity w3-hover-opacity-off" >Return to #${menu.food_id}'s Details </a>
               </div>
        </div>  
    </body>
</html>
