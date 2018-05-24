<%-- 
    Document   : profile
    Created on : May 25, 2018, 2:21:07 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="lib/form/sidebar1.css">
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/search.css">
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
                                    <div class="doctor-name">
                                        <div class="row" style="">             
                                            <div class="col-md-4 col-sm-10">
                                                <div class="doctor-pic">
                                                    <img src="" alt="">
                                                </div>
                                            </div>
                                            <div class="col-md-7 col-sm-10">
                                                <h3 class="name">Nguyen Van Sinh</h3>
                                                <div class="doctor-text"> DOB: 11-01-1997<br> Gender: GAY </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="doctor-information">
                                        <div class="head">Personal Information</div><br> 
                                        <table>
                                            <tr><td><div class="info">Working Place: </div></td><td> <div class="info-text">Abc hospital</div></td></tr>
                                            <tr><td><div class="info">Speciality: </div></td><td> <div class="info-text">Neurology</div></td></tr>
                                            <tr><td><div class="info">Specific speciality: </div></td><td> <div class="info-text">Crazy</div></td></tr>
                                            <tr><td><div class="info">Degree: </div></td><td> <div class="info-text">Kintergarden</div></div></td></tr>
                                            <tr><td><div class="info">Insurance: </div></td><td> <div class="info-text">Accepted</div></div></td></tr>
                                            <tr><td><div class="info">Language: </div></td><td> <div class="info-text">English</div></div></td></tr>
                                            <tr><td><div class="info">Work-hour: </div></td><td> <div class="info-text">10AM-2PM</div></div></td></tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="edit">
                                    Bulubaxoa bulu
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="lib/form/sidebar1.js"></script>
    </body>
</html>