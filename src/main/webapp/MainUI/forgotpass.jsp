<%-- 
    Document   : login
    Created on : May 17, 2018, 7:14:46 PM
    Author     : MSI
--%>

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
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="lib/form/form.css">
    </head> 

    <body>
        <main id="main">
            <div class="login-dark">
                <form class="reset" action="login" method="post">
                    <h3> Reset your password </h3>
                    <div class="i2"><i class="icon ion-key"></i></div>
                    <p>Enter your email address and we will send you a link to reset your password.<p>
                    <div class="form-group has-danger"><input class="form-control" type="email" name="email" placeholder="Email"></div>
                    <div class="form-group"><button class="btn btn-primary btn-block" type="submit" name="action">Send password reset email</button></div>
                </form>
            </div>
        </main>
        <script src="js/registration.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/jquery/jquery-migrate.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

