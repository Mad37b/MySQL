import java.util.ArrayList;
import java.util.List;

public class Catalogo {

	// lista de productos en el catalogo
	ArrayList<Producto> productos = new ArrayList<>();

	public void cargarDatos() {

		// metemos 8 datos
		
		productos.clear();
		/** 1 **/ productos.add(new Producto(1, "Curso 1", 10, "test 1"));
		/** 2 **/ productos.add(new Producto(2, "Curso 2", 20, "test 2"));
		/** 3 **/ productos.add(new Producto(3, "Curso 3", 30, "test 3"));
		/** 4 **/ productos.add(new Producto(4, "Curso 4", 40, "test 4"));
		/** 5 **/ productos.add(new Producto(5, "Curso 5", 50, "test 5"));
		/** 6 **/ productos.add(new Producto(6, "Curso 6", 60, "test 6"));
		/** 7 **/ productos.add(new Producto(7, "Curso 7", 70, "test 7"));
		/** 8 **/ productos.add(new Producto(8, "Curso 8", 80, "test 8"));

	}
	// metemos 8 datos
	public  ArrayList<Producto> getProductos() {
		
		
		return productos;
	}

	public Producto productoConCodigo(int codigo) {
		for (Producto productos : productos) {
			if (productos.getCodigo() == codigo) {
				return productos;
			}
		}
		return null;
	}
	
}
