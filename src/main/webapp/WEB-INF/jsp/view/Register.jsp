<!DOCTYPE html>
<html>
    <head>
        <title>Food Ordering System</title>
    </head>
    <body>
        <security:authorize access="!hasRole('ADMIN')">
            <h3>If you already have a account, click <a href="<c:url value="/login" />">here</a> to log in!</h3>
        </security:authorize>
        <h2>Register</h2>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="webUser">
            <form:label path="username">Username</form:label><br/>
            <form:input type="text" path="username" /><br/><br/>
            <form:label path="password">Password</form:label><br/>
            <form:input type="password"  path="password" /><br/><br/>         
            <security:authorize access="hasRole('ADMIN')">
                <form:label path="roles">Roles</form:label><br/>
                <form:checkbox path="roles" value="ROLE_USER" checked="true" />ROLE_USER
                <form:checkbox path="roles" value="ROLE_ADMIN" />ROLE_ADMIN
            </security:authorize>   

            <br /><br />
            <input type="submit" value="Register"/><br>
            <a href="<c:url value="/menu" />">Return to Menu List</a><br />

        </form:form>
    </body>
</html>
