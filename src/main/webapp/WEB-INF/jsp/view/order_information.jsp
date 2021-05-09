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
                        <a href="<c:url value="/menu/vieworders" />" class="w3-bar-item w3-button w3-right w3-medium"><fmt:message key='viewOrder'/></a>
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
                        <a href="<c:url value="/viewcart/zh-HK" />" class="w3-right w3-button w3-medium">中文</a>
                    </c:when>

                    <c:when test = "${language == 'zh_HK'}">  
                        <a href="<c:url value="/viewcart/en" />" class="w3-right w3-button w3-medium">English</a>
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
                        <h1 ><fmt:message key='order_information.information'/></h1>
                    </div>
                </div>
                <br>
                <div class="w3-row w3-border w3-border-brown w3-container w3-padding-32">
                    <c:set var="Total_bill" value="0" />
                    <c:set var="Total_qty" value="0" />
                    <table class="w3-table w3-bordered w3-hoverable">
                        <tr class="w3-large ">
                            <th ><fmt:message key='viewcart.food'/>   </th>
                            <th class="w3-center">
                                <fmt:message key='viewcart.quantity'/></th>
                            <th class="w3-center"><fmt:message key='viewcart.price'/>  </th>

                            <th class="w3-center"><fmt:message key='viewcart.subtotal'/></th>
                        </tr>
                        <c:forEach items="${orderedfoods}" var="orderedfood">
                            <tr>
                                <c:set var="SubTotal" value="0" />
                                <c:set var="SubTotal" value="${orderedfood.quantity*orderedfood.price}" />    
                                <c:set var="Total_bill" value="${Total_bill + SubTotal}" />
                                <c:set var="Total_qty" value="${Total_qty + orderedfood.quantity}" />
                                <td width="40%">${orderedfood.name}   </td>
                                <td width="20%" class="w3-center"><c:out value="${orderedfood.quantity}" /></td>

                                <td width="10%" class="w3-center">$${orderedfood.price}  </td>
                                <td width="20%" class="w3-center">$${SubTotal}  </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div  class="w3-row w3-border w3-border-brown w3-container w3-padding-32 ">

                        <table align="right" >
                            <tr >
                                <th width="70%"></th>
                                <th></th>
                            </tr>
                            <tr >
                                <td  align="right">
                                    <fmt:message key='viewcart.totalItem'/>
                                </td>
                                <td  align="center">
                                    ${Total_qty} 
                                </td>
                            </tr>
                            <tr>
                                <td align="right" RowSpan="2">
                                    <fmt:message key='viewcart.bill'/>
                                </td>
                                <td  align="center">
                                    $${Total_bill}
                                </td>
                            </tr>
                            <tr>
                                <td  align="center">
                                    <fmt:message key='viewcart.OrderTime:'/>
                                </td>
                                <td   align="center"> 
                                    <fmt:formatDate pattern="hh:mm:ss dd-MM-yyyy" value="${order.order_time}" />

                                </td>
                            </tr>
                        </table>
                    </div>     
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