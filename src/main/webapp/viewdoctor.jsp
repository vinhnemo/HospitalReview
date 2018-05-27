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
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/search.css">
        <link rel="stylesheet" href="lib/form/sidebar.css">
        <link rel="stylesheet" href="lib/form/form.css">
        <link rel="stylesheet" href="lib/form/profile.css">
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
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="Search doctors by name, speciality"/>                               
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
                        <li class="menu-active"><a href="#" data-toggle="modal" data-target="#myLogin" data-keyboard="true"><fmt:message key="signinup"/></a></li>                     
                    </ul>
                </nav>
            </div>
        </header>
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
                        <div class="col-md-4 col-sm-4" style="background-color: #FFF;">  
                            <div class="side-doctor">
                                <h4><fmt:message key="option"/></h4><hr>
                                <div class="side-text"><fmt:message key="setanappointment"/>:</div>
                                <input class="side-button" type="submit" value="Make Appointment"><hr>
                                <div class="side-text"><fmt:message key="addtobookmark"/>:</div>
                                <input class="side-button2" type="submit" value="Bookmark"><hr>
                                <%
                                    DoctorDAO doctorDAO = new DoctorDAO();
                                    Doctor doctor = doctorDAO.getDoctor(1);
                                    if (doctor.getAllowReview() == 1) {%>  

                                <div class="side-text"><fmt:message key="yourrating"/>:</div>
                                <section class='rating-widget'>
                                    <!-- Rating Stars Box -->
                                    <div class='rating-stars text-center'>
                                        <ul id='stars'>
                                            <li class='star' title='Poor' data-value='1'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                            <li class='star' title='Fair' data-value='2'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                            <li class='star' title='Good' data-value='3'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                            <li class='star' title='Excellent' data-value='4'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                            <li class='star' title='WOW!!!' data-value='5'>
                                                <i class='fa fa-star fa-fw'></i>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="text-msg"></div>
                                </section>
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
                                                <figcaption class="text-center"><%= p.getFname() + " " + p.getFname()%></figcaption>
                                            </figure>
                                        </div>
                                        <div class="col-md-8 col-sm-9" style="margin-left:20px; ">
                                            <div class="panel panel-default arrow left">
                                                <div class="panel-body">
                                                    <header class="text-left">
                                                        <div class="comment-user"><i class="fa fa-user"></i> <%= p.getFname() + " " + p.getFname()%> </div> 
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
                            if (doctor.getAllowReview() == 1) {%>  
                        <div class="comment-box">
                            <div class="row" style="margin-top: 30px;">
                                <div class="col-md-8">
                                    <div class="widget-area no-padding blank">
                                        <div class="status-upload">
                                            <form action="comment" method="POST">
                                                <textarea placeholder="What are your opinion about him/her" ></textarea>
                                                <button type="submit" class="btn btn-success green" name="action" value="addComment"><i class="fa fa-share"></i>Post</button>
                                            </form>
                                        </div><!-- Status Upload  -->
                                    </div><!-- Widget Area -->
                                </div>
                            </div>
                        </div>
                        <% }%>
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
                                <strong>Phone:</strong> 911 <br>
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

