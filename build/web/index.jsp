<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import ="com.tech.blog.dao.*"%>
<%@page import ="com.tech.blog.helper.*"%>
<%@page import ="com.tech.blog.entities.*"%>
<%@page import ="com.tech.blog.servlet.*"%>
<%@page import ="java.util.List"%>
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
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 70% 100%, 28% 90%, 0 100%, 0 0);
            }
        </style>  
    </head>
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp"%>

        <!--banner-->
        <div class="container-fluid-0 m-0  ">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3 text-center"> Welcome To Library!! </h3>
                    <p> A library is a place where books and sources of information are stored. They make it easier for people to get access to them for various purposes </p>
                    <p> Libraries play a vital role in providing people with reliable content. They encourage and promote the process of learning and grasping knowledge. <br>The book worms can get loads of books to read from and enhance their knowledge. Moreover, the variety is so wide-ranging that one mostly gets what they are looking for. </p>  
                    <a href="login_admin.jsp" class="btn btn-outline-light btn-lg"> <span class=" fa fa-user"></span> Library Management / Admin </a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class=" fa fa-sign-in fa-spin"></span> LogIn </a>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"> <span class=" fa fa-user-circle fa-spin"></span> Register </a>
                </div>
            </div>
        </div>

        <!--dynamic data from database-->
        <div class="container">
            <div class="row text-center">
                <%
                   int start = 0;
                   int recordCount = 6;
                   int total = 0;
                   
                   int pgno = request.getParameter("pgno")==null?0 : Integer.parseInt(request.getParameter("pgno"));
                   start = pgno*recordCount;
                   Connection con = ConnectionProvider.getConnection();
                   PreparedStatement p = con.prepareStatement("select * from posts limit ?,?");
                   
                   p.setInt(1,start);
                   p.setInt(2,recordCount);
                   ResultSet set = p.executeQuery();
                   
                   while (set.next()) 
                    {
                %>
                <div class="col-md-4 mt-4">
                    <div class="card" style="width: 21vw;">
                        <img class="card-img-top" style="height:40vh ; width: 21vw" src="blog_pics/<%=set.getString("pPic")%>" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%= set.getString("pTitle") %></h5>
                            <p class="card-text"><h6>Author Name:<br><%= set.getString("pContent") %></h6></p>
                        </div>
                        <div class="card-footer text-center primary-background">
                            <a href="register_page.jsp" class="btn btn-outline-light btn-sm" > Read More </a>
                        </div>
                    </div>
                </div>
                <%
                    }
                    PreparedStatement p1 = con.prepareStatement("select count(*) from posts");
                    ResultSet rs2 = p1.executeQuery();
                    if(rs2.next())
                    {
                      total=rs2.getInt(1);
                    }
                %>
            </div>
        </div>
        <br>
        <hr>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <% 
                   for(int i=0; i <= (total/recordCount); i++)
                   {
                %>
                <li class="page-item"><a class="page-link" href="index.jsp?pgno=<%= i %>"><%= i+1 %></a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <hr>
        <!--end of dynamc daata--> 

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
