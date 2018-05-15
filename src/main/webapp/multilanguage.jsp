<%-- 
    Document   : multilanguage
    Created on : May 14, 2018, 8:21:37 PM
    Author     : Kuro
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            body {
                padding-top: 1em;
            }	
        </style>

        <div class="container-fluid">

            <div class="dropup">
                <button class="btn btn-primary dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Select Language
                </button>
                <div class="dropdown-menu" aria-labelledby="about-us">
                    
                    <a class="dropdown-item" href="#">English</a>
                    <a class="dropdown-item" href="#">Francais</a>
                    <a class="dropdown-item" href="#">Tiếng Việt</a>
                </div>
            </div>


            <style scoped>
                .dropup {margin-top:120px;}
            </style>

        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>

                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                })

// Initialize popover component
                $(function () {
                    $('[data-toggle="popover"]').popover()
                })
</script>

        </div>
        
        <script src="js/jquery"></script>
    </body>

</html>
