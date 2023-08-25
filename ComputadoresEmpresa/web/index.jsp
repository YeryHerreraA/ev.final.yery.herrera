<%-- 
    Document   : index
    Created on : 19-08-2023, 14:27:04
    Author     : yery_
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>listado de productos</title>
    </head>
    <body>

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
  
            
        
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped table-success table-hover table-bordered border-dark">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col" colspan="5" class="text-center table-dark">Computadores Empresa</th>
                                <th scope="col">
                                    <a href="crear.jsp"><i class="fa-solid fa-user-plus"></i></a>
                                </th>
                            </tr>
                            <tr class="table-dark">
                    <th scope="col">ID</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Memoria</th>
                    <th scope="col">Procesador</th>
                    <th scope="col">Ram</th>
                    <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_computadores?user=root");
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM tbl_computadores");
                while (rs.next()) {
                  %>  
                    <tr>
                        <th scope="row"><%=rs.getString("id_computador")%></th>
                    <td><%=rs.getNString("marca_computador")%></td>
                    <td><%=rs.getNString ("memoria_computador")%></td>
                    <td><%=rs.getNString("procesador_computador")%></td>
                    <td><%=rs.getNString("ram_computador")%></td>
                   <td>  <a href="editar.jsp?id_computador=<%= rs.getString(1)%>&marca_computador=<%= rs.getString(2)%>&memoria_computador=<%= rs.getString(3)%>&procesador_computador=<%= rs.getString(4)%>&ram_computador=<%= rs.getString(5)%>"<i class="fa fa-pencil-alt"></i></a>
                                    &nbsp;
                                    <a href="borrar.jsp?id_computador=<%= rs.getString(1)%>"><i class="fa fa-trash-alt"></i></a>
                                </td>
                </tr>
                            
                <% }
                %>      
                        </tbody
                
        </table>
    </body>
</html>
