<!DOCTYPE html>
<html>
    <head>
        <title>Food Ordering System</title>
    </head>
    <body>

        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
                <c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post">
                    <input type="submit" value="Log out" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="/login" />">Login</a>
            </c:otherwise>
        </c:choose>

        <h2>Food ID#${menu.food_id}: <c:out value="${menu.name}" /></h2>
        <security:authorize access="hasRole('ADMIN')">
            [<a href="<c:url value="/menu/edit/${menu.food_id}" />">Edit</a>]
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">
            [<a href="<c:url value="/menu/delete/${menu.food_id}" />">Delete</a>]
        </security:authorize>   
        <br /><br />
        <i>Food Name : <c:out value="${menu.name}" /></i><br /><br />
        <i>Price: <c:out value="${menu.price}" /></i><br /><br />
        <i>Available now? 
            <c:choose>
                <c:when test="${menu.available}">
                    Yes
                </c:when>
                <c:otherwise>
                    No
                </c:otherwise>
            </c:choose></i><br /><br />
        <i>Desciption :</i>
        <c:out value="${menu.description}" /><br /><br />
        <c:if test="${fn:length(menu.attachments) > 0}">
            <br>
            <c:forEach items="${images}" var="image" >
                <img src="data:image/jpg;base64,${image.base64img}" alt="No image" height="" width="200"/>
            </c:forEach>


            <br /><br />
        </c:if>
        <a href="<c:url value="/menu/addtoCart">
               <c:param name="food_Id" value="${menu.food_id}" />
           </c:url>">Add to cart</a><br>

        <a href="<c:url value="/menu" />">Return to Menu List</a><br />

        <h2>Comment :      <h2>        
                <h5> <a href="<c:url value="/menu/make_comment/${menu.food_id}" />">Make Comment</a></h5>
                <c:choose>
                    <c:when test="${fn:length(comments) == 0}">
                        <i>There are no comment in the system.</i>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <tr>
                                <th>Comment </th>
                                <th>Detail</th>
                                <th>Commented by</th>
                            </tr>
                            <c:set var= "count" value= "0" />
                            <c:forEach  items="${comments}" var="comment">
                                <tr>
                                    <th># ${count} </th>
                                    <th>${comment.detail}</th>
                                    <th>${comment.username}</th>
                                </tr>  
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </body>
                    </html>
