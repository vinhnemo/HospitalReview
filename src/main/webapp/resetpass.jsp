<%-- 
    Document   : resetpass1
    Created on : May 14, 2018, 8:27:13 PM
    Author     : Kuro
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
    <fmt:setLocale value="${language}" />
</c:if>
<fmt:setBundle basename="text" />
<!DOCTYPE html>

<html lang="${language}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Doctor Strange</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom form -->
        <link rel="stylesheet" href="css/resetpass.css">
        <link rel="stylesheet" href="css/language.css">

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <script src="js/popper.min.js"></script>
    </head>
    <body class="my-login-page">
        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center align-items-center h-100">
                    <div class="card-wrapper">
                        <div class="brand">
                            <img src="img/logo/logo.jpg">
                        </div>
                        <div class="card fat">
                            <div class="card-body">
                                <h4 class="card-title"><fmt:message key="label.reset.reset"/></h4>
                                <form method="POST">

                                    <div class="form-group">
                                        <label for="new-password"><fmt:message key="label.reset.newpass"/></label>
                                        <input id="new-password" type="password" class="form-control" name="password" required autofocus data-eye>
                                        <div class="form-text text-muted">
                                            <fmt:message key="label.reset.msg1"/>
                                        </div>
                                    </div>

                                    <div class="form-group no-margin">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            <fmt:message key="label.reset.btn"/>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="footer">
            <div class="container-fluid">
                <div class="btn-group dropup btn-sm">
                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%=language%>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item <%=english%>" href="/resetpass.jsp?language=en_US">English</a>
                        <a class="dropdown-item <%=french%>" href="/resetpass.jsp?language=fr_FR">Français</a>
                        <a class="dropdown-item <%=vietnamese%>" href="/resetpass.jsp?language=vi_VN">Tiếng Việt</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript
          ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/resetpass.js"></script>
    </body>
</html>
