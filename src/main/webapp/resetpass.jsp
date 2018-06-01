<%-- 
    Document   : login
    Created on : May 17, 2018, 7:14:46 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}" scope="session" />
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" scope="session"/>
</c:if>
<fmt:setBundle basename="text" />
<!DOCTYPE html>
<html lang="${language}">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <title>Doctor Strange | Hospital Review Website</title>
        <link rel="icon" type="image/png" href="img/Add.png">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/form.css">
    </head> 

    <body>
        <%
            Integer pId = (Integer) request.getAttribute("userId");
            if (pId == null) {
                response.sendRedirect("forgotPassword");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <main id="main">
                <div class="login-dark">
                    <form class="reset" action="#" method="post" id="reset-form">
                        <h3> <fmt:message key="newpassword"/> </h3>
                    <div class="i3"><i class="icon ion-ios-unlocked-outline"></i></div>
                    <div class="text"><fmt:message key="enterpassword"/> :</div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="password" id="pass1" minlength="6" maxlength="16" placeholder="<fmt:message key="yourpassword"/>" required>
                        <span id="pass-status"></span>
                    </div>
                    <div class="text"> <fmt:message key="reenterpassword"/> :</div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="repassword" id="pass2" minlength="6" maxlength="16" placeholder="<fmt:message key="enterpassword"/>" required>
                        <span id="confirmMessage"></span>
                    </div>
                    <div class="form-group"><button class="btn btn-primary2 btn-block" type="submit" name="action"><fmt:message key="resetyourpassword"/></button></div>
                </form>
            </div>
        </main>
        <script src="js/registration.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/jquery/jquery-migrate.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/modal.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var timer;

                $('#reset-form').submit(function (event) {
                    event.preventDefault();

                    var pass1 = $('#pass1').val();
                    var pass2 = $('#pass2').val();
                    var userId = <%=pId%>;

                    clearTimeout(timer);
                    $('#user-result').html('<img src="img/loading.gif" />');
                    timer = setTimeout(function () {
                        $.post('forgotPassword', {'password': pass1, 'password2': pass2, 'userId': userId, 'action': "resetPass"}, function (data) {
                            var msg = JSON.parse(data);
                            if (msg.code == -1) {
                                $('#user-result').show();
                                $('#user-result').html("<i class=\"fa fa-close\" style=\"color: #ff6666\">" + msg.text + "</i>");
                            } else {
                                $('#user-result').hide();
                                alert(msg.text);
                                setTimeout(function () {
                                    location.href = "home.jsp";
                                }, 5000);
                            }
                        });
                    }, 1000);
                });
            });
        </script>
    </body>
</html>

