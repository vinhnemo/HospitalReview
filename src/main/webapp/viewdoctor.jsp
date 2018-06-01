<%-- 
    Document   : viewdoctor
    Created on : May 25, 2018, 1:17:59 AM
    Author     : NemoVinh
--%>

<%@page import="java.util.*, DAO.*, DTO.*"%>
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
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/search.css">
        <link rel="stylesheet" href="lib/form/sidebar.css">
        <link rel="stylesheet" href="lib/form/form.css">
        <link rel="stylesheet" href="lib/form/profile.css">

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
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
        <script src="lib/anime/anime.min.js"></script>
        <script src="lib/form/rating.js"></script>
        <script src="lib/modernizer/modernizr-2.6.2.min.js"></script>

        <script src="js/main.js"></script>
        <script src="js/modal.js"></script>
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

            Doctor doc;
            doc = (Doctor) session.getAttribute("prodoc");

            CommentDAO commentDAO = new CommentDAO();
            List<Comment> listOfComment = commentDAO.getAllComment(doc.getID());
        %> 

        <jsp:include page="header.jsp"></jsp:include>
            <!--end of header -->

            <main id="main">
                <!-- De choi thoi -->
                <div class="nothing-special-dark"></div>
                <div class="nothing-special-light"></div>
                <section class="card-section-imagia">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-4 col-sm-4" style="background-color: #eee; margin-right: 10px;">
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
                        <div class="col-md-3 col-sm-12" style="background-color: #FFF;">  
                            <div class="side-doctor">
                                <% if (patient != null) {%>
                                <h4><fmt:message key="option"/></h4><hr>
                                <div class="side-text"><fmt:message key="setanappointment"/>:</div>
                                <input class="side-button" type="submit" value="Make Appointment" onclick="window.location.href = '/appointmentRequest.jsp'"><hr>
                                <div class="side-text"><fmt:message key="addtobookmark"/>:</div>
                                <form method="POST" action="controlBookmark">
                                    <input type="hidden" name="pID" value="<%= patient.getID()%>">
                                    <input type="hidden" name="dID" value="<%= doc.getID()%>">
                                    <button class="side-button2" value="bookmarkdoctor" name="action">Bookmark </button><hr>
                                </form>
                                <% }%>

                                <% if (admin != null) {%>
                                <form method="post" action="activeReview" > 
                                    <div class="row" >  
                                        <div class="col-md-6" style="margin-left: -5%;">
                                            <div class="container-fluid form-group" >
                                                <input type="hidden" name="activateDoctorID" value="<%= doc.getID()%>" class="form-control">
                                                <button type="submit" class="side-button2" name="action" value="ActivateReview" style="padding: 5px 10px;">Enable Review</button>
                                            </div> 
                                        </div>     
                                        <div class="col-md-6" style="margin-left: -15%;" >
                                            <div class="container-fluid form-group" >
                                                <input type="hidden" name="deActivateDoctorID" value="<%= doc.getID()%>" class="form-control">
                                                <button type="submit" class="side-button2" name="action" value="DeactivateReview" style="padding: 5px 10px;" >Disable Review</button>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                                <% }%>
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
                        <div clsss="col-md-2 col-sm-12" style="margin-left: 30px;">
                            <% if (admin != null) {%>
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
                            <% } else {%>
                            <form>
                                <div class="form-group">
                                    <label for="name"><fmt:message key="firstname"/> </label>
                                    <input type="name" class="form-control" id="name" name="fname" value="<%= doc.getFname()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="name"><fmt:message key="lastname"/> </label>
                                    <input type="name" class="form-control" id="name" name="lname" value="<%= doc.getLname()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="address"><fmt:message key="gender"/></label>
                                    <input type="address" class="form-control" id="address"  name="gender" value="<%= doc.getSex()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="website"><fmt:message key="degree"/></label>
                                    <input type="website" class="form-control" id="website" name="degree" value="<%= doc.getDegree()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="website"><fmt:message key="acceptinsurance"/></label>
                                    <input type="website" class="form-control" id="website" name="insurance" value="<%= doc.getInsurance()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="name"><fmt:message key="specificspeciality"/> </label>
                                    <input type="name" class="form-control" id="name" name="speciality" value="<%= doc.getSpeciality()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="name"><fmt:message key="workhour"/> </label>
                                    <input type="name" class="form-control" id="name" name="hour" value="<%= doc.getHours()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="name"><fmt:message key="language"/> </label>
                                    <input type="name" class="form-control" id="name" name="language" value="<%= doc.getLang()%>" disabled>
                                </div>
                            </form>
                            <% }%>

                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="comment">
                        <div class="row">
                            <div class="col-md-10 col-sm-12">
                                <h3 class="page-header"><fmt:message key="comment"/></h3>
                                <hr>
                                <section class="comment-list">
                                    <!-- for commentDAO blah blah { -->
                                    <%
                                        if (listOfComment.size() > 0) {
                                            for (Comment comment : listOfComment) {
                                                Patient p = PatientDAO.getPatient(comment.getpID());

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
                                                        <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> May 30, 2018</time>
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
                                if (patient != null) {

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


    </body>
</html>

