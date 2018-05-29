<%-- 
    Document   : appointmentRequest
    Created on : May 26, 2018, 12:24:45 PM
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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/search.css">
        <link rel="stylesheet" href="lib/form/sidebar.css">
        <link rel="stylesheet" href="lib/form/form.css">
        <link rel="stylesheet" href="lib/form/appointment.css">
    </head>

    <body>

        <header id="header">
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="home.jsp" class="scrollto">Doctor STRANGE</a></h1>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-has-children menu-active"><a href="/doctor"><fmt:message key="finddoc"/></a>
                            <ul>
                                <li>
                                    <div class="dropdown-form">
                                        <form action="doctor" method="POST">
                                            <h3><fmt:message key="finddoc"/></h3>
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="<fmt:message key="searchdotorbyname"/>"/>                                 
                                            <input class="dropdown-button" type="submit" name="action" value="Search Doctor">
                                        </form>
                                    </div>
                                </li>
                            </ul> 
                        </li>
                        <li><a href="#"><fmt:message key="appt"/></a></li>
                        <li class="menu-has-children"><a href=""><fmt:message key="language"/></a>
                            <ul>
                                <li><a href="appointmentRequest.jsp?language=en_US">English</a></li>
                                <li><a href="appointmentRequest.jsp?language=vi_VN">Tiếng Việt</a></li>
                            </ul>
                        </li>
                        <li><a href="#contact"><fmt:message key="contact"/></a></li>
                        <li class="menu-active"><a href="#" data-toggle="modal" data-target="#myLogin" data-keyboard="true"><fmt:message key="signinup"/></a></li>                     
                    </ul>
                </nav>
            </div>
        </header>
        <!--end of header -->
        <main id="main">
            <!-- De choi thoi -->
            <div class="nothing-special-dark"></div>
            <div class="container-fluid" style="background-color: #eee">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12" style="background-color: #eee">
                            <div class="appointment">
                                <h3> <fmt:message key="setanappointment"/> </h3>
                                <form action="" method="">
                                    <div class="head"><fmt:message key="patientinformation"/></div>
                                    <div class="text"><fmt:message key="fullname"/>: </div>
                                    <input class="input" name="" type="text" placeholder="Auto Filled From Session">
                                    <div class="text">Email: </div>
                                    <input class="input" name="" type="text" placeholder="Auto Filled From Session">
                                    <div class="text"><fmt:message key="gender"/>: </div>
                                    <select class="selectinput">
                                        <option value="1"><fmt:message key="male"/></option>
                                        <option value="2"><fmt:message key="female"/></option>
                                        <option value="3"><fmt:message key="other"/></option>
                                    </select>
                                    <div class="text"><fmt:message key="address"/>: </div>
                                    <input class="input" name="" type="text" placeholder="Auto Filled From Session">
                                    <br><br>
                                    <div class="head"><fmt:message key="appointmentdetail"/></div>
                                    <div class="text"><fmt:message key="doctor"/>: </div>
                                    <input class="input" name="" type="text" placeholder="Auto Filled From Session or Ajax">
                                    <div class="text"><fmt:message key="speciality"/>: </div>
                                    <select class="selectspec"> <!-- get from DAO -->
                                        <option value="1">Cảm</option>
                                        <option value="2">Sốt</option>
                                        <option value="3">Nhức Đầu</option>
                                    </select>
                                    <div class="text"><fmt:message key="specificspeciality"/>: </div>
                                    <select class="selectspec"> <!-- get from DAO -->
                                        <option value="1">Tired </option>
                                        <option value="2">So Tired</option>
                                    </select>
                                    <div class="text"><fmt:message key="otheractivitiesdiploma"/>: </div>
                                    <input class="input" name="" type="text" placeholder="Activities">
                                    <div class="text"><fmt:message key="date"/>: </div>
                                    <input class="input" name="" type="date">
                                    <div class="text"><fmt:message key="time"/>: </div>
                                    <select class="selectinput"> <!-- get from DAO -->
                                        <% for (int i = 1; i <= 12; i++) { %>
                                        <option value="<% out.print(i);%>"><% out.print(i);%></option>
                                        <%}%>
                                    </select>
                                    <select class="selectinput"> <!-- get from DAO -->
                                        <option value="0">00</option>
                                        <option value="1">30</option>
                                    </select>
                                    <select class="selectinput"> <!-- get from DAO -->
                                        <option value="AM">AM</option>
                                        <option value="PM">PM</option>
                                    </select>
                                    <div class="text"><fmt:message key="receiceapptviaemail"/><input type="checkbox"></div>
                                    <div class="error"><span></span></div>
                                    <input class="submition" type="submit" value="Request Appointment">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- End of Result -->
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
        </footer>


        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/jquery/jquery-migrate.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/flexslider/jquery.flexslider-min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="lib/superfish/hoverIntent.js"></script>
        <script src="lib/superfish/superfish.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/form/rating.js"></script>
        <script src="lib/form/side.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>


