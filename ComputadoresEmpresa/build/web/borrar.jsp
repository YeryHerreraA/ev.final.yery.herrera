<%-- 
    Document   : borrar
    Created on : 24-08-2023, 20:52:42
    Author     : yery_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
    </head>
    <body>         
        <%
            Connection con = null;
            Statement st = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_computadores?user=root");
                st = con.createStatement();
                st.executeUpdate("DELETE FROM tbl_computadores WHERE id_computador='" + request.getParameter("id_computador") + "'");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>