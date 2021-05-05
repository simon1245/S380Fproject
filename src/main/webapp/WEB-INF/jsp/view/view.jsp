<!DOCTYPE html>
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <title>Details of #${menu.food_id} -Food Ordering System</title>
    <style>
    body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
    .w3-bar-block .w3-bar-item {padding:20px}
    h1,h2,h3 {letter-spacing: 3px}
    .menu {display: none}
    p {margin-bottom: 40px;margin-left: 20px}
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
              <div class="w3-row">
                  <div class="w3-threequarter">
                      <h2 style="padding-top:20px"><b><c:out value="${menu.name}" />(#${menu.food_id})</b></h2>
                  </div>
                  <div class="w3-quarter">
                    <security:authorize access="hasRole('ADMIN')">
                        <a href="<c:url value="/menu/delete/${menu.food_id}" />" class="w3-right w3-btn w3-dark-grey w3-round-large w3-center" style=" margin: 10px;">Delete</a>
                    </security:authorize>  
                    <security:authorize access="hasRole('ADMIN')">
                        <a href="<c:url value="/menu/edit/${menu.food_id}" />" class="w3-right w3-btn w3-left w3-round-large" style="background-color:#D2CBC4;margin: 10px;">Edit</a> 
                    </security:authorize>
                   </div>
                </div>
                <div class="w3-row w3-border w3-border-brown w3-container w3-padding-32 ">
                    <div class="w3-row" style="margin-bottom:10px">
                        <div class="w3-threequarter">
                            <b class="w3-xlarge" ">Food Name : </b>
                            <p><i class="w3-large"><c:out value="${menu.name}" /></i></p>
                        </div>
                        <div class="w3-quarter">
                            <a href="<c:url value="/menu/addtoCart"><c:param name="food_Id" value="${menu.food_id}" /></c:url>" class="w3-right w3-btn w3-left w3-round-large w3-brown">Add to cart</a>
                    </div></div>   
                    <b class="w3-xlarge">Price: </b>
                    <p><i class="w3-large">HKD <c:out value="${menu.price}" /></i></p>
                    <b class="w3-xlarge">Available now? </b>
                    <p><i class="w3-large">
                        <c:choose>
                            <c:when test="${menu.available}">
                                Yes
                            </c:when>
                            <c:otherwise>
                                No
                            </c:otherwise>
                        </c:choose></i></p>
                    <b class="w3-xlarge">Desciption :</b>
                    <p><i class="w3-large"><c:out value="${menu.description}" /></i></p>
                    <c:if test="${fn:length(menu.attachments) > 0}">
                        <br>
                        <c:forEach items="${images}" var="image" >
                            <img src="data:image/jpg;base64,${image.base64img}" alt="No image" height="" width="200" style="padding:5px"/>
                        </c:forEach>
                            <br>
                    </c:if>
                </div>
                <br>
                <div class="w3-row w3-border w3-border-brown w3-container w3-padding-24 ">
                    <div class="w3-row">
                           <div class="w3-threequarter">
                               <h3 ><b>Comment :      </b><h2>    
                            </div>
                            <div class="w3-quarter">
                                <a href="<c:url value="/menu/make_comment/${menu.food_id}" />" class="w3-right w3-btn w3-left w3-round-large w3-black">Make Comment</a>
                        </div></div>
                        <c:choose>
                            <c:when test="${fn:length(comments) == 0}">
                                <h4 class="w3-center"> Opps !There are no comment in the system.</h4>
                            </c:when>
                            <c:otherwise>
                                 <table class="w3-table  w3-bordered w3-hoverable">
                                    <tr class="w3-large ">
                                        <th width="10%">Comment </th>
                                        <th width="30%">Commented by</th>
                                        <th  width="60%">Detail</th>
                                    </tr>
                                    <c:set var= "count" value= "0" />
                                    <c:forEach  items="${comments}" var="comment">
                                        <tr>
                                            <th width="20%"># ${count} </td>
                                            <td width="30%">${comment.username}</td>
                                            <td width="50%"><i>${comment.detail}</i></td>
                                        </tr>  
                                    </c:forEach>
                                 </table>     
                            </c:otherwise>
                       </c:choose> 
                  </div>
                <br>
                <a href="<c:url value="/menu" />" class="w3-btn w3-dark-grey w3-right w3-round-large w3-large">Return to Menu List</a>
                </div>
            </div>      
    </body>
</html>
