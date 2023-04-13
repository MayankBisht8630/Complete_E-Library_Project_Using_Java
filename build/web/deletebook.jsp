<%@page import ="com.tech.blog.entities.user" %>
<%@page import ="com.tech.blog.entities.Message" %>
<%@page import ="com.tech.blog.dao.*" %>
<%@page import ="com.tech.blog.entities.*" %>
<%@page import ="com.tech.blog.helper.*" %>
<%@page import ="com.tech.blog.servlet.*" %>
<%@page import ="java.util.*" %>
<%@page import ="java.sql.*" %>
<%@page errorPage="error_page.jsp" %>

<%
    user user1 =(user) session.getAttribute("currentuser");
    if(user1 == null)
    {
      response.sendRedirect("login_page.jsp");
    }
   
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Books Page</title>
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

        <% 
            Connection con = ConnectionProvider.getConnection();
            String query = "select * from posts";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
        %>

        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="#"> <span class="fa fa-asterisk"> </span> E Library</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="admin.jsp"><span class ="fa fa-bar-chart"></span>Library Home<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <ul class = "navbar-nav nr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> LogOut</a>
                    </li>    
                </ul>
            </div>
        </nav>

        <!--End of navber-->

        <!--main body-->
        <main class="d-flex align-items-center primary-background ">
            <div class ="container">
                <div class ="row">
                    <div class="col-md-6 offset-md-2">
                        <div class="card " style="width: 50vw">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-trash fa-2x"></span>
                                <h5> All Books In Library !!</h5>
                            </div>
                            <div class="card-body">
                                <form action="" method="post">
                                    <% String msg = request.getParameter("msg");
                                    if("valid".equals(msg))
                                    {
                                    %>
                                    <!--message-->
                                    <center><font color="red" size="5">Successfully Deleted</font></center>
                                    <%
                                    }
                                    %>
                                    <% 
                                    if("invalid".equals(msg))
                                    {
                                    %>
                                    <!--message-->
                                    <center><font color="red" size="5">Successfully Deleted</font></center>
                                    <%
                                    }
                                    %>
                                    <table class="table text-center">
                                        <thead>
                                            <tr>
                                                <th scope="col"> Book Name</th>
                                                <th scope="col"> Author Name</th>
                                                <th scope="col"> Book Quantity</th>
                                                <th scope="col"> Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% while(rs.next()){ %>
                                            <tr>
                                                <td><%= rs.getString("pTitle") %></td>
                                                <td><%= rs.getString("pContent") %></td>
                                                <td><%= rs.getString("pQuantity") %></td>
                                                <td><a class="btn btn-danger" href="delete.jsp?pid=<%=rs.getInt("pid")%>"> Delete </a></td>
                                                <% } %>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <div class="container text-center">
                                        <a href="admin.jsp" id="delete" class="btn btn-primary"> <span class=" fa fa-home"></span> Admin Home </a>
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

        
        <!--now add post js-->
        <script>
        $(document).ready(function (e) {
                        $("#add-post-form").on("submit", function (event) {
                    //this code runs when form is submitted..
                    event.preventDefault();
                    console.log("You Have clicked on submit");
                    let form = new FormData(this);
                    //requesting the server
                    console.log("You Have clicked on hi");
                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success   
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Saved Successfully !!", "success");
                            } else
                            {
                                swal("Opps !", "Something Went Wrong !!", "error");
                            }
                        },
                        error: function (jqXHR, tetStatus, errorThrown) {
                                //error
                                swal("Opps !", "Something Went Wrong !!", "error");
                            },
                            processData: false,
                            contentType: false
                        })
                    })
            })
                   </script>

    </body>
</html>
