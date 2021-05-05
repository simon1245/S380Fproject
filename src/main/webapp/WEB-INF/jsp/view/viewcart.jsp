<!DOCTYPE html>
<html>
    <head>
        <title>View Cart</title>
    </head>
    <body>

        <a href="<c:url value="/menu/emptycart"/>">Empty Cart</a>
        <h1>View ShopingCart</h1>
        <a href="<c:url value="/menu" />">Return to menu</a><br /><br />
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

    </body>
</html>

