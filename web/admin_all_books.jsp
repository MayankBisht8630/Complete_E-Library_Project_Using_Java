<%@page import ="com.tech.blog.dao.*" %>
<%@page import ="com.tech.blog.entities.*" %>
<%@page import ="com.tech.blog.helper.*" %>
<%@page import ="com.tech.blog.servlet.*" %>
<%@page import ="java.util.*" %>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>All Books Page</title>
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
        <!--end of navbar-->
        
        <!--main bod of the page--> 

    <mian>
        
        <% Message m = (Message)session.getAttribute ("msg");
                               if(m != null)
                               {
        %>
        <div class="alert <%= m.getCssClass() %>" role="alert">
            <%= m.getContent()  %>
        </div>
        <%
           session.removeAttribute("msg");
            }
        %>
        <div class="container ">
            <div class="row mt-4">
                <!--first column-->
                <div class="col-md-4 mt-4">
                    <!--categories-->
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                            All Books !
                        </a>
                        <% 
                           Postdao d =  new Postdao(ConnectionProvider.getConnection());
                           ArrayList<Category> list1 =d.getAllCategories();
                           for(Category cc:list1)
                           {
                        %>
                        <a href="#" onclick="getPosts(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action active"><%= cc.getName() %></a>
                        <%
                           }
                        %>
                        <br>
                        <a class="btn btn-outline-primary" href="#" data-toggle="modal" data-target="#add-post-modal"> Add Books </a>
                        <a href="deletebook.jsp" class="btn text-center btn-outline-primary"> Delete Books</a>
                        <a href="admin.jsp" class="btn btn-outline-primary"> Back To Admin Pannel</a>
                        
                    </div>
                </div>

                <!--second column-->
                <div class="col-md-8">
                    <!--posts-->
                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                    </div>
                    <div class="container-fluid" id="post-container"></div>

                </div>
            </div>
        </div>
    </mian>

    <!--end of main body of the page--> 

    <!--add post modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method ="post">
                            <div class="form-group"> 
                                <select class="form-control" name="cid">
                                    <option selected disabled>--Select Category--</option>
                                    <% 
                                        Postdao postd = new Postdao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = postd.getAllCategories();
                                    for(Category c:list)
                                    {
                                    %>
                                    <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder=" Enter Book Name" class="form-control" />
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pContent" placeholder=" Enter Author Name"></textarea>
                            </div>
                            <div class="form-group">
                                <input name="pQuantity" class="form-control" type="number" placeholder=" Enter Book Quantity "></input>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height:200px;" placeholder=" About Book "></textarea>
                            </div>
                            <div class="form-group" >
                                <label>Select Book Image :</label>
                                <br>
                                <input type="file" name="pic"/>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary"> Post </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end of add post model-->
    
     <!--Java Script-->
    <script
        src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"> </<script>
//        <script src="js/myjs.js" type="text/javascript"></script>
    
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
    
    <!--loading post using ajax-->        
        <script>
            function getPosts(catId,temp)
            {
            $("#loader").show();
            $('#post-container').hide();
            $(".c-link").removeClass('active');
            $.ajax({
                url:"admin_load_posts.jsp",
                data: {cid:catId},
                success : function(data , textStatus ,jqXHR)
                {
                console.log(data);
                $("#loader").hide();
                $('#post-container').show();
                $('#post-container').html(data);
                $(temp).addClass('active');
                }
                   })
            }
            $(document).ready(function (e){
            let allPostRef =$('.c-link')[0]
            getPosts(0,allPostRef);
            
                        }) 
        </script>
        
    </body>
</html>
