<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import ="com.tech.blog.dao.*"%>
<%@page import ="com.tech.blog.helper.*"%>
<%@page import ="com.tech.blog.entities.*"%>
<%@page import ="com.tech.blog.servlet.*"%>
<%@page errorPage = "error_page.jsp" %>
<%
    user user =(user) session.getAttribute("currentuser");
    if(user == null)
    {
      response.sendRedirect("login_page.jsp");
}   
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id")); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Comment Page</title>
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .scroll-bg{
                width: 35vw;
                
            }

            .scroll-div{
                width: 33vw;
                height: 33vh;
                overflow: hidden;
                overflow: scroll;
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
                        <a class="nav-link" href="profile.jsp"><span class ="fa fa-bar-chart"></span>Library Home<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <ul class = "navbar-nav nr-right"> 
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
                                <h5> All Comments !!</h5>
                            </div>
                            <div class="card-body">
                                <div class="panel panel-default">
                                    <div class="panel-body" id="comments">
                                        <div class="scroll-bg">
                                            <div class="scroll-div">
                                                <div class="scroll-object">
                                                    <%
                                                     try
                                                      {
                                                        Connection con = ConnectionProvider.getConnection();
                                                        PreparedStatement p = con.prepareStatement("select * from comments where postId=?");
                                                        p.setInt(1,postId);
                                            
                                                        ResultSet set = p.executeQuery();
                                                        while (set.next()) 
                                                        {
                                                    %>
                                                    <hr>
                                                    <h5 style="color: cadetblue"><%= set.getString("name") %> :</h5>
                                                    <h6 style="color: tomato"><%= set.getString("comment") %></h6>
                                                    <hr>
                                                    <%
                                                        } 
                                                       }
                                                       catch(Exception e)
                                                        {
                                                            e.printStackTrace();
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div class="card text-center" style="height: 50vh" >
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-magic fa-3x"></span>
                                <h5> Post Comment !!</h5>
                            </div>
                            <form id="add-comment-form" action="commentServlet" method="POST" >
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="form-group">
                                            <input type="hidden" name="postId" id="postId" value ="<%=postId%>">
                                        </div>
                                        <div class="form-group">
                                            <input type="hidden" name="name" id="name" value ="<%= user.getName()%>"><h4 class="text-primary">User Name : <%= user.getName()%> </h4>
                                        </div>
                                        <div class="form-group">
                                            <label for="comment"><h4 class="text-danger">Comment Here !!</h4></label>
                                            <textarea id="comment" name="comment" class="form-control " style="height: 10vh" cols="30" row="8" placeholder="Comment Here !" required></textarea>
                                        </div>
                                    </div>
                                    <div class="container text-center" >
                                        <button id="submit-btn" id="save" onclick="addComment()" type="submit" class="btn btn-primary"> Post </button>
                                        <a href="profile.jsp" id="all-btn" class="btn btn-primary"> <span class=" fa fa-hand-o-left"></span> Back </a>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </main>
        <% Message m = (Message)session.getAttribute ("msggg");
if(m != null)
{
        %>
        <div class="alert text-center <%= m.getCssClass() %>" role="alert">
            <%= m.getContent()  %>
        </div>
        <%
           session.removeAttribute("msggg");
            }
        %>

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
        <!--        <script src="jss/myjs.js" type="text/javascript"></script>-->



    </body>
</html>
