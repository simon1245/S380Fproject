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

        <h2>Make a Comment</h2>

        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="CommentForm">
            Food_id:  ${menu.food_id}<br />
            Food Name:${menu.name}   <br />
            <form:label path="detail">Comment</form:label><br />
            <form:textarea path="detail" rows="5" cols="30" /><br /><br />
            <input type="submit" value="Submit"/>
        </form:form>
    </body>
</html>
