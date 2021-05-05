<!DOCTYPE html>
<html>
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

        <h2>Users Management</h2>
        <a href="<c:url value="/user/Register" />">Create a User</a><br /><br />
        <c:choose>
            <c:when test="${fn:length(webUsers) == 0}">
                <i>There are no users in the system.</i>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>Username</th><th>Password</th><th>Roles</th><th>Action</th>
                    </tr>
                    <c:forEach items="${webUsers}" var="user">
                        <tr>
                            <td>${user.username}</td><td>${user.password}</td>
                            <td>
                                <c:forEach items="${user.roles}" var="role" varStatus="status">
                                    <c:if test="${!status.first}">, </c:if>
                                    ${role.role}
                                </c:forEach>
                            </td>
                            <td>
                                [<a href="<c:url value="/user/delete/${user.username}" />">Delete</a>]
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
