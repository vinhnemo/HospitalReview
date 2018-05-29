<%-- 
    Document   : home
    Created on : May 16, 2018, 4:41:41 PM
    Author     : MSI
--%>

<%@page import="Util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${param.language}"  />
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
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body>
        <%
            String mess = (String)request.getAttribute("message");
            Message msg = Util.fromJson(mess);
            if (msg == null) {
                response.sendRedirect("/home.jsp");
            }
        %>
        
        <header id="header">
            <div class="container-fluid">
                <div id="logo" class="pull-left">
                    <h1><a href="home.jsp" class="scrollto">Doctor STRANGE</a></h1>
                </div>
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
                                </div>
                                <div class="col-sm-6 form">
                                </div>
                            </div>
                        </section>
                    </div> <!-- body -->
                </div>
            </div>
        </div>
        
        <main id="main">
            <section id="featured-services">
                <div class="container" style="background-color: #000;height: 900px;;">
                   <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8" style="background-color: #fff; width: 100%; height: 250px; margin-top: 20%;border: 2px solid #18d36e;border-radius: 5px;">
                        <div class="redirect"> Redirecting...</div>
                        <div class="thank"><%=msg.getText()%> </div>
                        <%if (msg.getCode() == 0) { %>
                            <div class="auto-redirect"><a href="/login.jsp"><fmt:message key="forwardEverything.msg1"/></a></div>
                        <% } else {%>
                            <div class="auto-redirect"><a href="/home.jsp"><fmt:message key="forwardEverything.msg2"/></a></div>
                        <% }%>
                    </div>
                    <div class="col-md-2"></div>
                   </div>
                </div>   
            </section>
        </main>
       

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
        <script type="text/javascript">
            $(document).ready(function (event){
                <%if (msg.getCode() == 0) { %>
                    setTimeout(function(){location.href='login'}, 5000);
                <% } else {%>
                    setTimeout(function(){location.href='home.jsp'}, 5000);
                <% }%>
            });
        </script>

    </body>
</html>

