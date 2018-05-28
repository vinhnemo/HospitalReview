<%-- 
    Document   : showhospital
    Created on : May 26, 2018, 11:25:22 PM
    Author     : NemoVinh
--%>
<%@page import="java.util.*, DTO.*, DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}" scope="session" />
<%String language = request.getParameter("language"), english = "", french = "", vietnamese = "";
    if (language == null) {
        language = "en_US";
    }
    if (language.equals("en_US")) {
        language = "English";
        english = "active";
    } else if (language.equals("fr_FR")) {
        language = "Français";
        french = "active";
    } else if (language.equals("vi_VN")) {
        language = "Tiếng Việt";
        vietnamese = "active";
    }
%>
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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/search.css">
        <link rel="stylesheet" href="lib/form/sidebar.css">
        <link rel="stylesheet" href="lib/form/form.css">
        <script src="lib/modernizer/modernizr-2.6.2.min.js"></script>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet">
        <link href="css/loader.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/form.css">
    </head>

    <body>




        <%
            Patient patient = null;
            Admin admin = null;

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("u_email")) {
                        patient = PatientDAO.getUserbyEmail(cookie.getValue());
                    } else if (cookie.getName().equals("a_email")) {
                        admin = AdminDAO.getUserbyEmail(cookie.getValue());
                    }
                }
            }
            if (session.getAttribute("patient") != null) {
                patient = (Patient) session.getAttribute("patient");
            } else if (session.getAttribute("admin") != null) {
                admin = (Admin) session.getAttribute("admin");
            }
        %>

        <div class="container">
            <div class="row">
                <div id="loader">
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="lading"></div>
                </div>
            </div>
        </div>

        <div id="good" style="display: none">
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
                                    <li><a href="home.jsp?language=en_US">English</a></li>
                                    <li><a href="home.jsp?language=vi_VN">Tiếng Việt</a></li>
                                </ul>
                            </li>
                            <li><a href="#contact"><fmt:message key="contact"/></a></li>

                            <% if (patient != null) {%>
                            <li class="menu-has-children"><a href=""><fmt:message key="greeting"/>, <%out.print(patient.getFname() + " " + patient.getLname());%></a>
                                <ul>
                                    <li><a href="profileUser.jsp"><fmt:message key="yourprofile"/></a></li>
                                    <li><a href="logout"><fmt:message key="signout"/></a></li>
                                </ul>
                            </li>
                            <% } else {%>
                            <li class="menu"><a href="#" data-toggle="modal" data-target="#myLogin" data-keyboard="true" onclick="animeEffectIn()"><fmt:message key="signinup"/></a></li>
                                <% }%>

                        </ul>
                    </nav>
                </div>
            </header>

            <!-- Login Popup -->
            <!-- Modal -->
            <div id="myLogin" class="modal fade" role="dialog" tabindex='-1'>
                <div class="modal-dialog modal-dialog-centered modal-lg">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <section id="formHolder">

                                <div class="row">

                                    <!-- Brand Box -->
                                    <div class="col-sm-6 brand">
                                        <a href="home.jsp" class="logo">Doctor <span>STRANGE</span></a>

                                        <div class="heading">
                                            <h2 class="effectAnime"><span id="heading"><fmt:message key="signup"/></span></h2>
                                        </div>

                                        <div class="success-msg">
                                            <p><fmt:message key="loginsuccess"/></p>
                                            <div class="success-btn"><a href="profileUser.jsp" class="profile"><fmt:message key="yourprofile"/></a></div>
                                            <div class="success-btn"><a href="home.jsp" class="btn-info"><fmt:message key="backtohomepage"/></a></div>
                                        </div>
                                    </div>


                                    <!-- Form Box -->
                                    <div class="col-sm-6 form">

                                        <!-- Login Form -->
                                        <div class="login form-peice switched">
                                            <form class="login-form" action="#" method="post">
                                                <span id="user-result"></span>

                                                <div class="form-group">
                                                    <label for="email"><fmt:message key="email"/></label>
                                                    <input type="email" name="email" id="email" required>
                                                </div>

                                                <div class="form-group">
                                                    <label for="password"><fmt:message key="password"/></label>
                                                    <input type="password" name="password" id="password" required>
                                                </div>

                                                <div class="form-check-inline">
                                                    <input type="checkbox" name="remember" id="remember" value="yes" class="form-check-input">
                                                    <label for="remember" class="form-check-label"><fmt:message key="rememberme"/></label>
                                                </div>

                                                <div class="CTA">
                                                    <input type="submit" value="Login" name="action" id="login">
                                                    <a href="#" class="switch" id="registersw"><fmt:message key="imnew"/></a>
                                                </div>
                                            </form>
                                        </div><!-- End Login Form -->


                                        <!-- Signup Form -->
                                        <div class="signup form-peice">
                                            <form class="signup-form" action="register" method="post">

                                                <div class="form-group">
                                                    <label for="fname"><fmt:message key="firstname"/></label>
                                                    <input type="text" name="fname" id="fname" class="fname" required>
                                                    <span class="error"></span>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lname"><fmt:message key="lastname"/></label>
                                                    <input type="text" name="lname" id="lname" class="lname" required>
                                                    <span class="error"></span>
                                                </div>

                                                <div class="form-group">
                                                    <label for="email"><fmt:message key="email"/></label>
                                                    <input type="email" name="email" id="email" class="email" required>
                                                    <span class="error"></span>
                                                    <span id="isExist"></span>
                                                </div>

                                                <div class="form-group">
                                                    <label for="address"><fmt:message key="address"/></label>
                                                    <input type="text" name="address" id="address" class="address" required>
                                                    <span class="error"></span>
                                                </div>

                                                <div class="CTA">
                                                    <input type="submit" value="Signup Now" id="submit" name="action">
                                                    <a href="#" class="switch" id="loginsw"><fmt:message key="ihaveanaccount"/></a>
                                                </div>
                                            </form>
                                        </div><!-- End Signup Form -->
                                    </div>
                                </div>
                            </section>
                        </div> <!-- body -->
                    </div>

                </div>
            </div>

            <!-- Login Popup -->
            <!-- Modal -->
            <div id="myLogin" class="modal fade" role="dialog" tabindex='-1'>
                <div class="modal-dialog modal-dialog-centered modal-lg">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <section id="formHolder">

                                <div class="row">

                                    <!-- Brand Box -->
                                    <div class="col-sm-6 brand">
                                        <a href="home.jsp" class="logo">Doctor <span>STRANGE</span></a>

                                        <div class="heading">
                                            <h2 class="effectAnime"><span id="heading"><fmt:message key="signup"/></span></h2>
                                        </div>

                                        <div class="success-msg">
                                            <p><fmt:message key="loginsuccess"/></p>
                                            <div class="success-btn"><a href="patient" class="profile"><fmt:message key="yourprofile"/></a></div>
                                            <div class="success-btn"><a href="home.jsp" class="btn-info"><fmt:message key="backtohomepage"/></a></div>
                                        </div>
                                    </div>


                                    <!-- Form Box -->
                                    <div class="col-sm-6 form">

                                        <!-- Login Form -->
                                        <div class="login form-peice switched">
                                            <form class="login-form" action="#" method="post">
                                                <span id="user-result" style="color: red"></span>

                                                <div class="form-group">
                                                    <label for="email"><fmt:message key="email"/></label>
                                                    <input type="email" name="email" id="email" required>
                                                </div>

                                                <div class="form-group">
                                                    <label for="password"><fmt:message key="password"/></label>
                                                    <input type="password" name="password" id="password" required>
                                                </div>

                                                <div class="form-group">
                                                    <label for="remember"><fmt:message key="rememberme"/></label>
                                                    <input type="checkbox" name="remember" id="remember" value="yes">
                                                </div>

                                                <div class="CTA">
                                                    <input type="submit" value="Login" name="action" id="login">
                                                    <a href="#" class="switch" id="registersw"><fmt:message key="imnew"/></a>
                                                </div>
                                            </form>
                                        </div><!-- End Login Form -->


                                        <!-- Signup Form -->
                                        <div class="signup form-peice">
                                            <form class="signup-form" action="register" method="post">

                                                <div class="form-group">
                                                    <label for="fname"><fmt:message key="firstname"/></label>
                                                    <input type="text" name="fname" id="fname" class="fname" required>
                                                    <span class="error"></span>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lname"><fmt:message key="lastname"/></label>
                                                    <input type="text" name="lname" id="lname" class="lname" required>
                                                    <span class="error"></span>
                                                </div>

                                                <div class="form-group">
                                                    <label for="email"><fmt:message key="email"/></label>
                                                    <input type="email" name="email" id="email" class="email" required>
                                                    <span class="error"></span>
                                                </div>

                                                <div class="form-group">
                                                    <label for="address"><fmt:message key="address"/></label>
                                                    <input type="text" name="address" id="address" class="address" required>
                                                    <span class="error"></span>
                                                </div>

                                                <div class="CTA">
                                                    <input type="submit" value="Signup Now" id="submit" name="action">
                                                    <a href="#" class="switch" id="loginsw"><fmt:message key="ihaveanaccount"/></a>
                                                </div>
                                            </form>
                                        </div><!-- End Signup Form -->
                                    </div>
                                </div>
                            </section>
                        </div> <!-- body -->
                    </div>

                </div>
            </div>

            <!--=------------------------------------------------->
            <%

                HospitalDAO hosDAO = new HospitalDAO();
                List<Hospital> listhospital = (ArrayList<Hospital>) session.getAttribute("hospitallist");

            %>
            <!--end of header -->
            <main id="main">
                <!-- De choi thoi -->
                <div class="nothing-special-dark"></div>
                <div class="search-field">
                    <h4> <%= listhospital.size()%> <fmt:message key="hospitalfound"/> </h4>
                </div>
                <!-- !! -->
                <section class="card-section-imagia">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-3">
                                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
                                <aside id="fh5co-aside" role="complementary" class="border js-fullheight">
                                    <div class="side-content">
                                        <h4><fmt:message key="filter"/></h4><hr>
                                        <div class="side-text">Your Search</div>
                                        <div class="search-container">
                                            <form method="POST" action="hospital">
                                                <input type="hidden" name="action" value="find">
                                                <input type="text" name="search" placeholder="Search..." class="search-input" value="">
                                                <button class="btn btn-light search-btn" type="submit"> 
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </form>
                                        </div><hr>
                                        <div class="side-text"><fmt:message key="gender"/></div>
                                        <select class="side-select"> <!-- apply from db -->
                                            <option value="1"><fmt:message key="male"/></option>
                                            <option value="2"><fmt:message key="female"/></option>
                                        </select><hr>
                                        <div class="side-text"><fmt:message key="lastname"/></div>
                                        <select class="side-select"> <!-- apply from db -->
                                            <option value="1">A -> Z</option>
                                            <option value="2">Z -> A</option>
                                        </select><hr>
                                        <div class="side-text"><fmt:message key="speciality"/></div>
                                        <select class="side-select"> <!-- apply from db -->
                                            <option value="Crazy">Crazy</option>
                                            <option value="Mad">Mad</option>
                                        </select><hr>
                                        <div class="side-text">Sorting</div>
                                        <select class="side-select"> <!-- apply from db -->
                                            <option value="location">Location</option>
                                            <option value="popular">Popular</option>
                                            <option value="highlow">High -> Low</option>
                                            <option value="lowhigh">Low -> High</option>
                                        </select>
                                    </div>                            
                                </aside>
                            </div>

                            <div class="col-md-9">
                                <div class="row">                        
                                    <%
                                        if (listhospital.size() > 0) {
                                            for (Hospital h : listhospital) {
                                    %> 
                                    <div class="col-md-3">

                                        <div class="card-container-imagia">
                                            <div class="card-imagia">
                                                <div class="front-imagia">
                                                    <div class="cover-imagia"><!--<img src="https://unsplash.it/720/500?image=1067" alt="">--></div>
                                                    <div class="user-imagia"><img src="https://unsplash.it/120/120?image=64" class="img-circle" alt=""></div>
                                                    <div class="content-imagia">
                                                        <h3 class="name-imagia"><%= h.getName()%> </h3>
                                                        <p class="subtitle-imagia"><%= h.getAddress()%></p> <hr>
                                                        <div id="location"><i class="fa fa-map-marker"></i> 1822km </div>

                                                        <div id="degree"> <fmt:message key="website"/> : <%= h.getWebsite()%></div>
                                                    </div>
                                                    <div class="footer-imagia"><span><i class="fa fa-plus"></i> <fmt:message key="moreinfor"/></span></div>
                                                </div>
                                                <div class="back-imagia">
                                                    <div class="content-imagia content-back-imagia">
                                                        <div>
                                                            <h4></h4>
                                                            <div id="gender"><fmt:message key="hospitaladminname"/>   : <%= h.getAdName()%></div>
                                                            <div id="degree"><fmt:message key="hospitaladminemail"/>  : <%= h.getAdEmail()%></div>

                                                        </div>
                                                    </div>
                                                    <div class="footer-imagia">
                                                        <div class="text-center">
                                                            <input type="hidden" name="id_doctor" value="" >
                                                            <input class="card-button" type="submit" value="Make Appointment">
                                                        </div>
                                                        <div class="social-imagia text-center"><a href="/hospital?action=viewprohos&id_hospital=<%= h.getID()%>">View Profile</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <% }
                                        }%>
                                </div>

                            </div>
                        </div> 
                    </div>
                    </div> 
                    </div>
                    </div>
                </section>
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

            <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
            <script src="lib/jquery/jquery.min.js"></script>
            <script src="lib/jquery/jquery-migrate.min.js"></script>
            <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/easing/jquery.easing.1.3.js"></script>
            <script src="lib/flexslider/jquery.flexslider-min.js"></script>
            <script src="lib/bootstrap/js/bootstrap.min.js"></script>
            <script src="lib/superfish/hoverIntent.js"></script>
            <script src="lib/superfish/superfish.min.js"></script>
            <script src="lib/wow/wow.min.js"></script>
            <script src="lib/form/side.js"></script>
            <script src="js/main.js"></script>
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
            <script src="lib/anime/anime.min.js"></script>

            <script src="contactform/contactform.js"></script>

            <script src="js/main.js"></script>
            <script src="js/modal.js"></script>

            <script type="text/javascript">
                                    $(window).load(function (e) {
                                        document.getElementById("loader").style.display = "none";
                                        document.getElementById("good").style.display = "block";

                                    });
            </script>
    </body>
</html>


