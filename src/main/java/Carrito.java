
import java.util.ArrayList;

 
  
public class Carrito {  
  
  private ArrayList<ElementodeCarrito> elementos = new ArrayList<>();  
  
  public Carrito() {  
  }  
  
  public Carrito(ArrayList<ElementodeCarrito> elementos) {  
    this.elementos = elementos;  
  }  
  
  public ArrayList<ElementodeCarrito> getElementos() {  
    return elementos;  
  }  
  
  public boolean existeElementoConCodigo(int codigo) {  
    return this.posicionElementoConCodigo(codigo) != -1;  
  }  
  
  public void meteProductoConCodigo(int codigo) {  
    if (this.existeElementoConCodigo(codigo)) {  
      elementos.get(posicionElementoConCodigo(codigo)).incrementaCantidad(1);  
    } else {  
      Catalogo catalogo = new Catalogo();  
      catalogo.cargarDatos();  
      elementos.add(new ElementodeCarrito(catalogo.productoConCodigo(codigo), 1));  
    }  
  }  
  
  public void eliminaProductoConCodigo(int codigo) {  
    if (existeElementoConCodigo(codigo)) {  
      int i = 0;  
      int posicion = 0;  
      for (ElementodeCarrito elemento : elementos) {  
        if (elemento.getProducto().getCodigo() == codigo) {  
          posicion = i;  
        }  
        i++;  
      }  
      elementos.remove(posicion);  
    }  
  }  
  
  private int posicionElementoConCodigo(int codigo) {  
    int i = 0;  
    for (ElementodeCarrito elemento : elementos) {  
      if (elemento.getProducto().getCodigo() == codigo) {  
        return i;  
      }  
      i++;  
    }  
    return -1;  
  }  
}  
