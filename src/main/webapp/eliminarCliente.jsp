<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>


<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/eleminarCliente.css">
<title>EliminarCliente</title>
</head>
<body>
	<h1>Eliminar Cliente</h1>

	<%
	Connection conexion = null;
	Statement estado = null;
	ResultSet resultado = null;

	String controlador = "com.mysql.cj.jdbc.Driver";

	Class.forName(controlador);

	String url = "jdbc:mysql://localhost:3307/partes_de_trabajo";
	String usuario = "root";
	String pass = "1111";

	conexion = DriverManager.getConnection(url, usuario, pass);
	out.println("conexion");

	estado = conexion.createStatement();
	out.println("Conexión realizada");
	%>
	
	<% 
	
	// Atributos del jsp
	
	boolean value=false; 
	int filasEliminadas=0;
	
	String eliminarNombre=request.getParameter("nombre");
	String eliminarNif = request.getParameter("Nif");
	String eliminarCorreo = request.getParameter("email");
	String eleminarTelefono = request.getParameter("telefono");
	
	%>
<div class="contenedor">
	<form>

		<label> ¿Quieres borrar estos datos ?</label><br> 
		
		<%out.print("Nombre: "+ eliminarNombre+" , "+"Nif: "+eliminarNif+" , "+"email: "+eliminarCorreo+" , "+"Telefono: "+eleminarTelefono); %>
		
		<br><input type="submit" name="Si" Value="Si">  
			<input type="submit" name="No" value="No">
		<br><input type="hidden" name="siBorrar" value="true"> 
			<input type="hidden" name="noBorrar" value="false">
			
			<input type="hidden" name="Nombre" value="<%= request.getParameter("Nombre") %>">
            <input type="hidden" name="Nif" value="<%= request.getParameter("Nif") %>">
            <input type="hidden" name="Correo" value="<%= request.getParameter("email") %>">
            <input type="hidden" name="Telefono" value="<%= request.getParameter("Telefono") %>">



		<%
		if (request.getParameter("siBorrar") != null) {
		%><label> Resultado : <%
		out.print("el resultado a sido falso:  " + request.getParameter("value"));
		%>
			<%
			} else {
								// Delete from clientes where nombre , nif , telefono , correo = parametro cogido de editar
			String deleteQuery = "DELETE FROM clientes WHERE nombre='" + eliminarNombre + "' AND nif='" + eliminarNif + "' AND email='" + eliminarCorreo + "' AND telefono='" + eleminarTelefono + "'";
			filasEliminadas=estado.executeUpdate(deleteQuery);
			}
			%>
	</form>
</div>
</body>
</html>