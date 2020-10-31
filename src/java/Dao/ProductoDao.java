/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
import clases.Producto;
import utils.VariablesGlobales;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author rvasquez
 */
public class ProductoDao {
     /**
     * Método para obtener todos los registros de la base de datos como objetos
     * @return List de Productos
     */
    public List<Producto> getDBProducto(){
        List<Producto> productos = new ArrayList<Producto>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT * FROM productos";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                productos.add(new Producto(rs.getInt("idProducto"), rs.getString("nombre"), rs.getString("marca"), rs.getDouble("precio"), rs.getString("estado")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productos;
    }
    public Producto getProductoFromDB(String codigo){
        Producto producto=new Producto();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "SELECT * from productos where productos.\"idProducto\" ='"+codigo+"'";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                producto= new Producto(rs.getInt("idProducto"), rs.getString("nombre"), rs.getString("marca"), rs.getDouble("precio"), rs.getString("estado"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return producto;
    }
    public Producto getProductoPorNombre(String nombre){
        Producto producto=new Producto();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "SELECT * from productos where nombre='"+nombre+"'";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                producto= new Producto(rs.getInt("idProducto"), rs.getString("nombre"), rs.getString("marca"), rs.getDouble("precio"), rs.getString("estado"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return producto;
    }
    
    
    //actualizar producto
    public void updateProducto(Producto producto){
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String dml = "Update productos set nombre='"+
                         producto.getNombre()+ "',marca='" + producto.getMarca()+ "',precio='" + producto.getPrecio() + "' where productos.\"idProducto\" ='"+producto.getId()+"'";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    
    //actualizar producto
    public void CambiarEstado(Producto producto){
        String newestado="";
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            if(producto.getEstado().equals("ACTIVO")){
                newestado="INACTIVO";
            }else{
              newestado="ACTIVO";  
            }
            String dml = "Update productos set estado='"+
                         newestado+ "' where productos.\"idProducto\" ='"+producto.getId()+"'";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    //OBTENER EL CODIGO SIGUIENTE 
     public int getNextInt(){
        int x=0;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "SELECT MAX(productos.\"idProducto\") from productos";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                x=rs.getInt("max");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return x+1;
    }
     /**
     * Método sirve para persistir las carreras en la base de datos
     * @param carrera
     */
    public void saveProducto(Producto producto){
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String dml = "insert into productos values('"+
                        producto.getId() + "','" + producto.getNombre()+ "','" + producto.getMarca()+ "','" + producto.getPrecio()+ "','" + producto.getEstado() + "')";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public double ParseDouble(String strNumber) {
   if (strNumber != null && strNumber.length() > 0) {
       try {
          return Double.parseDouble(strNumber);
       } catch(Exception e) {
          return -1;   // or some value to mark this field is wrong. or make a function validates field first ...
       }
   }
   else return 0;
}
}
