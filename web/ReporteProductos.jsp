<%-- 
    Document   : ReporteProductos
    Created on : 28/10/2020, 06:23:16 PM
    Author     : rvasquez
--%>


<%@page import="java.util.List"%>
<%@page import="clases.Producto"%>
<%@page import="Dao.ProductoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <title>Sistema de Control de Ventas</title>
    </head>
    <body>
     <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">Sistema de Ventas</a>
          </div>
          <ul class="nav navbar-nav">
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Clientes <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="IngresoClientes.jsp">Ingresar Cliente</a></li>
                <li><a href="ModificarClientes.jsp">Modificar Cliente</a></li>
                <li><a href="CambiarEstadoClientes.jsp">Activar/Inactivar</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="IngresarProductos.jsp">Ingresar Producto</a></li>
                <li><a href="ModificarProductos.jsp">Modificar Producto</a></li>
                <li><a href="CambiarEstadoProductos.jsp">Activar/Inactivar</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Ordenes <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="IniciarCompra.jsp">Iniciar Compra</a></li>
              </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Reportes <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="ReporteClientes.jsp">Reporte Clientes</a></li>
                <li><a href="ReporteProductos.jsp">Reporte Productos</a></li>
                <li><a href="ReporteOrdenes.jsp">Reporte Ordenes</a></li>
              </ul>
            </li>
            <li class="active"><a href="FormularioLogin.jsp">Cerrar Sesion</a></li>
          </ul>
        </div>
      </nav>
    <div class="container">
      <h2>Reporte de Productos</h2>
      <p>Este reporte correspondo a todos los productos existentes en la Base de Datos</p>            
      <input class="form-control" id="myInput" type="text" placeholder="Search.." name="myInput">
                   <br>
                   <table class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>#</th>
            <th>Codigo</th>
            <th>Nombre</th>
            <th>Marca</th>
            <th>Precio</th>
            <th>Estado</th>
          </tr>
        </thead>
        <tbody id="myTable">
         <%
          ProductoDao productoDao = new ProductoDao();
          List<Producto> productos= productoDao.getDBProducto();
           int i=0;
              for( Producto producto : productos){
              //4. Pintar el HTML que correponde a cada carrera
                i++;
              %>
              <tr>
                <th scope="row"><%=i%></th>
                <td><%=producto.getId()%></td>
                <td><%=producto.getNombre()%></td>
                <td><%=producto.getMarca()%></td>
                <td>Q. <%=producto.getPrecio()%></td>
                <td><%=producto.getEstado()%></td>
              <% 
               }
              %>                    
        </tbody>
        
        <form action="IngresarProductos.jsp">
          <button type="submit" class="btn btn-secondary">Ingresar Nuevos Productos</button>
        </form>
        <form action="ModificarProductos.jsp">
          <button type="submit" class="btn btn-secondary">Modificar Productos</button>
        </form>
      </table>
        
    </div>
        <script>
        $(document).ready(function(){
          $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });
        </script>
  </body>
</html>