<%-- 
    Document   : crear
    Created on : 24-08-2023, 20:50:43
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
        <title>Registros Nuevos</title>
    </head>
    <body>

        <div class="container mt-5" >
            <div class="row">
                <div class="col-sm">
                    <form  action="crear.jsp" method="post">
                        <div class="form-group">
                            <label>Marca Computador</label>
                            <input name="marca_computador" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese Marca del Computador" required="">
                        </div>
                        <div class="form-group">
                            <label>Memoria Computador</label>
                            <input name="memoria_computador" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese la Memoria del Computador " required="">
                        </div>
                        <div class="form-group">
                            <label>Procesador Computador</label>
                            <input name="procesador_computador" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese la Marca del Procesador" required="">
                        </div>
                        <div class="form-group">
                            <label> Ram Computador</label>
                            <input name="ram_computador" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese la Memoria Ram de su Computador " required="">
                        </div>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success col-md-4 offset-md-4 text-center">REGISTRAR <i class="fa fa-arrow-right"></i></button>
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                String strMarca = request.getParameter("marca_computador");
                String strMemoria = request.getParameter("memoria_computador");
                String strProcesador = request.getParameter("procesador_computador");
                String strRam = request.getParameter("ram_computador");

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_computadores?user=root");
                    st = con.createStatement();
                    st.execute("INSERT INTO tbl_computadores(marca_computador,memoria_computador,procesador_computador,ram_computador) VALUES('" + strMarca + "','" + strMemoria + "','" + strProcesador + "','" + strRam + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>

