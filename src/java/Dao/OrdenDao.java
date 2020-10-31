/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
import clases.*;
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
public class OrdenDao {
     public List<ItemOrden> getDBItems(String idOrden){
        List<ItemOrden> items = new ArrayList<ItemOrden>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "select * from items where items.\"idOrden\"='"+idOrden+"'";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                //public ItemOrden(int id,Producto producto,int cantidad)
                //public Producto(int id,String nombre, String marca, Double precio,String estado)
                ProductoDao productoDao = new ProductoDao();
                Producto producto = new Producto(); 
                producto = productoDao.getProductoFromDB(rs.getString("idProducto"));
                items.add(new ItemOrden(rs.getInt("idItem"),producto, rs.getInt("cantidad"))); 
                 }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return items;
    }
     
    public List<Orden> getDBOrdenes(){
        List<Orden> ordenes = new ArrayList<Orden>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "select * from \"Ordenes\"";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
          
           ClienteDao clienteDao = new ClienteDao();
           Cliente cliente = new Cliente(); 
           cliente = clienteDao.getClienteFromDB(rs.getString("idCliente"));
                    Orden orden = new Orden(rs.getInt("idOrden"),cliente);
                    //añadir ordenes
                    List<ItemOrden> items =getDBItems(rs.getString("idOrden"));
                    for(int i=0;i<items.size();i++){
                        //agregar los items a la orden
                        orden.addProducto(items.get(i));
                    }
                    
                ordenes.add(orden); 
                 }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ordenes;
    } 
     
 
    //OBTENER EL CODIGO SIGUIENTE 
     public int getNextInt(){
        int x=0;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "SELECT MAX(\"Ordenes\".\"idOrden\") from \"Ordenes\"";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                x=rs.getInt("max");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return x+1;
    }
     public int getNextIntItem(){
        int x=0;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "SELECT MAX(items.\"idItem\") from items";
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
    public void saveOrden(Orden orden){
        try {
            
                    List<ItemOrden> items =getDBItems(orden.getId()+"");
                    for(int i=0;i<items.size();i++){
                        //agregar los items a la orden
                        orden.addProducto(items.get(i));
                    }
            
            Statement statement = VariablesGlobales.conn.createStatement();
            String dml = "insert into \"Ordenes\" values('"+
                        orden.getId() + "','" + orden.getCliente().getId()+ "','" + orden.gettotal() + "')";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
            
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
 
    }
    public void saveItem(ItemOrden item, int idOrden){
        try {
          
                        Statement statement = VariablesGlobales.conn.createStatement();
                        String dml = "insert into items values('"+
                                    item.getId() + "','" + item.getProducto().getId()+ "','" + item.getCantidad()+ "','" + item.getSubtotal()+ "','" + idOrden + "')";
                        System.out.println("dml = " + dml);
                        statement.executeUpdate(dml);
 
            
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
       
        
        
    }
    public int ParseInt(String strNumber) {
   if (strNumber != null && strNumber.length() > 0) {
       try {
          return Integer.parseInt(strNumber);
       } catch(Exception e) {
          return -1;   // or some value to mark this field is wrong. or make a function validates field first ...
       }
   }
   else return 0;
}
    public boolean validar(String x){
        boolean y=false;
        if(x.equals("Si")){
            y=true;
        }
        
        return  y;
    }
    
}
