
public class Producto {
	
	
	//  Atributos de la clase 

	private int codigo ;
	private String nombre;
	private double precio;
	private String imagen;
	
	// constructor de la clase
	
	public Producto( int codigo, String nombre ,  double precio ,  String imagen ){
		this.codigo = codigo ;
		this.nombre = nombre;
		this.precio = precio ;
		this.imagen = imagen;
		
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
	
	//Metodos de la clase
	

	
}
