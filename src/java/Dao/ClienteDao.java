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
public class ClienteDao {
     /**
     * Método para obtener todos los registros de la base de datos como objetos
     * @return List de Productos
     */
    public List<Individual> getDBClientesIndividuales(){
        List<Individual> clientes = new ArrayList<Individual>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT * FROM clientes";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                if(rs.getDouble("descuento")==0){
                  clientes.add(new Individual(rs.getInt("id"), rs.getString("nit"), rs.getString("nombre"), rs.getString("estado"), rs.getString("dpi")));
             
                }
                 }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return clientes;
    }
        public List<Empresa> getDBClientesEmpresas(){
        List<Empresa> clientes = new ArrayList<Empresa>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT * FROM clientes";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                if(rs.getDouble("descuento")==0){
                   }else{
                  clientes.add(new Empresa(rs.getInt("id"), rs.getString("nit"), rs.getString("nombre"), rs.getString("contacto"), rs.getString("estado"),rs.getDouble("descuento")));
                }
                 }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return clientes;
    }
    public Cliente getClienteFromDB(String codigo){
        Cliente cliente=new Cliente();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "select * from clientes where id='"+codigo+"'";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                cliente= new Cliente(rs.getInt("id"), rs.getString("nit"), rs.getString("nombre"), rs.getString("estado"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cliente;
    }
    public Cliente getClientePorNombre(String nombre){
        Cliente cliente=new Cliente();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "select * from clientes where nombre='"+nombre+"'";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                cliente= new Cliente(rs.getInt("id"), rs.getString("nit"), rs.getString("nombre"), rs.getString("estado"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cliente;
    }
    
    
    
    //actualizar producto
    public void updateCliente(Cliente cliente){
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String dml = "Update clientes set nombre='"+
                         cliente.getNombre()+ "',nit='" + cliente.getNit()+ "' where id='"+cliente.getId()+"'";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    
    //actualizar producto
    public void CambiarEstado(Cliente cliente){
        String newestado="";
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            if(cliente.getEstado().equals("ACTIVO")){
                newestado="INACTIVO";
            }else{
              newestado="ACTIVO";  
            }
            String dml = "Update clientes set estado='"+
                         newestado+ "' where id='"+cliente.getId()+"'";
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
            String consulta = "SELECT MAX(id) from clientes";
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
    public void saveEmpresa(Empresa cliente){
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String dml = "insert into clientes (id,nit,nombre,contacto,descuento,estado) values('"+
                        cliente.getId() + "','" + cliente.getNit()+ "','" + cliente.getNombre()+ "','" + cliente.getContacto()+ "','" + cliente.getDescuento()+ "','" + cliente.getEstado() + "')";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public void saveIndividual(Individual cliente){
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String dml = "insert into clientes (id,nit,nombre,dpi,descuento,estado) values('"+
                        cliente.getId() + "','" + cliente.getNit()+ "','" + cliente.getNombre()+ "','" + cliente.getNombre()+ "','0','" + cliente.getEstado() + "')";
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
