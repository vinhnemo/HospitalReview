     
<%-- 
    Document   : register
    Created on : May 16, 2018, 5:46:22 PM
    Author     : MSI
--%>

<%@page import="DTO.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}"  />
<%String language = request.getParameter("language"), english = "", vietnamese = "", lang = "";
    if (language == null) {
        language = "en_US";
    }
    if (language.equals("en_US")) {
        lang = "English";
        english = "active";
    } else if (language.equals("vi_VN")) {
        lang = "Tiếng Việt";
        vietnamese = "active";
    }
%>
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" />
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
        <link rel="stylesheet" href="lib/form/form.css">
    </head> 

    <body>
        <%
            Patient patient = new Patient();
            boolean filled = false;
            if (request.getAttribute("patient") != null) {
                patient = (Patient) request.getAttribute("patient");
                filled = true;
            }
        %>
        <!-- Header -->
        <header id="header">
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="home.jsp" class="scrollto">Doctor STRANGE</a></h1>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-has-children menu-active"><a href="http://localhost:8080/doctor">Find Doctor</a>
                            <ul>
                                <li>
                                    <div class="dropdown-form">
                                        <form action="doctor" method="POST">
                                            <h3><fmt:message key="finddoc"/></h3>
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="Search doctors by name, speciality"/>                               
                                            <input class="dropdown-button" type="submit" value="Search Doctor">
                                        </form>
                                    </div>
                                </li>
                            </ul> 
                        </li>
                        <li><a href="#"><fmt:message key="appt"/></a></li>
                        <li class="menu-has-children"><a href=""><fmt:message key="language"/></a>
                            <ul>
                                <li><a href="register.jsp?language=en_US">English</a></li>
                                <li><a href="register.jsp?language=vi_VN">Tiếng Việt</a></li>
                            </ul>
                        </li>
                        <li><a href="#footer"><fmt:message key="contact"/></a></li>
                        <li class="menu-active"><a href="login.jsp"><fmt:message key="signinup"/></a></li>                     
                    </ul>
                </nav>
            </div>
        </header>

        <!-- MAIN : form -->
        <main id="main">
            <div class="login-dark">
                <form class="register" method="post" style="width:600px;">
                    <h1>Register Account</h1>
                    <br>
                    <% if (filled) {%>
                    <div class="form-group">
                        <input class="form-control d-inline" type="text" name="fname" value="<%=patient.getFname()%>" style="width:200px;margin:0px 0px;" required><input class="form-control d-inline" type="text" name="lname" value="<%=patient.getLname()%>" style="width:200px;margin:0px 10px;" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="email" name="email" value="<%=patient.getEmail()%>" onchange="email_validate(this.value);" required>
                        <div class="status" id="status"></div>
                    </div>
                    <% } else {%>
                    <div class="form-group">
                        <input class="form-control d-inline" type="text" name="fname" placeholder="First Name" style="width:200px;margin:0px 0px;" required><input class="form-control d-inline" type="text" name="lname" placeholder="Last Name" style="width:200px;margin:0px 10px;" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="email" name="email" placeholder="Email" onchange="email_validate(this.value);" required>
                        <div class="status" id="status"></div>
                    </div>
                    <% }%>
                    <div class="form-group"><input class="form-control d-inline-flex" type="password" name="password" placeholder="Password" style="width:200px;" minlength="4" maxlength="16" id="pass1" required></div>
                    <div class="form-group">
                        <input class="form-control d-inline-flex" type="password" name="password2" placeholder="Confirm Password" style="width:200px;" minlength="4" maxlength="16" id="pass2" onchange="checkPass(); return false;" required>
                        <span id="confirmMessage" class="confirmMessage"></span>
                    </div>
                    <div class="form-group">
                        <label style="color:#65757d; margin:0px 10px;">Gender:&nbsp;</label>
                        <select class="form-control d-inline" name="gender" style="width:120px;color:#65757d;">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <!-- <div class="form-group"><input class="form-control" type="date" style="color:#65757d;"></div> -->
                    <% if (filled) {%>
                    <div class="form-group">
                        <input class="form-control" type="text" name="address" value="<%=patient.getAddress()%>" style="width:420px;margin:0px 0px;" onkeyup = "add_validate(this.value)" required>
                        <div id="statusAdd"></div>
                    </div>
                    <% } else {%>
                    <div class="form-group">
                        <input class="form-control" type="text" name="address" placeholder="Address" style="width:420px;margin:0px 0px;" onkeyup = "add_validate(this.value)" required>
                        <div id="statusAdd"></div>
                    </div>
                    <% }%>
                    <input type="hidden" name="language" value="<%=language%>">
                    <input type="hidden" name="type" value="patient">
                    <div class="form-group">
                        <hr>
                        <input type="checkbox" required name="terms" onchange="this.setCustomValidity(validity.valueMissing ? 'Please indicate that you accept the Terms and Conditions' : '');" id="field_terms">   <label for="terms">I agree with the <a href="terms.php" title="You may read our terms and conditions by clicking on this link">terms and conditions</a> for Registration.</label>
                    </div>

                    <small>You will receive an email to complete the registration and validation process.</small>
                    <small>Be sure to check your spam folders. </small>
                    <div class="form-group"><button class="btn btn-primary btn-block" type="submit" name="action" value="Signup">Sign Up</button></div>
                    <a href="login" class="forgot">Already have account? Sign in.</a>
                </form>
            </div>
        </main>
        <!-- Footer -->
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
            <script src="js/registration.js"></script>
            <script src="js/main.js"></script>
    </body>
</html>

