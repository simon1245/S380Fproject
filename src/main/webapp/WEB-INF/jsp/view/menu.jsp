<!DOCTYPE html>
<html>
    <body>
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
                <security:authorize access="hasRole('ADMIN')">
                    [<a href="<c:url value="/user/manage" />">Manage User Account</a>]
                </security:authorize>
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
        <br /><br />
        <h1>Food Menu</h1>
        <security:authorize access="hasRole('ADMIN')">
            <a href="<c:url value="/menu/create" />">Create a Menu</a><br /><br />
        </security:authorize>
        <h2><a href="<c:url value="/menu/viewcart"/>">View Your Shopping Cart!</a><br><br></h2>
            <c:choose>
                <c:when test="${fn:length(menus) == 0}">
                <i>There are no Menu in the system.</i>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>Food Sample</th>
                        <th>Food Name</th>
                        <th>Price</th>
                        <th>Available?</th>
                        <th>    </th>
                    </tr>
                    <c:forEach items="${menus}" var="menu">
                        <tr>
                            <c:set var= "count" value= "0" />
                            <c:forEach items="${images}" var="image">
                                <c:if test="${count==0}">
                                    <c:if test="${image.food_id == menu.food_id}">

                                        <td>
                                            <img src="data:image/jpg;base64,${image.base64img}" alt="No image" height="50" width="50"/>
                                        </td>
                                        <c:set var= "count" value= "1" />
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            <c:if test="${count==0}"> 
                                <td><img src=""  height="50" width="50"/> </td>
                                </c:if>    

                            <td>${menu.name}</td>
                            <td>${menu.price}</td>
                            <td>${menu.available}</td>
                            <td><a href="<c:url value="/menu/view/${menu.food_id}" />">View More...</a><br />
                                <a href="<c:url value="/menu/addtoCart">
                                       <c:param name="food_Id" value="${menu.food_id}" />
                                   </c:url>">Add to cart</a>
                                <br/>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>