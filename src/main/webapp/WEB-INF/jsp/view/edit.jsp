<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
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

        <h2>Food #${menu.food_id}</h2>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="MenuForm">   
            <form:label path="foodname">Food name</form:label><br />
            <form:input type="text" path="foodname" /><br /><br />
            <form:label path="price">Price:</form:label><br />
            <form:input path="price" rows="5" cols="30" /><br /><br />
            <form:label path="description">Description:</form:label><br />
            <form:textarea path="description" rows="5" cols="30" /><br /><br />
            Available or not:<form:checkbox path="available" value="true" /></b><br />
            <c:if test="${fn:length(menu.attachments) > 0}">
                <b>Attachments:</b><br/>
                <ul>
                    <c:forEach items="${menu.attachments}" var="attachment">
                        <li>
                            <c:out value="${attachment.name}" />
                            [<a href="<c:url
                                    value="/menu/delete/${menu.food_id}/${attachment.name}"
                                    />">Delete</a>]
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <b>Add attachments</b><br />
            <input type="file" name="attachments" multiple="multiple"/><br/><br/>
            <input type="submit" value="Save"/><br/><br/>
        </form:form>
        <a href="<c:url value="/menu" />">Return to Menu List</a>
    </body>
</html>