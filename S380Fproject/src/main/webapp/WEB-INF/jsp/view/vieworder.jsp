<!DOCTYPE html>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" /> 
<fmt:setBundle basename="messages" />
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <title><fmt:message key='viewcart.description'/> - <fmt:message key='view.title'/></title>
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
        .w3-bar-block .w3-bar-item {padding:20px}
        h1 {letter-spacing: 6px}
        .menu {display: none}
    </style>
    <body>

        <!-- Navbar (sit on top) -->
        <div class="w3-top w3-hide-small">
            <div class="w3-bar w3-xlarge w3-dark-grey w3-opacity w3-hover-opacity-off" id="myNavbar">
                <a href="<c:url value="/menu" />" class="w3-bar-item w3-button"><fmt:message key='home'/></a>
                <a href="<c:url value="/menu/#menu" />" class="w3-bar-item w3-button"><fmt:message key='menu'/></a>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}"> 
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post">
                            <input type="submit" value="<fmt:message key='logOutButton'/>" class="w3-bar-item w3-button w3-right w3-dark-grey w3-opacity w3-medium" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                            <a href="<c:url value="/user/edit_user/${pageContext.request.userPrincipal.name}" />"class="w3-bar-item w3-button w3-right w3-medium"><u>${pageContext.request.userPrincipal.name}</u
                            </a>
                        </security:authorize>
                        <a href="<c:url value="/menu/viewcart" />" class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='viewCart'/></a>
                        <security:authorize access="hasRole('ADMIN')">
                            <a href="<c:url value="/user/manage_user" />"class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='manageUser'/></a>
                            <a href="<c:url value="/menu/manage_menu" />"class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='manageMenu'/></a>
                        </security:authorize>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="/login" />" class="w3-right w3-button w3-medium"><fmt:message key='login'/></a>
                        <a href="<c:url value="/user/Register" />" class="w3-right w3-button w3-medium"><fmt:message key='register'/></a>
                    </c:otherwise>
                </c:choose>

                <c:choose>

                    <c:when test = "${language == 'en_US'}">  
                        <a href="<c:url value="/vieworders/zh-HK" />" class="w3-right w3-button w3-medium">??????</a>
                    </c:when>

                    <c:when test = "${language == 'zh_HK'}">  
                        <a href="<c:url value="/vieworders/en" />" class="w3-right w3-button w3-medium">English</a>
                    </c:when>

                </c:choose>
            </div>   
        </div>   
        <!-- header -->       
        <header class="w3-container w3-center w3-opacity" style="background-color:#D2CBC4; padding:128px 16px">
            <div>
                <h1 class="w3-xlarge w3-text-black"><fmt:message key='menu.restaurant'/></h1>
                <h1 class="w3-text-black"><fmt:message key='menu.orderingSys'/></h1>
                <br>
                <p><a href="<c:url value="/menu/#menu" />" class="w3-button w3-large w3-black"><fmt:message key='menu.letMeSee'/></a></p>
            </div>
        </header>
        <!-- content-->
        <div class="w3-container w3-white w3-padding-64 w3-large" >
            <div class="w3-content">
                <div class="w3-row" style="padding-top:10px">
                    <div class="w3-threequarter">
                        <h1 ><fmt:message key='viewcart.Orders'/></h1>
                    </div>
                </div>
                <br>
                <div class="w3-row w3-border w3-border-brown w3-container w3-padding-32">

                    <c:choose>
                        <c:when test="${empty  orders}">
                            <h4 class="w3-center"><fmt:message key='vieworder.noOrder'/></h4>
                        </c:when>
                        <c:otherwise>
                            <table  class="w3-table w3-bordered w3-hoverable">
                                <tr class="w3-large ">

                                    <th ><fmt:message key='vieworder.order number'/>   </th>
                                    <th class="w3-center">
                                        <fmt:message key='vieworder.Cost'/></th>
                                    <th class="w3-center"><fmt:message key='vieworder.Order Time'/>  </th>
                                    <th >  </th>
                                </tr>
                                <c:forEach items="${orders}" var="order">
                                    <tr>
                                        <td width="30%" class="w3-center"> #${order.id}  </td>
                                        <td width="20%" class="w3-center">$${order.cost}  </td>
                                        <td  width="20%" class="w3-center"> <fmt:formatDate pattern="dd-MM-yy hh:mm" value="${order.order_time}" /> </td>
                                        <td width="30%">
                                            <a href="<c:url value="/menu/vieworders/order_information/order_id=${order.id}" />" class="w3-btn w3-dark-grey w3-right w3-round-large w3-large"><fmt:message key='ViewMore'/></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:otherwise>
                    </c:choose>        

                </div>
                <br>
                <a href="<c:url value="/menu" />" class="w3-btn w3-dark-grey w3-right w3-round-large w3-large"><fmt:message key='backToMenuList'/></a>
            </div>
        </div>  
        <br><br>
        <!-- Footer -->
        <footer class="w3-container w3-dark-grey" style="padding:32px">
            <a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom"><fmt:message key='menu.to_the_top'/></a>
        </footer>               
    </body>
</html>