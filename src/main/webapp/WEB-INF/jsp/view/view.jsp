<!DOCTYPE html>
<html>
    <head>
        <title>Food Ordering System</title>
    </head>
    <body>

        <c:choose>
            <c:when test="${param.logout != null}">
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
            Attachments:
            <c:forEach items="${menu.attachments}" var="attachment"
                       varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="<c:url value="/menu/view/${menu.food_id}/attachment/${attachment.name}" />">
                    <c:out value="${attachment.name}" /></a>
            </c:forEach><br /><br />
        </c:if>
        <a href="<c:url value="/menu" />">Return to Menu List</a>
    </body>
</html>
