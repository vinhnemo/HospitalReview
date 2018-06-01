<%-- 
    Document   : login
    Created on : May 17, 2018, 7:14:46 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}" />
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" scope="session"/>
</c:if>
<fmt:setBundle basename="text" />
<!DOCTYPE html>
<html lang="${language}">
    <%
        // Call cookie
        Cookie isLogin[] = request.getCookies();

        if (isLogin != null) {
            for (Cookie ck : isLogin) {
                if (ck.getName().equals("u_email") || ck.getName().equals("a_email")) {
                    response.sendRedirect("home.jsp");
                }
            }
        }

        if (session.getAttribute("patient") != null || session.getAttribute("admin") != null) {
            response.sendRedirect("home.jsp");
        }
    %>
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
        <link href="css/checkbox.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="lib/form/form.css">
    </head> 

    <body>

        <main id="main">
            <div class="login-dark">
                <form class="login" action="#" id="login-form" method="POST">
                    <h1><fmt:message key="login"/></h1>
                    <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>

                    <div class="form-group"><span id="user-result"></span></div>
                    <div class="form-group"><input class="form-control" type="email" name="email" placeholder="<fmt:message key="email"/>" id="email"></div>
                    <div class="form-group"><input class="form-control" type="password" name="password" placeholder="<fmt:message key="password"/>" id="password"></div>
                    <div class="el-checkbox el-checkbox-green">
                        <span class="margin-r"><fmt:message key="rememberme"/></span>
                        <input type="checkbox" name="remember" id="remember" value="yes">
                        <label class="el-checkbox-style" for="remember"></label>
                    </div>
                    <div class="form-group"><button class="btn btn-primary btn-block" type="submit"><fmt:message key="login"/></button></div>
                    <div class="form-group">
                        <input class="btn btn-primary2 btn-block" type="submit" value="Register New Account" onclick="window.location.href = 'register'" />                        
                    </div>
                    <a href="forgotPassword" class="forgot"><fmt:message key="forgotemailorpassword"/></a>
                </form>
            </div>
        </main>

        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-info">
                            <h3>Doctor STRANGE</h3>
                            <p> <fmt:message key="home.msg21"/></p>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4><fmt:message key="usefullinks"/></h4>
                            <ul>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="home"/></a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="aboutus"/></a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="services"/></a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="termsofservice"/></a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#"><fmt:message key="privacypolicy"/></a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h4><fmt:message key="contact"/></h4>
                            <p>
                                69 IU Street <br>
                                Ho Chi Minh City, <br>
                                Viet Nam<br>
                                <strong><fmt:message key="phonenumber"/>:</strong> 911 <br>
                                <strong>Email:</strong> abc@gmail.com<br>
                            </p>

                            <div class="social-links">
                                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                                <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6 footer-newsletter">
                            <h4><fmt:message key="other"/></h4>
                            <p><fmt:message key="home.msg22"/> </p>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong>Doctor Strange</strong>. All Rights Reserved
                </div>
            </div>



            <script src="lib/bootstrap/js/bootstrap.min.js"></script>
            <script src="lib/jquery/jquery.min.js"></script>
            <script src="lib/jquery/jquery-migrate.min.js"></script>
            <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/superfish/hoverIntent.js"></script>
            <script src="lib/superfish/superfish.min.js"></script>
            <script src="lib/wow/wow.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/counterup/counterup.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="lib/isotope/isotope.pkgd.min.js"></script>
            <script src="lib/lightbox/js/lightbox.min.js"></script>
            <script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>

            <script src="contactform/contactform.js"></script>

            <script src="js/main.js"></script>
            <script src="js/login.js"></script>
    </body>
</html>

