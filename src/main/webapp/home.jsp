<%-- 
    Document   : home
    Created on : May 16, 2018, 4:41:41 PM
    Author     : MSI
--%>

<%@page import="DAO.*,DTO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}"/>
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
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
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
        %>
        <fmt:setLocale value="<%=patient.getLang()%>" scope="session"/>
        <fmt:setBundle basename="text" />
        <%
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
            <jsp:include page="header.jsp"></jsp:include>

            <section id="intro">
                <div class="intro-container">
                    <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">

                        <ol class="carousel-indicators"></ol>

                        <div class="carousel-inner" role="listbox">

                            <div class="carousel-item active">
                                <div class="carousel-background"><img src="img/intro/1.jpg" alt=""></div>
                                <div class="carousel-container">
                                    <div class="carousel-content">
                                        <h2><fmt:message key="home.msg1"/></h2>
                                        <p><fmt:message key="home.msg2"/></p>
                                        <a href="#featured-services" class="btn-get-started scrollto"><fmt:message key="getstarted"/></a>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div class="carousel-background"><img src="img/intro/2.jpg" alt=""></div>
                                <div class="carousel-container">
                                    <div class="carousel-content">
                                        <h2><fmt:message key="home.msg3"/></h2>
                                        <p><fmt:message key="home.msg4"/></p>
                                        <a href="#featured-services" class="btn-get-started scrollto"><fmt:message key="getstarted"/></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a class="carousel-control-prev" href="#introCarousel" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon ion-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only"><fmt:message key="previous"/></span>
                        </a>

                        <a class="carousel-control-next" href="#introCarousel" role="button" data-slide="next">
                            <span class="carousel-control-next-icon ion-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only"><fmt:message key="next"/></span>
                        </a>

                    </div>
                </div>
            </section>

            <main id="main">
                <section id="featured-services">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-4 box">
                                <i class="ion-ios-bookmarks-outline"></i>
                                <h4 class="title"><a href=""><fmt:message key="findalldoctor"/></a></h4>
                                <p class="description"><fmt:message key="home.msg5"/></p>
                            </div>

                            <div class="col-lg-4 box box-bg">
                                <i class="ion-ios-stopwatch-outline"></i>
                                <h4 class="title"><a href=""><fmt:message key="setanappointment"/></a></h4>
                                <p class="description"><fmt:message key="home.msg6"/></p>
                            </div>

                            <div class="col-lg-4 box">
                                <i class="ion-ios-heart-outline"></i>
                                <h4 class="title"><a href=""><fmt:message key="health"/></a></h4>
                                <p class="description"><fmt:message key="home.msg7"/></p>
                            </div>

                        </div>
                    </div>
                </section>
                <section id="about">
                    <div class="container">

                        <header class="section-header">
                            <h3><fmt:message key="aboutus"/></h3>
                            <p><fmt:message key="home.msg8"/></p>
                        </header>

                        <div class="row about-cols">

                            <div class="col-md-4 wow fadeInUp">
                                <div class="about-col">
                                    <div class="img">
                                        <img src="img/about-mission.jpg" alt="" class="img-fluid">
                                        <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
                                    </div>
                                    <h2 class="title"><a href="#"><fmt:message key="mission"/></a></h2>
                                    <p>
                                        <fmt:message key="home.msg9"/>
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="about-col">
                                    <div class="img">
                                        <img src="img/about-plan.jpg" alt="" class="img-fluid">
                                        <div class="icon"><i class="ion-ios-list-outline"></i></div>
                                    </div>
                                    <h2 class="title"><a href="#"><fmt:message key="plan"/></a></h2>
                                    <p>
                                        <fmt:message key="home.msg10"/>
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
                                <div class="about-col">
                                    <div class="img">
                                        <img src="img/about-vision.jpg" alt="" class="img-fluid">
                                        <div class="icon"><i class="ion-ios-eye-outline"></i></div>
                                    </div>
                                    <h2 class="title"><a href="#"><fmt:message key="vision"/></a></h2>
                                    <p>
                                        <fmt:message key="home.msg11"/>
                                    </p>
                                </div>
                            </div>

                        </div>

                    </div>
                </section><!-- #about -->

                <!--==========================
                  Services Section
                ============================-->
                <section id="services">
                    <div class="container">

                        <header class="section-header wow fadeInUp">
                            <h3><fmt:message key="services"/></h3>
                            <p><fmt:message key="home.msg12"/></p>
                        </header>

                        <div class="row">

                            <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                                <div class="icon"><i class="ion-ios-analytics-outline"></i></div>
                                <h4 class="title"><a href=""><fmt:message key="finddoc"/></a></h4>
                                <p class="description"><fmt:message key="home.msg13"/></p>
                            </div>
                            <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                                <div class="icon"><i class="ion-ios-bookmarks-outline"></i></div>
                                <h4 class="title"><a href=""><fmt:message key="becomeamember"/></a></h4>
                                <p class="description"><fmt:message key="home.msg14"/></p>
                            </div>
                            <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
                                <div class="icon"><i class="ion-ios-paper-outline"></i></div>
                                <h4 class="title"><a href=""><fmt:message key="bookmarkyourdoctor"/></a></h4>
                                <p class="description"><fmt:message key="home.msg15"/></p>
                            </div>
                            <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                                <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
                                <h4 class="title"><a href=""><fmt:message key="setanappointment"/></a></h4>
                                <p class="description"><fmt:message key="home.msg16"/></p>
                            </div>
                            <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                                <div class="icon"><i class="ion-ios-barcode-outline"></i></div>
                                <h4 class="title"><a href=""><fmt:message key="gethealthinformation"/></a></h4>
                                <p class="description"><fmt:message key="home.msg17"/></p>
                            </div>
                            <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                                <div class="icon"><i class="ion-ios-people-outline"></i></div>
                                <h4 class="title"><a href=""><fmt:message key="community"/></a></h4>
                                <p class="description"><fmt:message key="home.msg18"/></p>
                            </div>

                        </div>

                    </div>
                </section>
                <!--==========================
                  Facts Section
                ============================-->
                <section id="facts"  class="wow fadeIn">
                    <div class="container">

                        <header class="section-header">
                            <h3><fmt:message key="facts"/></h3>
                            <p><fmt:message key="home.msg19"/></p>
                        </header>

                        <div class="row counters">

                            <div class="col-lg-3 col-6 text-center">
                                <span data-toggle="counter-up">1</span>
                                <p><fmt:message key="healthservice"/></p>
                            </div>

                            <div class="col-lg-3 col-6 text-center">
                                <span data-toggle="counter-up">40</span>
                                <p><fmt:message key="medicalspecialities"/></p>
                            </div>

                            <div class="col-lg-3 col-6 text-center">
                                <span data-toggle="counter-up">696</span>
                                <p><fmt:message key="numberofdoctor"/></p>
                            </div>

                            <div class="col-lg-3 col-6 text-center">
                                <span data-toggle="counter-up">24</span>
                                <p><fmt:message key="hoursaday"/></p>
                            </div>
                        </div>

                        <div class="facts-img">
                            <img src="img/lab.jpg" alt="" class="img-fluid">
                        </div>

                    </div>
                </section>

                <!--==========================
                  Clients Section
                ============================-->
                <section id="clients" class="wow fadeInUp">
                    <div class="container">

                        <header class="section-header">
                            <h3><fmt:message key="clients"/></h3>
                        </header>

                        <div class="owl-carousel clients-carousel">

                            <img src="img/clients/client-9.png" alt="">
                            <img src="img/clients/client-10.png" alt="">
                            <img src="img/clients/client-11.png" alt="">
                            <img src="img/clients/client-12.png" alt="">
                            <img src="img/clients/client-13.png" alt="">
                            <img src="img/clients/client-14.png" alt="">
                            <img src="img/clients/client-15.png" alt="">
                        </div>

                    </div>
                </section>


                <!--Cai nay dung tam hinh thoi-->
                <section id="team">
                    <div class="container">
                        <div class="section-header wow fadeInUp">
                            <h3>Team</h3>
                            <p><fmt:message key="home.msg20"/></p>
                        </div>

                        <div class="row">
                            <div class="col-lg-3 col-md-6 wow fadeInUp">
                                <div class="member">
                                    <img src="img/team-1.jpg" class="img-fluid" alt="">
                                    <div class="member-info">
                                        <div class="member-info-content">
                                            <h4>Torai9</h4>
                                            <span>Chief Executive Officer</span>
                                            <div class="social">                          
                                                <a href=""><i class="fa fa-facebook"></i></a>
                                                <a href=""><i class="fa fa-google-plus"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 wow fadeInUp">
                                <div class="member">
                                    <img src="img/team-1.jpg" class="img-fluid" alt="">
                                    <div class="member-info">
                                        <div class="member-info-content">
                                            <h4>Hung Cao</h4>
                                            <span>Chief Executive Officer</span>
                                            <div class="social">
                                                <a href=""><i class="fa fa-facebook"></i></a>
                                                <a href=""><i class="fa fa-google-plus"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="member">
                                    <img src="img/team-2.jpg" class="img-fluid" alt="">
                                    <div class="member-info">
                                        <div class="member-info-content">
                                            <h4>Vinh Gay</h4>
                                            <span>Product Manager</span>
                                            <div class="social">
                                                <a href=""><i class="fa fa-facebook"></i></a>
                                                <a href=""><i class="fa fa-google-plus"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                                <div class="member">
                                    <img src="img/team-3.jpg" class="img-fluid" alt="">
                                    <div class="member-info">
                                        <div class="member-info-content">
                                            <h4>Bao Tran</h4>
                                            <span>CTO</span>
                                            <div class="social">
                                                <a href=""><i class="fa fa-twitter"></i></a>
                                                <a href=""><i class="fa fa-facebook"></i></a>
                                                <a href=""><i class="fa fa-google-plus"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                                <div class="member">
                                    <img src="img/team-4.jpg" class="img-fluid" alt="">
                                    <div class="member-info">
                                        <div class="member-info-content">
                                            <h4>Duyet Gay</h4>
                                            <span>Accountant</span>
                                            <div class="social">
                                                <a href=""><i class="fa fa-twitter"></i></a>
                                                <a href=""><i class="fa fa-facebook"></i></a>
                                                <a href=""><i class="fa fa-google-plus"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </section>


                <section id="contact" class="section-bg wow fadeInUp">
                    <div class="container">

                        <div class="section-header">
                            <h3><fmt:message key="contact"/></h3>
                            <p><fmt:message key="home.msg23"/></p>
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
                </section>

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
            </footer>

            <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        </div>

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

