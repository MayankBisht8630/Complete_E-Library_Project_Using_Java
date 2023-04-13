<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.tech.blog.entities.*" %>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password Page</title>
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
        <%@include file="normal_navbar.jsp" %>
        <!--end of navbar-->


        <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
            <div class ="container">
                <div class ="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-unlock fa-3x"></span>
                                <h5> Reset Password Here !!</h5>
                            </div>
                             <% Message m = (Message)session.getAttribute ("msg");
                               if(m != null)
                               {
                            %>
                            <div class="alert text-center <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent()  %>
                            </div>
                            <%
                                
                                session.removeAttribute("msg");
                                }
                            %>
                            <div class="card-body">
                                <div class="forgot">
                                    <p><h6 class="text-warning">Change your password in three easy steps. This will help you to secure your password!</h6></p>
                                    <ol class="list-unstyled text-primary">
                                        <li><span class="text-primary text-medium">1. </span>Enter your email address below.</li>
                                        <li><span class="text-primary text-medium">2. </span>Our system will send you an OTP to your email</li>
                                        <li><span class="text-primary text-medium">3. </span>Enter the OTP on the next page</li>
                                    </ol>
                                </div>
                                <form action="ForgotPassword" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1" class="text-primary">Email address</label>
                                        <input name ="email" required type="email" class="form-control" id="email-for-pass" required="" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-danger">Enter The Registered Email Address . Then We'll Email A OTP To This Address</small>
                                    </div>
                                    <div class="container text-center " id="loader" style="display: none">
                                        <span class="fa fa-refresh fa-spin fa-3x"></span>
                                        <h3> Please Wait !!</h3>
                                    </div>
                                    <div id="reset-details">
                                        <div class="container text-center">
                                            <button id ="get-otp-button" type="submit" class="btn btn-primary">Get OTP</button>
                                            <a href="login_page.jsp" class="btn btn-primary"> <span class=" fa fa-hand-o-left"></span> Back </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--Java Script-->
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script type="text/javascript">
                var status = document.getElementById("status").value;
                if (status == "forgotpassword")
                {
                    swal("Oops!", "Password Cannot Be Reseted !!", "error");
                }
        </script>

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#get-otp-button').click(function () {
                    if (editStatus == false)
                    {
                        $("#reset-details").hide();
                        $("#loader").show();
                        editStatus = true;
                        $(this).text("Back")
                    } else
                    {
                        $("#reset-details").show();
                        $("#loader").hide();
                        editStatus = false;
                        $(this).text("Edit")
                    }
                })
            });
        </script>
    </body>
</html>
