<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support Login</title>
    </head>
    <body>

        <c:if test="${param.error != null}">
            <p>Login failed.</p>
        </c:if>
        <c:if test="${param.logout != null}">
            <p>You have logged out.</p>
        </c:if>
        <security:authorize access="!hasRole('USER') and !hasRole('ADMIN')">
            <h2>Please login your account</h2>
            <form action="login" method="POST">
                <label for="username">Username:</label><br/>
                <input type="text" id="username" name="username" /><br/><br/>
                <label for="password">Password:</label><br/>
                <input type="password" id="password" name="password" /><br/><br/>
                <input type="checkbox" id="remember-me" name="remember-me" />
                <label for="remember-me">Remember me</label><br/><br/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="submit" value="Log In"/><br />
            </form>
            If you do not have a account. Click  <a href="<c:url value="/user/Register" />">here </a>to register.<br /><br />
        </security:authorize>
        <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
            You already login! <br>
        </security:authorize>
        <a href="<c:url value="/menu" />">Return to Menu List</a>
    </body>
</html>
