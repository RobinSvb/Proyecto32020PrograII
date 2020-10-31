<%-- 
    Document   : IngresoClientes
    Created on : 28/10/2020, 06:11:25 PM
    Author     : rvasquez
--%>
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
        <h2>Formulario de Ingreso de Clientes</h2>
         <% 
                String nit = request.getParameter("nit");
                String nombre = request.getParameter("nombre");
                String tipo = request.getParameter("sel1");
                String descuento = request.getParameter("descuento");
                String dpires = request.getParameter("dpires");
           
            if(nombre==null && nit==null && descuento==null){
        %>
        <form class="form-horizontal" action="IngresoClientes.jsp">
          <div class="form-group">
            <label class="control-label col-sm-2" for="nit">NIT</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nit" placeholder="Ingrese el Nit del Cliente" name="nit">
            </div>
          </div>
         <div class="form-group">
            <label class="control-label col-sm-2" for="nombre">Nombre</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="nombre" placeholder="Ingrese el Nombre del Cliente" name="nombre">
            </div>
             <div class="form-group">
             <label for="sel1">Sleccione el tipo de Cliente:</label>
             <select class="form-control" id="sel1" name="sel1">
               <option>Individual</option>
               <option>Empresa</option>
             </select>
           </div> 
          </div>
           <div class="form-group">
            <label class="control-label col-sm-2" for="precio">Descuento</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="descuento" placeholder="Ingrese el Descuento del Cliente" name="descuento">
            </div>
          </div>
            
         <div class="form-group">
            <label class="control-label col-sm-2" for="dpires">DPI/Representante</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="dpires" placeholder="Ingrese dpi o Representante Segun Corresponda" name="dpires">
            </div>
          </div>
          <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
              <button type="submit" class="btn btn-default">GUARDAR</button>
       
            </div>
            </div>
            </form>
            <%
             }else{
               
                if(tipo.equals("Empresa")){
                    
                ClienteDao clienteDao= new ClienteDao();
                //2. Crear una instancia de producto
                Empresa cliente = new Empresa(clienteDao.getNextInt(),nit,nombre,dpires,"ACTIVO",clienteDao.ParseDouble(descuento));
                //3. Insertar en la DB la producto
                clienteDao.saveEmpresa(cliente);
              
                %>
                <p>USTED INGRESO <%=cliente.toString() %></p>
                <div class="alert alert-success" role="alert">
                El Cliente fue creado exitosamente <a href="ReporteClientes.jsp" class="alert-link">Ver Listado de Clientes</a>. 
                </div>
            <%
                }else if(tipo.equals("Individual")){
                    
                   ClienteDao clienteDao= new ClienteDao();
                //2. Crear una instancia de producto
                Individual cliente2 = new Individual(clienteDao.getNextInt(),nit,nombre,"ACTIVO",dpires);
                //3. Insertar en la DB la producto
                clienteDao.saveIndividual(cliente2);
              
                %>
                <p>USTED INGRESO <%=cliente2.toString() %></p>
                <div class="alert alert-success" role="alert">
                El Cliente fue creado exitosamente <a href="ReporteClientes.jsp" class="alert-link">Ver Listado de Clientes</a>. 
                </div>
            <% 
                    
                    
                    
                
                }else{//end if de empresa
                    %>
               <p>El combox dice <%=tipo %></p>
                <div class="alert alert-success" role="alert">
                Usted no ingreso nada <a href="ReporteClientes.jsp" class="alert-link">Ver Listado de Clientes</a>. 
                </div>
            <%
                    
                }
            
                } //end if
                %>
            
        <form action="ReporteClientes.jsp">
          <button type="submit" class="btn btn-secondary">Ver Reporte de Clientes</button>
        </form>
        </div>

        
  </body>
</html>