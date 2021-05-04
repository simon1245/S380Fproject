<!DOCTYPE html>
<html>
    <body>
        <%--
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        --%>
        <br /><br />
        <h2>Food Menu</h2>
        <a href="<c:url value="/user/create" />">Create a Menu</a><br /><br />
        --%>
        <c:choose>
            <c:when test="${fn:length(menus) == 0}">
                <i>There are no Menu in the system.</i>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>Username</th><th>Password</th><th>Roles</th><th>Action</th>
                    </tr>
                    <c:forEach items="${menus}" var="menu">
                        <tr>
                            <td>${menu.name}</td>
                            <td>${menu.description}</td>
                            <td>${menu.price}</td>
                            <td>${menu.available}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>