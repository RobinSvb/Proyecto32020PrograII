/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

public class ItemOrden {
    private int id;
    private Producto producto;
    private int cantidad;
    private Double subtotal;
    public ItemOrden() {
    }
    public ItemOrden(int id,Producto producto,int cantidad) {
        this.cantidad = cantidad;
        this.producto = producto;
        this.id = id;
        this.subtotal=cantidad*producto.getPrecio();
    }
    public int getId() {
        return id;
    }
    public int getCantidad() {
        return cantidad;
    }
    public Producto getProducto() {
        return producto;
    }
    public Double getSubtotal() {
        return subtotal;
    }
    public void setCantidad(int cant) {
        this.cantidad=cant;
        this.subtotal=cantidad*producto.getPrecio();
    }

    public String toString(){
        String x="";
        x="|ITEM|  ID="+id+", Producto="+producto.getNombre()+", Precio unitario=Q"+producto.getPrecio()+", Cantidad Solicitada="+cantidad+", SubTotal=Q"+subtotal;
        return x;
    }
}
