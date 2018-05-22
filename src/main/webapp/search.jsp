<%-- 
    Document   : home
    Created on : May 16, 2018, 4:41:41 PM
    Author     : MSI
--%>
<%@page import="User.DTO.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="User.DAO.DoctorDAO"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="lib/form/form.css">
        <link rel="stylesheet" href="lib/form/sidebar.css">
        <script src="lib/modernizer/modernizr-2.6.2.min.js"></script>
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
                                        <form action="" method="">
                                            <h3>Find Your Doctor</h3>
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="Search doctors by name, speciality"/>                               
                                            <input class="dropdown-button" type="submit" value="Search Doctor">
                                        </form>
                                    </div>
                                </li>
                            </ul> 
                        </li>
                        <li><a href="#">Appointment</a></li>
                        <li class="menu-has-children"><a href="">Language</a>
                            <ul>
                                <li><a href="#">English</a></li>
                                <li><a href="#">Tiếng Việt</a></li>
                            </ul>
                        </li>
                        <li><a href="#contact">Contact Us</a></li>
                        <li class="menu-active"><a href="login.jsp">Sign In/Sign Up</a></li>                     
                    </ul>
                </nav>
            </div>
        </header>
        <!--end of header -->
        <main id="main">
            <!-- De choi thoi -->
            <div class="nothing-special"></div>
            <div class="search-keyword">
                <div class="keyword"> 1 result found for keyword: Sinh </div>
            </div>  
            <!-- !! -->
            <section class="card-section-imagia">
                <div class="container">
                    <div class="row" id="sidebar">
                    <div class="col-sm-9">
                    <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
                    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">

                        <h4>Filter Your Result</h4><hr>
                        <div>
                            Your nearest location 
                            <div class="search-container">
                                <input type="text" name="search-bar" placeholder="Search..." class="search-input">
                                <button class="btn btn-light search-btn" type="button"> 
                                    <i class="fa fa-search"></i>
                                </button>
                            </div><hr>
                            Gender<br>
                            <select class="side-select"> <!-- apply from db -->
                                <option value="1">Male</option>
                                <option value="2">Female</option>
                            </select><hr>
                            Last Name<br>
                            <select class="side-select"> <!-- apply from db -->
                                <option value="1">A ->Z</option>
                                <option value="2">Z->A</option>
                            </select><hr>
                            Speciality<br>
                            <select class="side-select"> <!-- apply from db -->
                                <option value="Crazy">Crazy</option>
                                <option value="Mad">Mad</option>
                            </select><hr>
                            Language<br>
                            <select class="side-select"> <!-- apply from db -->
                                <option value="en">English</option>
                                <option value="vi">Vietnamese</option>
                            </select><hr>
                        </div>
                    </aside>
                    </div>

                    
                        <!-- Apply when has Database 
                         DoctorDAO d = new DoctorDAO();
                           List<Doctor> a = d.getAllDoctor();
                           for (Doctor doctor : a) {
                           out.print(doctor.method-query()); } Drag to Div 
                        -->
                        <!--<div class="col-md-4">-->
                            <div class="card-container-imagia">
                                <div class="card-imagia">
                                    <div class="front-imagia">
                                        <div class="cover-imagia"><img src="https://unsplash.it/720/500?image=1067" alt=""></div>
                                        <div class="user-imagia"><img src="https://unsplash.it/120/120?image=64" class="img-circle" alt=""></div>
                                        <div class="content-imagia">
                                            <h3 class="name-imagia">Name: Nguyen Van Sinh</h3>
                                            <p class="subtitle-imagia">Speciality: Neurology :) </p>
                                            <div id="gender"> Gender : GAY</div>
                                            <div id="workplace"> Working at : HCMIU </div>
                                            <div id="degree"> Degree : Kindergarten </div>
                                        </div>
                                        <div class="footer-imagia"><span><i class="fa fa-plus"></i> More info</span></div>
                                    </div>
                                    <div class="back-imagia">
                                        <div class="content-imagia content-back-imagia">
                                            <div>
                                                <h3> Sinh Dep Trai</h3>
                                                <p class="text-center">
                                                <div id="specific-speciality">Specific-speciality: Bác Sĩ Điên </div>
                                                <div id="timework">Time : Rảnh cả ngày</div>
                                                <div id="">Abc : xyz </div>
                                                <div id="insurance">Insurance: Accected</div>
                                                <div id="">DOB : 6-9-1939</div>
                                                <div id="">Address : Tiệm Đồ Gỗ </div>
                                                <div id="">Insurance: Accected</div>
                                                </p>
                                                <input class="dropdown-button" type="submit" value="Make An Appointment">
                                            </div>
                                        </div>
                                        <div class="footer-imagia">
                                            <div class="social-imagia text-center"><a href="#">View Profile</a></div>
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
                        </footer>

                        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
                        <script src="lib/jquery/jquery.min.js"></script>
                        <script src="lib/jquery/jquery-migrate.min.js"></script>
                        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
                        <script src="lib/waypoints/waypoints.min.js"></script>
                        <script src="lib/easing/jquery.easing.1.3.js"></script>
                        <script src="lib/waypoints/waypoints.min.js"></script>
                        <script src="lib/flexslider/jquery.flexslider-min.js"></script>
                        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
                        <script src="lib/form/side.js"></script>

                        <script src="lib/superfish/hoverIntent.js"></script>
                        <script src="lib/superfish/superfish.min.js"></script>
                        <script src="lib/wow/wow.min.js"></script>
                        <script src="lib/counterup/counterup.min.js"></script>
                        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
                        <script src="lib/isotope/isotope.pkgd.min.js"></script>
                        <script src="lib/lightbox/js/lightbox.min.js"></script>
                        <script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
                        <script src="js/main.js"></script>

                        </body>
                        </html>

