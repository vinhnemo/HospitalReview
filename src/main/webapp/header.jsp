<%-- 
    Document   : header
    Created on : May 29, 2018, 6:45:11 PM
    Author     : TGMaster
--%>

<%@page import="DTO.*, DAO.*, javax.servlet.http.HttpUtils.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}"/>
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" scope="session"/>
</c:if>
<fmt:setBundle basename="text" />
<!DOCTYPE html>
<html lang="${language}">
    <head>
        <style>
            .btn-find {
                border-bottom-left-radius: 25px !important;
                border-bottom-right-radius: 25px !important;
                border-top-left-radius: 25px !important;
                border-top-right-radius: 25px !important;
                border-width:2px;
                font-weight: bold !important;
            }
        </style>
        <link href="css/modal.css" rel="stylesheet">
    </head>
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
    <body>
        <header id="header">
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="home.jsp" class="scrollto">Doctor STRANGE</a></h1>
                </div>
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li class="menu-has-children"><a href="/hospital"><fmt:message key="findhospital"/></a>
                            <ul>
                                <li>
                                    <div class="dropdown-form">
                                        <form action="hospital" method="POST">
                                            <h4><fmt:message key="findhospital"/></h4>
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="<fmt:message key="searchhospitalbyname"/>"/>                               
                                            <button class="btn btn-outline-success btn-lg btn-find mr-md-4 mr-sm-0 px-5 mb-3 text-uppercase" type="submit" name="action" value="Search Hospital"><i class="fa fa-search"></i> <fmt:message key="searchbtn"/></button>
                                        </form>
                                    </div>
                                </li>
                            </ul> 
                        </li>
                        <li class="menu-has-children"><a href="/doctor"><fmt:message key="finddoc"/></a>
                            <ul>
                                <li>
                                    <div class="dropdown-form">
                                        <form action="doctor" method="POST">
                                            <h4><fmt:message key="finddoc"/></h4>
                                            <input type="text" name="search" class="form-control form-search" id="name" placeholder="<fmt:message key="searchdotorbyname"/>"/>                               
                                            <button class="btn btn-outline-success btn-lg btn-find mr-md-4 mr-sm-0 px-5 mb-3 text-uppercase" type="submit" name="action" value="Search Doctor"><i class="fa fa-search"></i> <fmt:message key="searchbtn"/></button>
                                        </form>
                                    </div>
                                </li>
                            </ul> 
                        </li>
                        <li><a href="#"><fmt:message key="appt"/></a></li>
                        <li class="menu-has-children"><a href="#"><fmt:message key="language"/></a>
                            <ul>
                                <li><a href="<%= javax.servlet.http.HttpUtils.getRequestURL(request)%>?language=en_US">English</a></li>
                                <li><a href="<%= javax.servlet.http.HttpUtils.getRequestURL(request)%>?language=vi_VN">Tiếng Việt</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.jsp"><fmt:message key="contact"/></a></li>

                        <% if (patient != null) {%>
                        <li class="menu-has-children menu-active"><a href=""><fmt:message key="greeting"/>, <%out.print(patient.getFname() + " " + patient.getLname());%></a>
                            <ul>
                                <li><a href="profileUser.jsp"><fmt:message key="yourprofile"/></a></li>
                                <li><a href="logout"><fmt:message key="signout"/></a></li>
                            </ul>
                        </li>
                        <% } else {%>
                        <li class="menu menu-active"><a href="#" data-toggle="modal" data-target="#myLogin" data-keyboard="true" onclick="animeEffectIn()"><fmt:message key="signinup"/></a></li>
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
                                        <h2 class="effectAnime"><span id="heading">Sign Up</span></h2>
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

    </body>
</html>
