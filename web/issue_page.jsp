<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.tech.blog.entities.*" %>
<%@page import ="com.tech.blog.dao.*" %>
<%@page import ="com.tech.blog.helper.*" %>
<%@page import ="com.tech.blog.servlet.*" %>
<%@page import ="java.util.*" %>
<%@page errorPage = "error_page.jsp" %>
<%
    user user =(user) session.getAttribute("currentuser");
    if(user == null)
    {
      response.sendRedirect("login_page.jsp");
}   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Issue Page</title>
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E Library</title>
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="#"> <span class="fa fa-asterisk"> </span> E Library</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class ="fa fa-bar-chart"></span>Library Home<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <ul class = "navbar-nav nr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-book " style="font-size: 17px;"></i><span class="ml-1 cart-items">(0)</span></a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-users"></span> <%= user.getName() %></a>
                    </li> 

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> LogOut</a>
                    </li>    
                </ul>
            </div>
        </nav>

        <!--End of navber-->

        <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
            <div class ="container">
                <div class ="row">
                    <div class="col-md-6">
                        <div class="card" style="height:50vh">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-magic fa-3x"></span>
                                <h5> Confirm Book Issue !!</h5>
                            </div>
                            <div class="card-body">
                                <div class=" cart-body"></div> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div class="card text-center" style="height:50vh">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-magic fa-3x"></span>
                                <h5> Your Details !!</h5>
                            </div>
                            <div class="card-body">
                                <!--<form action ="order" method="post">-->
                                <div class="form-group">
                                    <label for="user_name"><h4>User Name</h4></label>
                                    <br>
                                    <lable name ="user_name" id="user_name" class="text-primary"><h5><%= user.getName()%></h5></lable>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><h4>Email address</h4></label>
                                    <br>
                                    <lable name ="user_email" id="user_email" class="text-primary"><h5><%= user.getEmail()%></h5></lable>
                                </div>
                                <br>
                                <div class="container text-center">
                                    <button id="submit-btn" type="submit" class="btn btn-primary"> Confirm </button>
                                    <a href="profile.jsp" id="all-btn" class="btn btn-primary"> <span class=" fa fa-hand-o-left"></span> Back </a>
                                </div>
                                <!--                            </form>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--common modals-->
        <%@include file ="common_modal.jsp" %>
        <!--end of  common modal--> 

        <!--Java Script-->
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
        <script src="jss/myjs.js" type="text/javascript"></script>

        <script>
                $(document).ready(function () {
                $('#submit-btn').click(function () 
                {
                    swal("Successfully Issued Book").then((value) => {
                          window.location="profile.jsp"
                        });
                })
            })
        </script>


    </body>
</html>
