<%-- 
    Document   : resetpass
    Created on : May 12, 2018, 9:24:20 AM
    Author     : S410U
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <link rel="icon" href=" ">
        <title>Hospital Reset Password Page</title>

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
                        <i class="fa fa-check"></i> <strong>Reset Successfully</strong>
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
                                    <h2 class="text-center">Forgot Password?</h2>
                                    <p>You can reset your password here.</p>
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
                                                    <input id="username" name="username" placeholder="Username" class="form-control"  type="text" autofocus required>
                                                </div>
                                            </div>
                                            <%} else {%>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="far fa-envelope"></i></span>
                                                    <input id="username" name="username" placeholder="Username" class="form-control"  type="text" autofocus>
                                                </div>
                                            </div>
                                            <%}%>
                                            <div class="form-group">
                                                <input name="action" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
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
