<%-- 
    Document   : ModificarClientes
    Created on : 28/10/2020, 06:12:21 PM
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
 <% 

 
                             ClienteDao clienteDao = new ClienteDao();
                                
                
           String codigo = request.getParameter("myInput");
           Cliente cliente = new Cliente(); 
           cliente = clienteDao.getClienteFromDB(codigo);  
                
           
           
            //if(codigo==null){
        %>
              <form class="form-horizontal">
                    
          <div class="form-group">
            <label class="control-label col-sm-2" for="myInput">CODIGO</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" value="<%=cliente.getId() %>" id="myInput" placeholder="Ingrese el Nombre del Producto" name="myInput">
            </div>
            
          </div>
                  <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
              <button type="submit" class="btn btn-default">Buscar</button>
 
            </div>
            </div>
            
                
            <%
                              
          
            %>
                <h2>Realice las Modificaciones corresponidentes</h2>
                <p>Si usted desea modificar el estado del Cliente, debe ir a <a href="CambiarEstadoClientes.jsp">Cambiar Estado Clientes</a></p> 
                <p>Recuerde: al momento de realizar una busqueda debe realizar las modificaciones</p>
                <p>USTED Selecciono Modificar <%=cliente.toString() %></p>
               
          <div class="form-group">
            <label class="control-label col-sm-2" for="nit">NIT</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nit" placeholder="Ingrese el Nit del Cliente" value="<%=cliente.getNit() %>" name="nit">
            </div>
          </div>          
          <div class="form-group">
            <label class="control-label col-sm-2" for="nombre">Nombre</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nombre" placeholder="Ingrese el Nombre del Cliente" value="<%=cliente.getNombre() %>" name="nombre">
            </div>
          </div>
            
          <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
              <button type="submit" class="btn btn-default">GUARDAR</button>
       
            </div>
            </div>
        
            
            </form>
               <% 
               
              String nit = request.getParameter("nit");
                String nombre = request.getParameter("nombre");
                cliente.setNit(nit);
                cliente.setNombre(nombre);
               
                clienteDao.updateCliente(cliente);
                %>
                <form action="ReporteClientes.jsp">
          <button type="submit" class="btn btn-secondary">Ver Reporte de Clientes</button>
        </form>
  </body>
</html>