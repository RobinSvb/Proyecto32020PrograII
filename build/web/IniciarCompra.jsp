<%-- 
    Document   : IniciarCompra
    Created on : 28/10/2020, 06:21:28 PM
    Author     : rvasquez
--%>
<%@page import="java.util.List"%>
<%@page import="clases.*"%>
<%@page import="Dao.*"%>
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
        <h2>Formulario de Ingreso de Orden</h2>
         <% 
                String clnt = request.getParameter("clnt");
                String autoid = request.getParameter("autoid");
                 OrdenDao ordenDao= new OrdenDao();
 
        %>
        <form class="form-horizontal" action="IniciarCompra2.jsp">
            <div class="form-group">
            <label class="control-label col-sm-2" for="autoid">AUTO ID</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="autoid" name="autoid" value="<%=ordenDao.getNextInt() %>" >
            </div>
            </div>
            
             <div class="form-group">
            <label class="control-label col-sm-2" for="clnt">Seleccione el Cliente</label>
            <div class="col-sm-10">
             <select class="form-control" id="clnt" name="clnt">
                 <%
          ClienteDao clientedao = new ClienteDao();
          List<Individual> clientes= clientedao.getDBClientesIndividuales();  
           int i=0;
              for( Individual cliente : clientes){
              //4. Pintar el HTML que correponde a cada carrera
                i++;
              %>
              <option><%=cliente.getNombre()%></option>
              <% 
               }
              %>
              <%
          
          List<Empresa> clientes2= clientedao.getDBClientesEmpresas();  
           i=0;
              for( Empresa cliente : clientes2){
              //4. Pintar el HTML que correponde a cada carrera
                i++;
              %>
              <option><%=cliente.getNombre()%></option>
              <% 
               }
             
              
              
              %>
               
             </select>
              
           </div> 
        </div>
            <button type="submit" class="btn btn-secondary">Continuar para Productos al carrito</button>
            </form>
            <% 
              %>
           
        </div>

        
  </body>
</html>
