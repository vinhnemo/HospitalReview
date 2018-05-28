<%-- 
    Document   : home
    Created on : May 16, 2018, 4:41:41 PM
    Author     : MSI
--%>

<%@page import="DAO.*,DTO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}"  />
<%String language = request.getParameter("language"), english = "", vietnamese = "";
    if (language == null) {
        language = "en_US";
    }
    if (language.equals("en_US")) {
        language = "English";
        english = "active";
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
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/form.css">
        <link rel="stylesheet" href="lib/form/search.css">

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
        <div class="nothing-special-dark"></div>
        <section id="contact" class="section-bg wow fadeInUp">
            <div class="container">
                <div class="row">
                    <div class="col-md-2" style="background-color: transparent"></div>
                    <div class="col-md-8">
                        <div class="section-header">
                            <h3><fmt:message key="contact"/></h3>
                            <p>Call us when you need</p>
                        </div>

                        <div class="row contact-info">

                            <div class="col-md-4">
                                <div class="contact-address">
                                    <i class="ion-ios-location-outline"></i>
                                    <h3><fmt:message key="address"/></h3>
                                    <address>69, HCMIU, HCM City, Viet Nam</address>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="contact-phone">
                                    <i class="ion-ios-telephone-outline"></i>
                                    <h3><fmt:message key="phonenumber"/></h3>
                                    <p><a href="tel:+113">113</a></p>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="contact-email">
                                    <i class="ion-ios-email-outline"></i>
                                    <h3><fmt:message key="email"/></h3>
                                    <p><a href="abc@gmail.com">abc@gmail.com</a></p>
                                </div>
                            </div>

                        </div>

                        <div class="form2">
                            <form action="" method="post" role="form" class="contactForm">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <input type="text" name="name" class="form-control" id="name" placeholder="<fmt:message key="name"/>" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                        <div class="validation"></div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <input type="email" class="form-control" name="email" id="email" placeholder="<fmt:message key="email"/>" data-rule="email" data-msg="Please enter a valid email" />
                                        <div class="validation"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="subject" id="subject" placeholder="<fmt:message key="subject"/>" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="<fmt:message key="message"/>"></textarea>
                                    <div class="validation"></div>
                                </div>
                                <div class="text-center"><button type="submit"><fmt:message key="sendmessage"/></button></div>
                            </form>
                        </div>
                    </div>               
                    <div class="col-md-2" style="background-color: transparent"></div>

                </div>
        </section>

    </main>
    <footer id="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-6 footer-info">
                        <h3>Doctor STRANGE</h3>
                        <p> Man tao cá mày không được vui nữa kể từ khi cái này tao đến. Nhìn tao đứng trên top cái miệng mày câm như hến .Sẽ có ngày tới mày nhưng việc đầu tiên trước hết. Mày muốn thắng trò chơi này việc đầu tiên phải làm là giết tao chết</p>
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
                        <p>motherfucker không quen, tao không quen, đừng nói chuyện thân thiện như vậy với tao, tao không quen, cũng đừng nói chuyện đằng sau lưng của tao như vậy. </p>
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

</body>
</html>

