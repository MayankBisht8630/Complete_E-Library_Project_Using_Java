<%@page errorPage="error_page.jsp" %>
<%@page import ="com.tech.blog.dao.*"%>
<%@page import ="com.tech.blog.helper.*"%>
<%@page import ="com.tech.blog.entities.*"%>
<%@page import ="java.util.List"%>
<div class="row">
    <% 
    Postdao d = new Postdao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if(cid == 0)
    {
     posts = d.getAllPosts();
    }
    else
    {
     posts = d.getPostByCatId(cid);
    }
    if(posts.size() == 0)
    {
    out.println("<h1 class='display-3 text-center'> No Books In This Category !!</h1>");
    return;
    }
    for(Post p :posts)
    {
    %>
    <div class="col-md-6 mt-4">
        <div class="card" style="width: 21vw;">
            <img class="card-img-top" style="height:40vh ; width: 21vw" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getpTitle() %></b>
                <p><%= p.getpContent() %></p>
                <p> Available Books Quantity : <%= p.getpQuantity() %></p>
            </div>
            <div class="card-footer text-center primary-background">
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm" > Read More </a>
            </div>
        </div>
    </div>
    <%
    }
    %>
</div>

<script
    src="https://code.jquery.com/jquery-3.6.3.min.js"
    integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
    crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
<script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!--<script src="jss/myjs.js" type="text/javascript"></script>-->
