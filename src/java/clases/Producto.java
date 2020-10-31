package clases;

public class Producto {
    private int id;
    private String nombre;
    private String marca;
    private Double precio;
    private String estado;

    public Producto(){
    }
    public Producto(int id,String nombre, String marca, Double precio,String estado){
        this.id=id;
        this.nombre=nombre;
        this.marca=marca;
        this.precio=precio;
        this.estado=estado;
    }
    public int getId() {
        return id;
    }
    public String getNombre() {
        return nombre;
    }
    public String getMarca() {
        return marca;
    }
    public Double getPrecio() {
        return precio;
    }
    public String getEstado() {
        return estado;
    }
    public void setId(String ide) {
        int x=Integer.parseInt(ide);
        this.id=x;
    }
    public void setPrecio(Double precio) {
        this.precio=precio;
    }
    public void setNombre(String nombre) {
        this.nombre=nombre;
    }
    public void setMarca(String marca) {
        this.marca=marca;
    }
    public void setEstado(String estado) {
        this.estado=estado;
    }
    public String toString(){
        String x="";
        x="id= "+id+", nombre= "+nombre+", marca= "+marca+", precio unitario= Q"+precio+", Estado= "+estado;
        return x;
    }
}
