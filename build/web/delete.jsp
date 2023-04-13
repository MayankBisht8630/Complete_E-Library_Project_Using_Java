<%@page import ="com.tech.blog.dao.*" %>
<%@page import ="com.tech.blog.entities.*" %>
<%@page import ="com.tech.blog.helper.*" %>
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
String id = request.getParameter("pid");
try
{
    Connection con = ConnectionProvider.getConnection();
    Statement stmt = con.createStatement();
    String query = "delete from posts where pid ='"+id+"'";
    stmt.executeUpdate(query);
    
    response.sendRedirect("deletebook.jsp?msg=valid");
}
catch(Exception e)
{
    response.sendRedirect("deletebook.jsp?msg=invalid");
}
%>