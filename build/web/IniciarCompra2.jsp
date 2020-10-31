<%-- 
    Document   : IniciarCompra2
    Created on : 30/10/2020, 08:13:31 PM
    Author     : rvasquez
--%>
<%@page import="java.util.ArrayList"%>
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
   
              String tipo = request.getParameter("sel1");
              String prdc=request.getParameter("producto");
              String clint=request.getParameter("clnt");
              String autoid=request.getParameter("autoid");
              String cantidad=request.getParameter("cantidad");
              ProductoDao productoDao = new ProductoDao();
            ClienteDao clienteDao= new ClienteDao();
            OrdenDao ordenDao= new OrdenDao();
          if(cantidad==null){
              
        %>
        <form class="form-horizontal" action="IniciarCompra2.jsp">
            <div class="form-group">
                <label class="control-label col-sm-2" for="autoid">AUTO ID</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="autoid" name="autoid" value="<%= request.getParameter("autoid")%>" >
            </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-sm-2" for="clnt">Cliente</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="autoid" name="clnt" value="<%= request.getParameter("clnt")%>" >
            </div>
            </div>
            <div class="form-group">
            
            <div class="col-sm-10">
                <input type="text" class="form-control" value="I N G R E S E   S U   O R D E N" disabled>
            </div>
          </div>
            <% 
               //------------------------------------------------
            
            
              %>
              
             <div class="form-group">
            <label class="control-label col-sm-2" for="producto">Seleccione el Producto</label>
            <div class="col-sm-10">
             <select class="form-control" id="producto" name="producto">
                 <%
          
          List<Producto> productos= productoDao.getDBProducto();
           int i=0;
              for( Producto producto : productos){
              //4. Pintar el HTML que correponde a cada carrera
                i++;
              %>
              <option><%=producto.getNombre()%></option>
              <% 
               }
              %>
             </select> 
            </div> 
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="cantidad">Ingrese la Cantidad</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="cantidad" name="cantidad" >
            </div>
            </div>
             
            <div class="form-group">
             <label for="sel1">Seleccione si desea continuar:</label>
             <select class="form-control" id="sel1" name="sel1">
               <option>Seleccione una opcion</option>
                 <option>Si</option>
               <option>No</option>
             </select>
           </div> 
             

              
              
              <button type="submit" class="btn btn-secondary">Agregar Productos al carrito</button>
           </div> 
            
          
              
            </form>
            <% 
          } else{
             

              
              if(tipo.equals("Si")){
                  //ItemOrden(int id,Producto producto,int cantidad)
                  ordenDao.saveItem(new ItemOrden(ordenDao.getNextIntItem(),productoDao.getProductoPorNombre(prdc),ordenDao.ParseInt(cantidad)),ordenDao.ParseInt(autoid));
        
                  
                  
                  %>
         <form >
             <div class="form-group">
                <label class="control-label col-sm-2" for="autoid">AUTO ID</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="autoid" name="autoid" value="<%= request.getParameter("autoid")%>" >
            </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-sm-2" for="clnt">Cliente</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="autoid" name="clnt" value="<%= request.getParameter("clnt")%>" >
            </div>
            </div>
            <button type="submit" class="btn btn-secondary">Seguir Insertando Productos</button>
        </form>
        
        <%
             }else if(tipo.equals("No")){
                 ordenDao.saveItem(new ItemOrden(ordenDao.getNextIntItem(),productoDao.getProductoPorNombre(prdc),ordenDao.ParseInt(cantidad)),ordenDao.ParseInt(autoid));       
               ordenDao.saveOrden(new Orden(ordenDao.ParseInt(autoid),clienteDao.getClientePorNombre(clint)));
                  
               
               %>
               
                <div class="alert alert-success" role="alert">
                La Orden fue creada exitosamente <a href="ReporteOrdenes.jsp" class="alert-link">Ver Listado de Ordenes</a>. 
                </div>
            <% 
             }else{
                  
             }
      
              
              
          }
          
              %>
            
        
        

        
  </body>
</html>
