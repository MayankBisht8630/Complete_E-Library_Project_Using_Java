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

        <!--nabvar-->
        <%@include file="normal_navbar.jsp" %>
        <!--end of navbar-->


        <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
            <div class ="container">
                <div class ="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <h3>
                                    <i class="fa fa-lock fa-4x"></i>
                                </h3>
                            </div>
                            <div class="card-body">
                                <h2 class="text-center"> Enter OTP</h2>
                                <%
                                if(request.getAttribute("message")!=null)
                                {
                                 out.print("<p class='text-danger ml-1'>"+request.getAttribute("message")+"</p>");
                                }
                                %>
                                <form id="register-form" action="ValidateOtp" role="form" autocomplete="off" class="form" method="post">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span> <input id="opt" name="otp" placeholder="Enter OTP" class="form-control" type="text" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                    </div>

                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>