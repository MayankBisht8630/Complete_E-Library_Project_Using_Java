<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E Library</title>
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    </head>
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp"%>

        <!--cards-->
        <div class ="container my-4">
            <div class="row mb-2">
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 20vw;">
                        <img class="card-img-top" style="height:50vh ; width: 20vw;" src="books_images/11111.PNG" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Secrets Of Moldara </h5>
                            <p class="card-text"><h6> Author Name :<br> Brianne Earhart</h6></p>
                            <a href="register_page.jsp" class="btn primary-background text-white"> More Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 20vw;" >
                        <img class="card-img-top" style="height:50vh ; width: 20vw;" src="books_images/11112.PNG" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Get Out Of My Head </h5>
                            <p class="card-text"><h6> Author Name :<br> Meredith Arthur </h6></p>
                            <a href="register_page.jsp" class="btn primary-background text-white"> More Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 20vw;">
                        <img class="card-img-top" style="height:50vh ; width: 20vw;" src="books_images/11113.PNG" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Disappearing Earth </h5>
                            <p class="card-text"><h6> Author Name :<br> Julia Phillips </h6> </p>
                            <a href="register_page.jsp" class="btn primary-background text-white">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 20vw;">
                        <img class="card-img-top" style="height:50vh ; width: 20vw;" src="books_images/11114.PNG" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Among The 10 K Things </h5>
                            <p class="card-text"><h6> Author Name :<br> Julia Pierpont</h6></p>
                            <a href="register_page.jsp" class="btn primary-background text-white">More Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 20vw;">
                        <img class="card-img-top" style="height:50vh ; width: 20vw;" src="books_images/11115.PNG" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Branking Regulations </h5>
                            <p class="card-text"><h6> Author Name :<br> Dr Joanna Wilson</h6></p>
                            <a href="register_page.jsp" class="btn primary-background text-white">More Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 20vw;">
                        <img class="card-img-top" style="height:50vh ; width: 20vw;" src="books_images/11116.PNG" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Twisted </h5>
                            <p class="card-text"><h6> Author Name :<br> Ana Huang </h6> </p>
                            <a href="register_page.jsp" class="btn primary-background text-white">More Details</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--Java Script-->
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
        <!--        <script src="jss/myjs.js" type="text/javascript"></script>-->


    </body>
</html>

