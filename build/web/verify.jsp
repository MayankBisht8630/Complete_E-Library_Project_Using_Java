<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.tech.blog.entities.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E Library</title>
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .parent_div{
                width : 100vw;
                height : 80vh; 
                position: relative;
            }
            
            .card{
                width : 30vw;
                height : 35vh;
                position :absolute;
                left :50%;
                top :50%;
                transform: translate(-50% , -50%);
                
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
                </ul>
            </div>
        </nav>

        <!--End of navber-->

        <br>
        <br>
        <br>
        <br>

        <!--main body-->
        <div class="parent_div">
            <div class="card text-center primary-background">
                <div class="card-body">
                    <% Message m = (Message)session.getAttribute ("msgg");
                               if(m != null)
                               {
                            %>
                            <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent()  %>
                            </div>
                            <%
                               session.removeAttribute("msgg");
                                }
                            %>
                    <h5 class="card-title primary-background"><h3>Enter Code Here</h3></h5>
                    <form action="VerifyCode" method="post">
                        <input type="text" name="authcode">
                        <br>
                        <br>
                        <button type ="submit" class="btn btn-outline-primary btn-secondary text-white"> Verify </button>
                        <a href="register_page.jsp" type ="submit" class="btn btn-outline-primary btn-secondary text-white"> Back </a>
                    </form>
                </div>
            </div>
        </div>
        <!--end of main body-->

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
