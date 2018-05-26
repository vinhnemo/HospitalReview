<%-- 
    Document   : admin
    Created on : May 25, 2018, 10:40:02 PM
    Author     : Duyet Pham
--%>

<%@page import="DAO.DoctorDAO"%>
<%@page import="DTO.Doctor"%>
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
        <link rel="stylesheet" href="lib/form/profile.css">
    </head>

    <body>

        <header id="header">
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="#intro" class="scrollto">Doctor STRANGE</a></h1>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-has-children menu-active"><a href="#">Find Doctor</a>
                            <ul>
                                <li>
                                    <div class="dropdown-form">
                                        <form action="doctor" method="POST">
                                            <h3>Find Your Doctor</h3>
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="Search doctors by name, speciality"/>                               
                                            <input class="dropdown-button" type="submit" value="Search Doctor">
                                        </form>
                                    </div>
                                </li>
                            </ul> 
                        </li>
                        <li><a href="#" onclick="document.getElementById('patient').style.display = 'block';document.getElementById('hospital').style.display = 'none';document.getElementById('doctor').style.display = 'none'">Patient </a></li>
                        <li><a href="#" onclick="document.getElementById('hospital').style.display = 'block';document.getElementById('patient').style.display = 'none';document.getElementById('doctor').style.display = 'none'">Hospital </a></li>
                        <li><a href="#" onclick="document.getElementById('doctor').style.display = 'block';document.getElementById('hospital').style.display = 'none';document.getElementById('patient').style.display = 'none'">Doctor </a></li>
                        <li><a href="#">Specialty Category</a></li>
                        <li class="menu-active"><a href="#" >Sign out</a></li>                     
                    </ul>
                </nav>
            </div>
        </header>
        <!--end of header -->

        <main id="main">
            <!-- De choi thoi -->
            <div class="nothing-special-dark"></div>

            <section class="card-section-imagia">

                <div class="container" id="doctor">
                    <h3 class="page-header">List of Doctors</h3>
                    <div class="row">

                        <div class="col-md-4" >
                            <div class="doctor-name" style="background-color: white;  margin-right: 1%; margin-bottom: 1%;">
                                <div class="row" >             
                                    <div class="col-md-4" >
                                        <div class="container" style="margin-top: 15%; ">
                                            <img src="" alt="" style="background-color: #17a2b8; border: 1px solid #000; border-radius:50%;
                                                 display:block;
                                                 height:90px;
                                                 width:90px; ">
                                            <button type="submit" onclick="document.getElementById('detaildoctor').style.display = 'block'"  style=" background-color: #4CAF50; border: none; color: white; padding: 2px 30px; text-align: center; font-size: 16px; margin: 4px 2px; cursor: pointer;"> Edit</button>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="container" style="margin-top: 7%; ">
                                            <h4><strong> Nguyen Van Sinh </strong></h4>
                                            <p>DOB: 11-01-1997<br> Gender: GAY</p> 
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4" >
                            <div class="doctor-name" style="background-color: white;  margin-right: 1%; margin-bottom: 1%;">
                                <div class="row" >             
                                    <div class="col-md-4" >
                                        <div class="container" style="margin-top: 15%; ">
                                            <img src="" alt="" style="background-color: #17a2b8; border: 1px solid #000; border-radius:50%;
                                                 display:block;
                                                 height:90px;
                                                 width:90px; ">
                                            <button type="submit" onclick="document.getElementById('detaildoctor').style.display = 'block'"  style=" background-color: #4CAF50; border: none; color: white; padding: 2px 30px; text-align: center; font-size: 16px; margin: 4px 2px; cursor: pointer;"> Edit</button>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="container" style="margin-top: 7%; ">
                                            <h4><strong> Nguyen Van Sinh </strong></h4>
                                            <p>DOB: 11-01-1997<br> Gender: GAY</p> 
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4" >
                            <div class="doctor-name" style="background-color: white;  margin-right: 1%; margin-bottom: 1%;">
                                <div class="row" >             
                                    <div class="col-md-4" >
                                        <div class="container" style="margin-top: 15%; ">
                                            <img src="" alt="" style="background-color: #17a2b8; border: 1px solid #000; border-radius:50%;
                                                 display:block;
                                                 height:90px;
                                                 width:90px; ">
                                            <button type="submit" onclick="document.getElementById('detaildoctor').style.display = 'block'"  style=" background-color: #4CAF50; border: none; color: white; padding: 2px 30px; text-align: center; font-size: 16px; margin: 4px 2px; cursor: pointer;"> Edit</button>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="container" style="margin-top: 7%; ">
                                            <h4><strong> Nguyen Van Sinh </strong></h4>
                                            <p>DOB: 11-01-1997<br> Gender: GAY</p> 
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>                    
                    </div>
                </div>

                <div class="container" style="display: none; " id="patient">
                    <h3 class="page-header">List of Patients</h3>
                    <div class="row">

                        <div class="col-md-4" >
                            <div class="doctor-name" style="background-color: white;  margin-right: 1%; margin-bottom: 1%;">
                                <div class="row" >             
                                    <div class="col-md-4" >
                                        <div class="container" style="margin-top: 15%; ">
                                            <img src="" alt="" style="background-color: #17a2b8; border: 1px solid #000; border-radius:50%;
                                                 display:block;
                                                 height:90px;
                                                 width:90px; ">
                                            <button type="submit" onclick="document.getElementById('detailpatient').style.display = 'block'"  style=" background-color: #4CAF50; border: none; color: white; padding: 2px 30px; text-align: center; font-size: 16px; margin: 4px 2px; cursor: pointer;"> Edit</button>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="container" style="margin-top: 7%; ">
                                            <h4><strong> Nguyen Van Sinh </strong></h4>
                                            <p>DOB: 11-01-1997<br> Gender: GAY</p> 
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>     

                        <div class="col-md-4" >
                            <div class="doctor-name" style="background-color: white;  margin-right: 1%; margin-bottom: 1%;">
                                <div class="row" >             
                                    <div class="col-md-4" >
                                        <div class="container" style="margin-top: 15%; ">
                                            <img src="" alt="" style="background-color: #17a2b8; border: 1px solid #000; border-radius:50%;
                                                 display:block;
                                                 height:90px;
                                                 width:90px; ">
                                            <button type="submit" onclick="document.getElementById('detailpatient').style.display = 'block'"  style=" background-color: #4CAF50; border: none; color: white; padding: 2px 30px; text-align: center; font-size: 16px; margin: 4px 2px; cursor: pointer;"> Edit</button>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="container" style="margin-top: 7%; ">
                                            <h4><strong> Nguyen Van Sinh </strong></h4>
                                            <p>DOB: 11-01-1997<br> Gender: GAY</p> 
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>     
                    </div>
                </div>


                <div class="container" style="display: none; " id="hospital">
                    <h3 class="page-header">List of Hospitals</h3>
                    <div class="row">

                        <div class="col-md-4" >
                            <div class="doctor-name" style="background-color: white;  margin-right: 1%; margin-bottom: 1%;">
                                <div class="row" >             
                                    <div class="col-md-12">
                                        <div class="container" style="margin-top: 7%; ">
                                            <h4><strong> Tu Vu Hospital </strong></h4>
                                            <p><strong>Address: </strong>43 abcxy, district 3, HCM city<br> <strong>Phone: </strong>0199999999</p> 
                                            <button type="submit" onclick="document.getElementById('detailhospital').style.display = 'block'"  style=" background-color: #4CAF50; border: none; color: white; padding: 2px 30px; text-align: center; font-size: 16px; margin-top:0; margin-bottom: 4px; cursor: pointer;"> Edit</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>


            </section>
            
             <%-- pop up --%>
            <div id="detaildoctor" class="addedform">
                <form class="form-content" method="post" action="">
                    <div class="formContainer">
                        <h1>Doctor Information</h1>
                        <hr>
                        <div class="container" >
                            <label><b>ID: 15071</b></label>
                        </div>
                        <div class="row" >  
                            <div class="col-md-6" >
                                <div class="container" >
                                    <label><b>First Name: Sinh </b></label>
                                    <input type="text" placeholder="Enter Your New First Name" name="dfname" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="container" >
                                    <label><b>Last Name: Nguyen Van </b></label>
                                    <input type="text" placeholder="Enter Your New Last Name" name="dlname" required>
                                </div>
                            </div>
                        </div>

                        <div class="row" >  
                            <div class="col-md-6" >
                                <div class="container" >
                                    <label><b>Gender: Female </b></label>
                                    <select>
                                        <option value="Famale">Female</option>
                                        <option value="Male">Male</option>
                                    </select>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="container" >
                                    <label><b>Degree: Tao có bằng thạc sĩ </b></label>
                                    <input type="text" placeholder="Enter Your New Degree" name="ddegree" required>
                                </div>
                            </div>
                        </div>

                        <div class="row" >  
                            <div class="col-md-6" >
                                <div class="container" >
                                    <label><b>Accepted insurance: </b></label>
                                    <input type="checkbox" value="dinsure">

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="container" >
                                    <label><b>Specific specialty: Metal </b></label>
                                    <select> <%-- dòng for lấy từ list ra --%>
                                        <option value="">Bệnh gì</option>
                                        <option value="">Bệnh gì</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row" >  
                            <div class="col-md-6" >
                                <div class="container" >
                                    <label><b>Office Hours: 10am-24pm </b></label>
                                    <input type="text" placeholder="Enter Your New office hours" name="dhour" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="container" >
                                    <label><b>Language: English </b></label>
                                    <input type="text" placeholder="Enter Your New Language" name="dlang" required>
                                </div>
                            </div>
                        </div>

                        <div class="row" >  
                            <div class="col-md-6" >
                                <div class="container" >
                                    <label><b>Office Hours: 10am-24pm </b></label>
                                    <input type="text" placeholder="Enter Your New office hours" name="dhour" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="container" >
                                    <label><b>Language: English </b></label>
                                    <input type="text" placeholder="Enter Your New Language" name="dlang" required>
                                </div>
                            </div>
                        </div>

                        <div class="clear" >  
                            <div class="clear">
                                <form class="form-content" method="post" action="controlbookmark"> 
                                    <button type="submit" name="action" value="ActivateReview" >Active Review</button>
                                    <button type="submit" name="action" value="DeactivateReview" >Deactive Review</button>
                                </form>
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
                            <p> Man tao cá mày không được vui nữa kể từ khi cái này tao đến. Nhìn tao đứng trên top cái miệng mày câm như hến .Sẽ có ngày tới mày nhưng việc đầu tiên trước hết. Mày muốn thắng trò chơi này việc đầu tiên phải làm là giết tao chết</p>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">About us</a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">Services</a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">Terms of service</a></li>
                                <li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy policy</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h4>Contact Us</h4>
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
                            <h4>Other</h4>
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

            <%-- pop up --%>




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
