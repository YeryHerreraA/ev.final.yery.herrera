<%-- 
    Document   : editar
    Created on : 24-08-2023, 20:52:26
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
        <title>Actualizar Registros</title>
    </head>
    <body>
        <%
            String strID = request.getParameter("id_computador");
            String strMarca = request.getParameter("marca_computador");
            String strMemoria = request.getParameter("memoria_computador");
            String strProcesador = request.getParameter("procesador_computador");
            String strRam = request.getParameter("ram_computador");
        %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="post">
                        <div class="form-group">
                            <label>Marca Computador</label>
                            <input name="marca_computador" value="<%=strMarca%>" type="text" class="form-control"  placeholder="Ingrese marca" required="">
                        </div>
                        <div class="form-group">
                            <label>Memoria Computador</label>
                            <input name="memoria_computador" value="<%=strMemoria%>" type="text" class="form-control"  placeholder="Ingrese Cantidad de Memoria" required="">
                        </div>
                        <div class="form-group">
                            <label>Procesador Computador</label>
                            <input name="procesador_computador" value="<%=strProcesador%>" type="text" class="form-control"  placeholder="Procesador AMD/Intel" required="">
                        </div>
                        <div class="form-group">
                            <label>Ram computador</label>
                            <input name="ram_computador" value="<%=strRam%>" type="text" class="form-control"  placeholder="Cantidad de Memoria Ram" required="">
                        </div>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">ACTUALIZAR <i class="fa fa-arrow-right"></i></button>
                        <a href="index.jsp" class="btn btn-danger">CANCELAR <i class="fa fa-times"></i></a>
                        <input type="hidden" name="id_computador" value="<%=strID%>">
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_computadores?user=root");
                    st = con.createStatement();
                    st.executeUpdate("UPDATE tbl_computadores SET marca_computador = '" + strMarca+ "', memoria_computador='"+ strMemoria+"', procesador_computador='"+strProcesador+"', ram_computador='"+strRam+"' WHERE id_computador='"+ strID +"'");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>