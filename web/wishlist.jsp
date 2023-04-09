<%@page import ="com.tech.blog.dao.*" %>
<%@page import ="com.tech.blog.entities.*" %>
<%@page import ="com.tech.blog.helper.*" %>
<%@page import ="com.tech.blog.servlet.*" %>
<%@page import ="java.util.*" %>
<%@page errorPage="error_page.jsp" %>

<%
    user user =(user) session.getAttribute("currentuser");
    if(user == null)
    {
      response.sendRedirect("login_page.jsp");
    }   
%>
<% int postId = Integer.parseInt(request.getParameter("post_id")); 
   Postdao d = new Postdao(ConnectionProvider.getConnection());
   Post p = d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wishlist Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 70% 100%, 28% 90%, 0 100%, 0 0);
            }
        </style> 
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
                        <a class="nav-link" href="#"><span class ="fa fa-bar-chart"></span>Library Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class ="fa fa-exclamation-triangle"> </span> Books Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"><span class ="fa fa-graduation-cap2"></span> Fiction Books</a>
                            <a class="dropdown-item" href="#"><span class ="fa fa-graduation-cap2"></span> Adventures Books</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><span class ="fa fa-graduation-cap2"></span> Historical Books</a>
                        </div>
                </ul>
                <ul class = "navbar-nav nr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="wishlist.jsp" ><span class="fa fa-heart"></span> WishList</a>
                    </li>  
                    <li class="nav-item">
                        <a class="nav-link" href="#!"><span class="fa fa-users"></span> <%= user.getName() %></a>
                    </li> 

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> LogOut</a>
                    </li>    
                </ul>
            </div>
        </nav>

        <!--End of navber-->

        <!--main body-->
        <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
            <div class ="container">
                <div class ="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card ml-1">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-heart fa-3x"></span>
                                <h5> My WIshlist  !!</h5>
                            </div>
                            <div class="card-body">
                                <form action="" method="post">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col"> Book Name</th>
                                                <th scope="col"> Author Name</th>
                                                <th scope="col"> Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td> <%= p.getpTitle() %></td>
                                                <td> <%= p.getpContent() %></td>
                                                <td> <button class='btn btn-danger btn-sm'>Remove</button></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <div class="container text-center">
                                        <a href="profile.jsp" class="btn btn-primary"> <span class=" fa fa-hand-o-left"></span> Back </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--end of main body-->

        <!--Java Script-->
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--        <script src="js/myjs.js" type="text/javascript"></script>-->

        
        <script>
$(document).ready(function () {
let editStatus = false;
$('#edit-profile-button').click(function () {
if (editStatus == false)
{
$("#profile-details").hide();
$("#profile-edit").show();
editStatus = true;
$(this).text("Back")
} else
{
$("#profile-details").show();
$("#profile-edit").hide();
editStatus = false;
$(this).text("Edit")
    }
})

    });
        </script>
        
    </body>
</html>
