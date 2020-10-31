<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <title>LOGIN Sistema de Control de Ventas</title></head>
    <body>
        <div class="container">
        <h2>Ingreso al Sistema de Ventas</h2>
    <div class="login">

   <form class="form-horizontal">
            <div class="form-group">
              <label class="control-label col-sm-2" for="user">Usuario </label>
            
       <div class="col-sm-10">
              <input type="text" class="form-control" id="user" name="user" placeholder="admin">              
            </div>            
           
              <label class="control-label col-sm-2" for="password">Contraseña</label>
              
       <div class="col-sm-10">
              <input type="password" class="form-control" id="password" name="password" placeholder="123456">
            </div>
              
            
            </div>
       
       <button type="submit" class="btn btn-primary">VALIDAR</button>
          </form>
    </div>
        </div>
        <%%>
        <%
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            String x="admin";String y="123456";
            if (x.equals(user)){
                if (y.equals(password)){
                %>
                <br><h1> Validacion Correcta</h1><br>
                  <a href="Principal.jsp"><button type="submit" class="btn btn-primary">CARGAR MENU</button></a><%
                }
            }
        %>
      
        
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    </body>
</html>
