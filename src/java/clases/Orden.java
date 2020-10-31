/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Orden {
    private int id;
    private Cliente cliente;
    private Double total;
    //private Date fechahora;
    private List<ItemOrden> Productos = new ArrayList<ItemOrden>();
    public Orden(){
    }
    public Orden(int id,Cliente cliente){
        this.cliente=cliente;
        this.id=id;
        //this.fechahora=fechahora;
    }
    public int getId() {
        return id;
    }
    public List<ItemOrden> getLista() {
        return Productos;
    }
    public Cliente getCliente() {
        return cliente;
    }
    public void addProducto(ItemOrden producto){
        Productos.add(producto);
    }
    public Double gettotal() {
        this.total=0.0;
        for(int i=0;i<Productos.size();i++){
            this.total=this.total+Productos.get(i).getSubtotal();
        }
        return this.total*(1-cliente.getDescuento());
    }
    public int obtenerIDNuevoItem(){
        return this.Productos.size()+1;
    }
    public String toString(){//EDITAR ESTO
        String x="";
        for(int i=0;i<Productos.size();i++){
            x=x+"   "+Productos.get(i).toString()+"<br>";

        }
        return x;
    }
}
