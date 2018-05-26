<%-- 
    Document   : profileUser
    Created on : May 24, 2018, 1:43:34 AM
    Author     : MSI
--%>
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
        <link rel="stylesheet" href="lib/form/sidebar1.css">
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
                        <li><a href="#">Appointment</a></li>
                        <li class="menu-has-children"><a href="">Language</a>
                            <ul>
                                <li><a href="#">English</a></li>
                                <li><a href="#">Tiếng Việt</a></li>
                            </ul>
                        </li>
                        <li><a href="#contact">Contact Us</a></li>
                        <li class="menu-active"><a href="#" data-toggle="modal" data-target="#myLogin" data-keyboard="true">Sign In/Sign Up</a></li>                     
                    </ul>
                </nav>
            </div>
        </header>
        <!--end of header -->
        <main id="main">
            <!-- De choi thoi -->
            <div class="nothing-special-dark"></div>
            <div class="container-fluid" style="height:800px;display: block;">
                <div id="wrapper">
                    <div id="sidebar-wrapper">
                        <ul class="sidebar-nav nav">
                            <li><h3>Options:</h3></li>
                            <li class="active"><a class="general" href="#general" data-toggle="tab"><i class="fa fa-gears"></i>General</a></li>
                            <li><a class="edit" href="#edit" data-toggle="tab"><i class="fa fa-pencil"></i>Edit Your Profile</a></li>
                            <li><a class="change" href="#change" data-toggle="tab"><i class="fa fa-key"></i>Change password</a></li>
                            <li><a class="bookmark" href="#bookmark" data-toggle="tab"><i class="fa fa-bookmark"></i>Bookmarks</a></li>
                            <li><a class="other" href="#other" data-toggle="tab"><i class="fa fa-angle-double-right"></i>Others</a></li>
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
                                                                <div class="userhead">Personal Information</div><br> 
                                                                <table>
                                                                    <tr><td><div class="userinfo">Name: </div></td><td> <div class="userinfo-text">Naruto</div></td></tr>
                                                                    <tr><td><div class="userinfo">Email: </div></td><td> <div class="userinfo-text">sucsinhnguyen696969@gmail.com</div></td></tr>
                                                                    <tr><td><div class="userinfo">Gender: </div></td><td> <div class="userinfo-text">Other</div></td></tr>
                                                                    <tr><td><div class="userinfo">Address: </div></td><td> <div class="userinfo-text">1023 ABC Phuong 3, Quan 7, Ho Chi Minh City</div></div></td></tr>
                                                                    <tr><td><div class="userinfo">Insurance Number: </div></td><td> <div class="userinfo-text">046556065</div></div></td></tr>
                                                                    <tr><td><div class="userinfo">Language: </div></td><td> <div class="userinfo-text">English</div></div></td></tr>
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
                                                                <div class="userhead">Edit Profile</div><br>
                                                                <form class="change" action="" method="">
                                                                    <table>
                                                                        <!--use value=user profile trong db -->
                                                                        <tr><td><div class="userinfo">Name: </div></td><td><input class="form-change" type="text" name="address" value="Naruto"></td></tr>
                                                                        <tr><td><div class="userinfo">Email: </div></td><td><input class="form-change" type="text" name="address" value="sucsinhnguyen696969@gmail.com"></td></tr>
                                                                        <tr><td><div class="userinfo">Gender: </div></td>
                                                                            <td>                        
                                                                                <select class="form-change" name="gender">
                                                                                    <option value="male">Male</option>
                                                                                    <option value="female">Female</option>
                                                                                    <option value="other">Other</option>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td><div class="userinfo">Address: </div></td><td><input class="form-change" type="text" name="address" value="1023 ABC Phuong 3, Quan 7, Ho Chi Minh City"></td></tr>
                                                                        <tr><td><div class="userinfo">Insurance Number: </div></td><td><input class="form-change" type="text" name="address" value="046556065"></td></tr>
                                                                        <tr><td><div class="userinfo">Language: </div></td><td><input class="form-change" type="text" name="address" value="English"></td></tr>
                                                                    </table>
                                                                    <input class="save" type="submit" value="Save change"> 
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
                                                                <div class="userhead">Change your password</div><br>
                                                                <form class="change" action="" method="">
                                                                    <table>
                                                                        <!--use value=user profile trong db -->
                                                                        <tr><td><div class="userinfo">Current password: </div></td><td><input class="form-change" type="password" name="password" placeholder="Your Current Password"></td></tr>
                                                                        <tr><td><div class="userinfo">New password: </div></td><td><input class="form-change" type="password" name="password" placeholder="Input New Password"></td></tr>             
                                                                        <tr><td><div class="userinfo">Confirm new password: </div></td><td><input class="form-change" type="password" name="password" placeholder="Confirm New Password"></td></tr>
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
                                                                <div class="userhead">Your Favorite Doctor</div><br>
                                                                <table>
                                                                    <!--use value=user profile trong db -->
                                                                    <tr><td><a target="_blank" href="sdsad">.Nguyen Van Sinh </td><td><input class="remove" type="submit" value="Remove"> </td></tr>
                                                                    <tr><td><a target="_blank" href="" >.Doctor Strange </td><td><input class="remove" type="submit" value="Remove"></td></tr>             
                                                                </table>
                                                            </div>
                                                            <div class="user-information">
                                                                <div class="userhead">Your Favorite Hospital</div><br>
                                                                <table>
                                                                    <!--use value=user profile trong db -->
                                                                    <tr><td><a target="_blank" href="" >.Crazy Hospital   </td><td><input class="remove" type="submit" value="Remove"> </td></tr>
                                                                    <tr><td><a target="_blank" href="" >.Bien Hoa Hospital </td><td><input class="remove" type="submit" value="Remove"></td></tr>             
                                                                </table>                                                     
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
                                                                <div class="userhead">Deactive This Account</div>
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

    </body>
</html>



