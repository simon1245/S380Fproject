<!DOCTYPE html>
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <title>Users Management -Food Ordering System</title>
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
         <!-- header -->       
        <header class="w3-container w3-center w3-opacity" style="background-color:#D2CBC4; padding:128px 16px">
            <h1 class="w3-xlarge w3-text-black">FOOD RESTAURANT</h1>
            <h1 class="w3-text-black">Online Ordering System</h1>
            <br>
            <p><a href="<c:url value="/menu/#menu" />" class="w3-button w3-large w3-black">Let me see the menu</a></p>
          </div>
        </header>
         
        
        <!-- content-->
         <div class=""w3-container w3-white w3-padding-64 w3-large" id="create" >
          <div class="w3-content">
              <div class="w3-row" style="padding-top:24px">
                  <div class="w3-threequarter">
                       <h1 >Users Management</h1>
                  </div>
                  <div class="w3-quarter">
                    <a  style="margin-top:15px" href="<c:url value="/user/Register" />" class="w3-btn w3-right w3-round-large w3-brown" >Create a User</a>
                  </div></div>
        <br>
        <div class="w3-row w3-border w3-border-brown w3-container w3-padding-32">
        <c:choose>
            <c:when test="${fn:length(webUsers) == 0}">
                <h3 class="w3-center">Opps! There are no users in the system.</h3>
            </c:when>
            <c:otherwise>
                    <table class="w3-table w3-bordered w3-hoverable">
                    <tr class="w3-large ">
                        <th>Username</th><th>Password</th><th>Roles</th><th>Action</th>
                    </tr>
                    <c:forEach items="${webUsers}" var="user">
                        <tr>
                            <td>${user.username}</td><td>${user.password}</td>
                            <td>
                                <c:forEach items="${user.roles}" var="role" varStatus="status">
                                    <c:if test="${!status.first}">, </c:if>
                                    <c:choose>
                                        <c:when test="${role.role eq'ROLE_USER'}"> 
                                            <span class="w3-tag  w3-round" style="background-color:#cbbeb5">${role.role}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="w3-tag w3-round" style="background-color:#DA9FA8;" >${role.role}</span>
                                        </c:otherwise>
                                        </c:choose>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="<c:url value="/user/delete/${user.username}" />" class="w3-btn w3-dark-grey w3-round-large w3-center">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                    
            </c:otherwise>
        </c:choose>
               
        </div> </div></div>  
         <br><br>
        <!-- Footer -->
        <footer class="w3-container w3-dark-grey" style="padding:32px">
          <a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom"> ^ To the top</a>
        </footer>               
    </body>
    </body>
</html>
