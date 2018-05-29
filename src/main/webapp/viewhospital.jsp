<%-- 
    Document   : viewhospital
    Created on : May 26, 2018, 7:28:06 PM
    Author     : NemoVinh
--%>

<%@page import="DAO.*, DTO.*"%>
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
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/search.css">
        <link rel="stylesheet" href="lib/form/sidebar.css">
        <link rel="stylesheet" href="lib/form/form.css">
        <link rel="stylesheet" href="lib/form/profile.css">
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

            Hospital hos = (Hospital) session.getAttribute("prohos");
            ////            Doctor doc;
            //            int i = 1;
            //            HospitalDAO dao  = new HospitalDAO();
            //            hos = (Hospital) dao.getHospital(i); 


        %> 
        <jsp:include page="header.jsp"></jsp:include>
        
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
                                        <h3 class="name"><%= hos.getName()%></h3>
                                        <div class="doctor-text"> DOB: 11-01-1997<br> <fmt:message key="address"/> <%= hos.getAddress()%></div>
                                    </div>
                                </div>
                            </div>
                            <div class="doctor-information">
                                <div class="head"><fmt:message key="personalinformation"/></div><br> 
                                <table>
                                    <!--                                    <tr><td><div class="info">Working Place: </div></td><td> <div class="info-text">Abc hospital</div></td></tr>
                                                                        <tr><td><div class="info">Speciality: </div></td><td> <div class="info-text">Neurology</div></td></tr>-->
                                    <tr><td><div class="info"><fmt:message key="hospitaladminname"/> :  </div></td><td> <div class="info-text"><%= hos.getAdName()%> </div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="hospitaladminemail"/>: </div></td><td> <div class="info-text"><%= hos.getAdEmail()%></div></div></td></tr>
                                    <tr><td><div class="info"><fmt:message key="website"/> : </div></td><td> <div class="info-text"><%= hos.getWebsite()%></div></div></td></tr>
                                    <!--                                    <tr><td><div class="info">Language: </div></td><td> <div class="info-text"></div></div></td></tr>
                                                                        <tr><td><div class="info">Work-hour: </div></td><td> <div class="info-text"></div></div></td></tr>-->
                                </table>
                            </div>
                        </div>

                    </div>
                </div>




                <!--edit-->

                <form action="hospital" method="POST">
                    <div class="form-group">
                        <label for="name"><fmt:message key="name"/></label>
                        <input type="name" class="form-control" id="name" name="name" value="<%= hos.getName()%>">
                    </div>
                    <div class="form-group">
                        <label for="address"><fmt:message key="address"/></label>
                        <input type="address" class="form-control" id="address"  name="address" value="<%= hos.getAddress()%>">
                    </div>
                    <div class="form-group">
                        <label for="website"><fmt:message key="website"/></label>
                        <input type="website" class="form-control" id="website" name="website" value="<%= hos.getWebsite()%>">
                    </div>
                    <div class="form-group">
                        <label for="name"><fmt:message key="hospitaladminname"/></label>
                        <input type="name" class="form-control" id="name" name="admin" value="<%= hos.getAdName()%>" >
                    </div>
                    <div class="form-group">
                        <label for="email"><fmt:message key="hospitaladminemail"/> </label>
                        <input type="email" class="form-control" id="email" name="email" value="<%= hos.getAdEmail()%>">
                    </div>
                    <input type="hidden" name="id" value="<%= hos.getID()%>" >
                    <input type="hidden" name="action" value="update">
                    <button type="submit" class="btn btn-default"><fmt:message key="edit"/></button>
                </form>
                <form action="hospital" method="POST">
                    <input type="hidden" name="id" value="<%= hos.getID()%>" >
                    <input type="hidden" name="action" value="remove">
                    <button type="submit" class="btn btn-default"><fmt:message key="remove"/></button>
                </form>       
                <form method="POST" action="controlBookmark">
                    <input type="hidden" name="pID" value="<%= patient.getID()%>">                      
                    <input type="hidden" name="hID" value="<%= hos.getID()%>">
                    <button class="side-button2" value="bookmarkhospital" name="action"><fmt:message key="bookmark"/> </button><hr>
                </form> 
                <!--end of edit-->
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
        


    </body>
</html>
