/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;
public class Empresa extends Cliente {
    private String contacto;
    private Double descuento;
    public Empresa(int id, String nit, String nombre, String contacto,String estado, Double descuento) {
        super(id, nit, nombre,estado);
        this.contacto=contacto;
        this.descuento=descuento;
    }
    public String getContacto() {
        return contacto;
    }
    public Double getDescuento() {
        return descuento;
    }
    public void setContacto(String contacto) {
        this.contacto=contacto;
    }
    public void setDescuento(Double descuento) {
        this.descuento=descuento;
    }

    public String toString(){
        String x="";
        x="id="+super.getId()+" Nit="+super.getNit()+" Nombre="+super.getNombre()+" Contacto="+contacto+" Descuento="+descuento*100+"%"+" Estado="+super.getEstado();
        return x;
    }
    public String getNombreClase() {
        return "Empresa";
    }
}
