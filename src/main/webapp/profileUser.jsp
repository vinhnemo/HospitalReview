<%-- 
    Document   : profileUser
    Created on : May 24, 2018, 1:43:34 AM
    Author     : MSI
--%>
<%@page import="DAO.*, DTO.*"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="lib/form/sidebar1.css">
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
        
        <jsp:include page="header.jsp"></jsp:include>
        
        <!--end of header -->

        <!--gogo-->


        <main id="main">
            <!-- De choi thoi -->
            <div class="nothing-special-dark"></div>
            <div class="container-fluid" style="height:800px;display: block;">
                <div id="wrapper">
                    <div id="sidebar-wrapper">
                        <ul class="sidebar-nav nav">
                            <li><h3>Options:</h3></li>
                            <li class="active"><a class="general" href="#general" data-toggle="tab"><i class="fa fa-gears"></i><fmt:message key="general"/></a></li>
                            <li><a class="edit" href="#edit" data-toggle="tab"><i class="fa fa-pencil"></i><fmt:message key="edityourprofile"/></a></li>
                            <li><a class="change" href="#change" data-toggle="tab"><i class="fa fa-key"></i><fmt:message key="changepassword"/></a></li>
                            <li><a class="bookmark" href="#bookmark" data-toggle="tab"><i class="fa fa-bookmark"></i><fmt:message key="bookmark"/></a></li>
                            <li><a class="other" href="#other" data-toggle="tab"><i class="fa fa-angle-double-right"></i><fmt:message key="other"/></a></li>
                        </ul>
                    </div>
                    <div class="page-content-wrapper">
                        <div class="container-fluid"><a class="btn btn-link" role="button" href="#menu-toggle" id="menu-toggle"><i class="fa fa-bars"></i></a>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="general">
                                            <div class="user-name">
                                                <div class="row" style="">             
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="user">
                                                            <div class="user-information">
                                                                <div class="userhead"><fmt:message key="personalinformation"/></div><br> 
                                                                <table>
                                                                    <tr><td><div class="userinfo"><fmt:message key="name"/>: </div></td><td> <div class="userinfo-text"><%= patient.getFname() + " " + patient.getLname()%></div></td></tr>
                                                                    <tr><td><div class="userinfo"><fmt:message key="email"/>: </div></td><td> <div class="userinfo-text"><%= patient.getEmail()%></div></td></tr>
                                                                    <tr><td><div class="userinfo"><fmt:message key="gender"/>: </div></td><td> <div class="userinfo-text"><%= patient.getSex()%></div></td></tr>
                                                                    <tr><td><div class="userinfo"><fmt:message key="address"/>: </div></td><td> <div class="userinfo-text"><%= patient.getAddress()%></div></div></td></tr>
                                                                    <tr><td><div class="userinfo"><fmt:message key="insurancenumber"/>: </div></td><td> <div class="userinfo-text">046556065</div></div></td></tr>
                                                                    <tr><td><div class="userinfo"><fmt:message key="language"/> :</div></td><td> <div class="userinfo-text"><%= patient.getLang()%></div></div></td></tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="edit">
                                            <div class="user-name">
                                                <div class="row" style="">             
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="user">
                                                            <div class="user-information">
                                                                <div class="userhead"><fmt:message key="edityourprofile"/></div><br>
                                                                <form class="change" action="patient" method="POST">
                                                                    <table>
                                                                        <!--use value=user profile trong db -->
                                                                        <tr><td><div class="userinfo"><fmt:message key="name"/>: </div></td><td><input class="form-change" type="text" name="fname" value="<%= patient.getFname() + " " + patient.getLname()%>"></td></tr>
                                                                        <tr><td><div class="userinfo"><fmt:message key="email"/>: </div></td><td><input class="form-change" type="email" name="email" value="<%= patient.getEmail()%>"></td></tr>
                                                                        <tr><td><div class="userinfo"><fmt:message key="gender"/>: </div></td>
                                                                            <td>                        
                                                                                <select class="form-change" name="gender">
                                                                                    <option value="male">Male</option>
                                                                                    <option value="female">Female</option>
                                                                                    <option value="other">Other</option>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td><div class="userinfo"><fmt:message key="address"/>: </div></td><td><input class="form-change" type="text" name="address" value="<%= patient.getAddress()%>"></td></tr>
                                                                        <tr><td><div class="userinfo"><fmt:message key="insurancenumber"/>: </div></td><td><input class="form-change" type="text" name="z" value="046556065"></td></tr>
                                                                        <tr><td><div class="userinfo"><fmt:message key="language"/>: </div></td><td><input class="form-change" type="text" name="language" value="<%= patient.getLang()%>"></td></tr>
                                                                    </table>
                                                                    <input class="save" type="hidden" value="<%= patient.getID()%>" name="id"> 
                                                                    <input class="save" type="submit" value="Save change" name="action"> 

                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="change">
                                            <div class="user-name">
                                                <div class="row" style="">             
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="user">
                                                            <div class="user-information">
                                                                <div class="userhead"><fmt:message key="changepassword"/></div><br>
                                                                <form class="change" action="" method="">
                                                                    <table>
                                                                        <!--use value=user profile trong db -->
                                                                        <tr><td><div class="userinfo"><fmt:message key="currentpassword"/>: </div></td><td><input class="form-change" type="password" name="password" placeholder="Your Current Password"></td></tr>
                                                                        <tr><td><div class="userinfo"><fmt:message key="newpassword"/>: </div></td><td><input class="form-change" type="password" name="password" placeholder="Input New Password"></td></tr>             
                                                                        <tr><td><div class="userinfo"><fmt:message key="confirmnewpassword"/>: </div></td><td><input class="form-change" type="password" name="password" placeholder="Confirm New Password"></td></tr>
                                                                        <tr><td></td><td><div class="validate-new-password"></div></td></tr>
                                                                    </table>
                                                                    <input class="save" type="submit" value="Confirm"> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="bookmark">
                                            <div class="user-name">
                                                <div class="row" style="">             
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="user">
                                                            <div class="user-information">
                                                                <div class="userhead"><fmt:message key="yourfavoritedoctor"/></div><br>
                                                                <% ArrayList<Doctor> listOfDoctor = new DoctorDAO().getAllDoctorBookmark(1);
                                                                        for (int i = 0; i < listOfDoctor.size(); i++) {%>
                                                                <table>
                                                                    <!--use value=user profile trong db -->
                                                                    <tr>
                                                                        <td><a target="_blank" href="sdsad"><%=listOfDoctor.get(i).getFname()%>&nbsp;<%=listOfDoctor.get(i).getLname()%> </td>
                                                                        <td>
                                                                            <form method="POST" action="controlBookmark">
                                                                                <input type="hidden" name="pID" value="1">
                                                                                <input type="hidden" name="dID" value="<%=listOfDoctor.get(i).getID()%>">
                                                                                <button class="remove" value="removebookmarkdoctor" name="action">Remove </button><hr>
                                                                            </form>

                                                                        </td>
                                                                    </tr>

                                                                </table>
                                                                <%}%>
                                                            </div>
                                                            <div class="user-information">
                                                                <div class="userhead"><fmt:message key="yourfavoritehospital"/></div><br>
                                                                <% ArrayList<Hospital> listOfHospital = new HospitalDAO().getAllHospitalBookmark(1);
                                                                        for (int i = 0; i < listOfHospital.size(); i++) {%>
                                                                <table>
                                                                    <!--use value=user profile trong db -->
                                                                    <td><a target="_blank" href="sdsad"><%=listOfHospital.get(i).getName()%> </td>
                                                                    <td>
                                                                        <form method="POST" action="controlBookmark">
                                                                            <input type="hidden" name="pID" value="1">
                                                                            <input type="hidden" name="hID" value="<%=listOfHospital.get(i).getID()%>">
                                                                            <button class="remove" value="removebookmarkhospital" name="action">Remove </button><hr>
                                                                        </form>

                                                                    </td>
                                                                </table> 
                                                                <%}%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="other">
                                            <div class="user-name">
                                                <div class="row" style="">             
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="user">
                                                            <div class="user-information">
                                                                <div class="userhead"><fmt:message key="deactivethisaccount"/></div>
                                                                <form class="change" action="" method="">
                                                                    <input class="save" type="submit" value="Deactive">
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
        <script src="js/main.js"></script>
        <script src="lib/form/sidebar1.js"></script>
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

