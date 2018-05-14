<%-- 
    Document   : resetpass
    Created on : May 12, 2018, 9:24:20 AM
    Author     : S410U
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${param.language}" scope="session" />
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

        <link rel="icon" href=" ">
        <title><fmt:message key="label.resetpass.title"/></title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <style>
            .form-gap {
                padding-top: 70px;
            }
        </style>

        <!-- Font Awesome Style Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>
        <form>
            <button name="language" value="en">EN </button>
            <button name="language" value="fr_FR">FR</button>
            <button name="language" value="vi_VN">VN</button>
        </form>
        <%
            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }

            String message = "";
            if (request.getAttribute("message") != null) {
                message = (String) request.getAttribute("message");
        %>

        <div class="container animated slideInDown" id="message">
            <div class="row">
                <div class="col-sm-3 col-md-3"></div>
                <div class="col-sm-6 col-md-6">
                    <div class="alert alert-success">
                        <i class="fa fa-check"></i> <strong><fmt:message key="label.resetpass.resetsuccess"/></strong>
                        <hr class="message-inner-separator">
                        <p><%=message%></p>
                    </div>
                </div>
            </div>
        </div>
        <%}%>

        <!-- Header
        ================================================== -->

        <section>
            <div class="form-gap"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="text-center">
                                    <h3><i class="fa fa-lock fa-4x"></i></h3>
                                    <h2 class="text-center"><fmt:message key="label.resetpass.forgot"/></h2>
                                    <p><fmt:message key="label.resetpass.msg1"/></p>
                                    <div class="panel-body">

                                        <form id="register-form" role="form" autocomplete="off" class="form" method="post" action="reset">
                                            <%
                                                if (error.length() > 0) {
                                            %>
                                            <div class="form-group has-danger">
                                                <div class="form-control-feedback">
                                                    <span class="text-danger align-middle">
                                                        <i class="fa fa-close"></i> <%=error%>
                                                    </span>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="far fa-envelope"></i></span>
                                                    <input id="username" name="username" placeholder=<fmt:message key="label.username"/> class="form-control"  type="text" autofocus required>
                                                </div>
                                            </div>
                                            <%} else {%>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="far fa-envelope"></i></span>
                                                    <input id="username" name="username" placeholder=<fmt:message key="label.username"/> class="form-control"  type="text" autofocus>
                                                </div>
                                            </div>
                                            <%}%>
                                            <div class="form-group">
                                                <input name="action" class="btn btn-lg btn-primary btn-block"  type="submit" value=<fmt:message key="label.resetpass.resetbtn"/>>
                                            </div>

                                            <input type="hidden" class="hide" name="token" id="token" value=""> 
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bootstrap core JavaScript
          ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.min.js" ></script>
        <script src="js/tether.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>

        <%if (message.length() > 0) {%>
        <script type = "text/javascript">

            $(document).ready(function () {
                $("header").hide();
                $('#message').prop("disabled", true);

                $('#message').delay(4000).slideUp("slow", function () {
                    // Animation complete.
                    $('#message').prop("disabled", false);
                    $("header").show();
                });
            });

        </script>
        <%}%>

    </body>
</html>
