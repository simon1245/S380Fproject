<!DOCTYPE html>
<html>
    <head>
        <title>Food Ordering System</title>
    </head>
    <body>
        <c:if test="${param.logout == null}">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </c:if>

        <h2>Create a Food</h2>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="MenuForm">
            <form:label path="foodname">Food name</form:label><br />
            <form:input type="text" path="foodname" /><br /><br />
            <form:label path="description">Description:</form:label><br />
            <form:textarea path="description" rows="5" cols="30" /><br /><br />
            <form:label path="price">Price:</form:label><br />
            <form:input path="price" rows="5" cols="30" /><br /><br />
            Available or not:<form:checkbox path="available" value="true" /></b><br />
        <b>Attachments</b><br />
        <input type="file" name="attachments" multiple="multiple" /><br /><br />
        <input type="submit" value="Submit"/>
    </form:form>
    <a href="<c:url value="/menu" />">Return to Menu List</a>
</body>
</html>

