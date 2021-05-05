<!DOCTYPE html>
<html>
    <head>
        <title>View Cart</title>
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

        <h1>View ShopingCart</h1>

        <c:choose>
            <c:when test="${empty carts}">
                Your cart is empty
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>Food   </th>
                        <th>Price  </th>
                        <th>quantity  </th>
                    </tr>
                    <c:forEach items="${carts}" var="cart">
                        <tr>
                            <c:forEach items="${menus}" var="menu">
                                <c:if test="${menu.food_id == cart.key}">
                                    <td>${menu.name}   </td>
                                    <td>${menu.price}  </td>
                                    <td>${cart.value}  </td>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <br>
        <c:if test="${!empty carts}">
            <a href="<c:url value="/menu/emptycart"/>">Empty Cart</a><br><br>
        </c:if>
        <a href="<c:url value="/menu" />">Return to menu</a><br /><br />
    </body>
</html>

