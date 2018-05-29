<%-- 
    Document   : viewdoctor
    Created on : May 25, 2018, 1:17:59 AM
    Author     : NemoVinh
--%>

<%@page import="java.util.*"%>
<%@page import="DAO.*"%>
<%@page import="DTO.*"%>
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
        <link rel="stylesheet" href="lib/form/profile.css">
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
                                <li><a href="viewdoctor.jsp?language=en_US">English</a></li>
                                <li><a href="viewdoctor.jsp?language=vi_VN">Tiếng Việt</a></li>
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
        <!--end of header -->

        <%
            Doctor doc;
            doc = (Doctor) session.getAttribute("prodoc");
            //            Doctor doc;
            //            int i = 1;
            //            DoctorDAO dao  = new DoctorDAO();
            //            doc = (Doctor) dao.getDoctor(i);

            CommentDAO commentDAO = new CommentDAO();
            List<Comment> listOfComment = commentDAO.getAllComment(doc.getID());
            PatientDAO patientDAO = new PatientDAO();
//                Patient patient = null;
            if (session.getAttribute("patient") != null) {
                patient = (Patient) session.getAttribute("patient");
            }
        %> 

        <main id="main">
            <!-- De choi thoi -->
            <div class="nothing-special-dark"></div>
            <div class="nothing-special-light"></div>
            <section class="card-section-imagia">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-sm-7" style="background-color: #eee; margin-right: 10px;">
                            <div class="doctor-name">
                                <div class="row" style="margin-top: 40px;">             
                                    <div class="col-md-4 col-sm-10">
                                        <div class="doctor-pic">
                                            <img src="" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-sm-10">
                                        <h3 class="name"><%= doc.getLname() + " " + doc.getFname()%></h3>
                                        <div class="doctor-text"> <fmt:message key="dob"/>: 11-01-1997<br> <fmt:message key="gender"/>: <%= doc.getSex()%></div>
                                    </div>
                                </div>
                            </div>
                            <div class="doctor-information">
                                <div class="head"><fmt:message key="personalinformation"/></div><br> 
                                <table>
                                    <tr><td><div class="info"><fmt:message key="workingplace"/>: </div></td><td> <div class="info-text">Abc hospital</div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="speciality"/>: </div></td><td> <div class="info-text">Neurology</div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="specificspeciality"/>:  </div></td><td> <div class="info-text"><%= doc.getSpeciality()%> </div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="degree"/>: </div></td><td> <div class="info-text"><%= doc.getDegree()%></div></div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="insurance"/>:  </div></td><td> <div class="info-text"><%= doc.getInsurance()%></div></div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="language"/>: </div></td><td> <div class="info-text"><%= doc.getLang()%></div></div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="workhour"/>: </div></td><td> <div class="info-text"><%= doc.getHours()%></div></div></td></tr>
                                </table>
                            </div>
                        </div>

                        <form action="doctor" method="POST">
                            <div class="form-group">
                                <label for="name"><fmt:message key="firstname"/> </label>
                                <input type="name" class="form-control" id="name" name="fname" value="<%= doc.getFname()%>">
                            </div>
                            <div class="form-group">
                                <label for="name"><fmt:message key="lastname"/> </label>
                                <input type="name" class="form-control" id="name" name="lname" value="<%= doc.getLname()%>">
                            </div>
                            <div class="form-group">
                                <label for="address"><fmt:message key="gender"/></label>
                                <input type="address" class="form-control" id="address"  name="gender" value="<%= doc.getSex()%>">
                            </div>
                            <div class="form-group">
                                <label for="website"><fmt:message key="degree"/></label>
                                <input type="website" class="form-control" id="website" name="degree" value="<%= doc.getDegree()%>">
                            </div>
                            <div class="form-group">
                                <label for="website"><fmt:message key="acceptinsurance"/></label>
                                <input type="website" class="form-control" id="website" name="insurance" value="<%= doc.getInsurance()%>">
                            </div>
                            <div class="form-group">
                                <label for="name"><fmt:message key="specificspeciality"/> </label>
                                <input type="name" class="form-control" id="name" name="speciality" value="<%= doc.getSpeciality()%>" >
                            </div>
                            <div class="form-group">
                                <label for="name"><fmt:message key="workhour"/> </label>
                                <input type="name" class="form-control" id="name" name="hour" value="<%= doc.getHours()%>">
                            </div>
                            <div class="form-group">
                                <label for="name"><fmt:message key="language"/> </label>
                                <input type="name" class="form-control" id="name" name="language" value="<%= doc.getLang()%>">
                            </div>
                            <input type="hidden" name="id" value="<%= doc.getID()%>" >
                            <input type="hidden" name="action" value="updateDoctor">
                            <button type="submit" class="btn btn-default"><fmt:message key="edit"/></button>
                        </form>
                        <form action="doctor" method="POST">
                            <input type="hidden" name="id" value="<%= doc.getID()%>" >
                            <input type="hidden" name="action" value="remove">
                            <button type="submit" class="btn btn-default"><fmt:message key="remove"/></button>
                        </form>    

                        <div class="col-md-4 col-sm-4" style="background-color: #FFF;">  
                            <div class="side-doctor">
                                <h4><fmt:message key="option"/></h4><hr>
                                <div class="side-text"><fmt:message key="setanappointment"/>:</div>
                                <input class="side-button" type="submit" value="Make Appointment"><hr>
                                <div class="side-text"><fmt:message key="addtobookmark"/>:</div>
                                <button class="side-button2" type="submit" >Bookmark</button><hr>
                                <%
                                    DoctorDAO doctorDAO = new DoctorDAO();
                                    Doctor doctor = doctorDAO.getDoctorReview(doc.getID());
                                    if (doctor.getAllowReview() == 1) {%>  

                                <div class="side-text"><fmt:message key="yourrating"/>:</div>
                                <form action="rate" method="POST">
                                    <section class='rating-widget'>
                                        <!-- Rating Stars Box -->
                                        <div class='rating-stars text-center'>
                                            <ul id='stars' name="action"  value="addRate" onclick="submit()">
                                                <li class='star' title='Poor' data-value='1' value="1" name="rate">
                                                    <i class='fa fa-star fa-fw'></i>
                                                </li>
                                                <li class='star' title='Fair' data-value='2' value="2" name="rate">
                                                    <i class='fa fa-star fa-fw'></i>
                                                </li>
                                                <li class='star' title='Good' data-value='3' value="3" name="rate">
                                                    <i class='fa fa-star fa-fw'></i>
                                                </li>
                                                <li class='star' title='Excellent' data-value='4' value="4" name="rate">
                                                    <i class='fa fa-star fa-fw'></i>
                                                </li>
                                                <li class='star' title='WOW!!!' data-value='5' value="5" name="rate">
                                                    <i class='fa fa-star fa-fw'></i>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="text-msg"></div>
                                    </section>
                                </form>
                                <% } %>
                            </div>
                        </div>
                    </div>

                    <div class="comment">
                        <div class="row">
                            <div class="col-md-10">
                                <h3 class="page-header"><fmt:message key="comment"/></h3>
                                <hr>
                                <section class="comment-list">
                                    <!-- for commentDAO blah blah { -->
                                    <%
                                        if (listOfComment.size() > 0) {
                                            for (Comment comment : listOfComment) {
                                                Patient p = patientDAO.getPatient(comment.getpID());

                                    %>
                                    <article class="row">
                                        <div class="col-md-2 col-sm-2">
                                            <figure class="thumbnail">
                                                <figcaption class="text-center"><%= p.getFname() + " " + p.getLname()%></figcaption>
                                            </figure>
                                        </div>
                                        <div class="col-md-8 col-sm-9" style="margin-left:20px; ">
                                            <div class="panel panel-default arrow left">
                                                <div class="panel-body">
                                                    <header class="text-left">
                                                        <div class="comment-user"><i class="fa fa-user"></i> <%= p.getFname() + " " + p.getLname()%> </div> 
                                                        <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> Dec 16, 2014</time>
                                                    </header> 
                                                    <div class="comment-post">
                                                        <p>
                                                            <%= comment.getComment()%>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!-- end loop -->
                                    <% }
                                        }
                                    %>

                                </section>
                                <!--end comment list-->
                            </div>
                        </div>
                        <!--comment box-->

                        <%
                            if (doctor.getAllowReview() == 1) {
                                if (session.getAttribute("patient") != null) {

                        %>  
                        <div class="comment-box">
                            <div class="row" style="margin-top: 30px;">
                                <div class="col-md-8">
                                    <div class="widget-area no-padding blank">
                                        <div class="status-upload">
                                            <form action="comment" method="POST">
                                                <textarea placeholder="What are your opinion about him/her" name="comment" ></textarea>
                                                <input type="hidden" name="did" value="<%= doc.getID()%>" >
                                                <input type="hidden" name="pid" value="<%= patient.getID()%>" >
                                                <button type="submit" class="btn btn-success green" name="action" value="addComment"><i class="fa fa-share"></i>Post</button>
                                            </form>
                                        </div><!-- Status Upload  -->
                                    </div><!-- Widget Area -->
                                </div>
                            </div>
                        </div>
                        <% }
                                }%>
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
        <script src="js/editform.js"></script>
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

