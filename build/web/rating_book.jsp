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
    Postdao d = new Postdao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Rating Book Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="CSS/style.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .scroll-bg{
                width: 39vw;

            } 
            
            .container112{
                justify-content: center;
                padding-left: 450px;
            }

            .scroll-div{
                padding-left: 10px;
                padding-right: 10px;
                padding-top:  10px;
                padding-bottom: 10px;
                
                width: 39vw;
                height: 30vh;
                overflow: hidden;
                overflow: scroll;
            }
        </style>   
    </head>

    <body>
        <div class="jumbotron text-center">
            <img src="blog_pics/<%=p.getpPic()%>" alt="" height='400' width='300'>
            <br>
            <br>
            <div class="col-sm-4 text-center m-auto">
                <a href="#" id='add_review' class="btn btn-primary"> <span class=" fa fa-magic"></span> Add A Review ! </a>
                <a href="profile.jsp" id='add_review' class="btn btn-primary"> <span class=" fa fa-hand-o-left"></span> Back </a>
                
            </div>
        </div>

        <div class="container112 ">
            <div class="card" style="width: 40vw; height: 40vh;">
                <div class="card-header text-center">
                    <h3 class="text-warning"> All Reviews </h3>
                </div>
            <div class="scroll-bg">
                <div class="scroll-div">
                    <div class="scroll-object">
                        <%
                         try
                          {
                            Connection con = ConnectionProvider.getConnection();
                            PreparedStatement p1 = con.prepareStatement("select * from ratings where postId=?");
                            p1.setInt(1,postId);
                                            
                            ResultSet set = p1.executeQuery();
                            while (set.next()) 
                            {
                        %>
                        <hr>
                        <h5 style="color: cadetblue"><%= set.getString("userName") %> :<span style="padding-left: 80px;"></span><%= set.getString("ratingValue") %> / 5<span style="padding-left: 2px;"><i class="fa fa-star star-light main_star mr-1" style="color: tomato"></i></span></h5>
                        <h6 style="color: tomato"><%= set.getString("review") %></h6>
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



        <!--        <div class="container">
                    <div class="row">
                        <div class="col-sm-4 text-center m-auto">
                            <h1><span id="avg_rating">0.0</span>/5.0</h1>
                            <div>
                                <i class="fa fa-star star-light main_star mr-1"></i>
                                <i class="fa fa-star star-light main_star mr-1"></i>
                                <i class="fa fa-star star-light main_star mr-1"></i>
                                <i class="fa fa-star star-light main_star mr-1"></i>
                                <i class="fa fa-star star-light main_star mr-1"></i>
                            </div>
                            <span id="total_review">0</span> Reviews
                        </div>
                        <div class="col-sm-4 progressSection">
                            <div class='holder'>
                                <div>
                                    <div class="progress-label-left">
                                        <b>5</b> <i class="fa fa-star mr-1 text-warning"></i>
                                    </div>
                                    <div class="progress-label-right">
                                        <span id="total_five_star_review"> 0 </span> Reviews
                                    </div>
        
                                </div>
        
                                <div class="progress">
                                    <div class="progress-bar bg-warning" id='five_star_progress'>
        
                                    </div>
                                </div>
                            </div>
                            <div class='holder'>
                                <div>
                                    <div class="progress-label-left">
                                        <b>4</b> <i class="fa fa-star mr-1 text-warning"></i>
                                    </div>
                                    <div class="progress-label-right">
                                        <span id="total_four_star_review"> 0 </span> Reviews
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-warning" id='four_star_progress'>
        
                                    </div>
                                </div>
                            </div>
                            <div class='holder'>
                                <div> 
                                    <div class="progress-label-left">
                                        <b>3</b> <i class="fa fa-star mr-1 text-warning"></i>
                                    </div>
                                    <div class="progress-label-right">
                                        <span id="total_three_star_review"> 0 </span> Reviews
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-warning" id='three_star_progress'>
        
                                    </div>
                                </div>
                            </div>
                            <div class='holder'>
                                <div>
                                    <div class="progress-label-left">
                                        <b>2</b> <i class="fa fa-star mr-1 text-warning"></i>
                                    </div>
                                    <div class="progress-label-right">
                                        <span id="total_two_star_review"> 0 </span> Reviews
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-warning" id='two_star_progress'>
        
                                    </div>
                                </div>
                            </div>
                            <div class='holder'>
                                <div>
                                    <div class="progress-label-left">
                                        <b>1</b> <i class="fa fa-star mr-1 text-warning"></i>
                                    </div>
                                    <div class="progress-label-right">
                                        <span id="total_one_star_review"> 0 </span> Reviews
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar bg-warning" id='one_star_progress'>
        
                                    </div>
                                </div>
                            </div>
                        </div>
        
                    </div>
        
                    <div id="display_review">
        
                    </div>
                </div>-->




        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Write your Review</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <form action ="RatingServlet" method="POST">
                        <div class="modal-body text-center">
                            <div class="form-group">
                                <input type="hidden" id='userName' name='userName' value ="<%= user.getName()%>"><h4 class="text-primary">User Name : <%= user.getName()%> </h4>
                            </div>
                            <h4>
                                <div class="container11">
                                    <div class="rating-wrap">
                                        <div class="center text-center ">
                                            <fieldset class="rating ">
                                                <input type="radio" id="star5" name="rating" value="5"/><label for="star5" class="full" title="Awesome"></label>
                                                <input type="radio" id="star4.5" name="rating" value="4.5"/><label for="star4.5" class="half"></label>
                                                <input type="radio" id="star4" name="rating" value="4"/><label for="star4" class="full"></label>
                                                <input type="radio" id="star3.5" name="rating" value="3.5"/><label for="star3.5" class="half"></label>
                                                <input type="radio" id="star3" name="rating" value="3"/><label for="star3" class="full"></label>
                                                <input type="radio" id="star2.5" name="rating" value="2.5"/><label for="star2.5" class="half"></label>
                                                <input type="radio" id="star2" name="rating" value="2"/><label for="star2" class="full"></label>
                                                <input type="radio" id="star1.5" name="rating" value="1.5"/><label for="star1.5" class="half"></label>
                                                <input type="radio" id="star1" name="rating" value="1"/><label for="star1" class="full"></label>
                                                <input type="radio" id="star0.5" name="rating" value="0.5"/><label for="star0.5" class="half"></label>
                                            </fieldset>
                                        </div>

                                        <h6 id="rating-value"></h6>
                                    </div>
                                </div>
                            </h4>
                            <div class="form-group">
                                <input type="hidden" name="postId" id="postId" value ="<%=postId%>">
                            </div>
                            <div class="form-group">
                                <textarea name="userMessage" id="userMessage" class="form-control" placeholder="Enter message" required></textarea>
                            </div>
                            <div class="form-group">
                                <button class="btn-primary" id='sendReview'>Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="jss/script.js"></script>
    </body>

</html>
</html>
