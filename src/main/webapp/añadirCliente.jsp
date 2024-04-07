<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir Cliente</title>
<link rel="stylesheet" href="cliente.css">
</head>
<body>
	<h3>Añadir cliente</h3>

	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.Statement"%>
	<%@ page import="java.sql.ResultSet"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@ page import="java.util.Date"%>

	<%
	String añadirCliente = request.getParameter("añadir");
	%>
	// Si añadir cliente es null , mostrarás el formulario

	<%
	if (añadirCliente == null) {
	%>
	<div class="contenedor">


		<form action="añadirCliente.jsp" id="añadir" method="post">

			<ul>

				<li><label>Nombre: </label><br> <input type="text"
					name="Nombre" placeholder="introduce el Nombre"></li>
				<br>


				<li><label>NIF: </label> <br> <input type="text"
					name="Nif" placeholder="introduce el Nif"></li>
				<br>

				<li><label>Correo: </label> <br> <input type="text"
					name="Correo" placeholder=" introduce el email"> <br>

					<label>Telefono: </label> <br> <input type="text"
					name="Telefono" placeholder="introduce el Telefono"></li>
				<br>


				<br>
				<li><br> <input type="hidden" name="añadir" value="true">
					<input type="button" name="Enviar" value="Actualizar"
					onclick="añadir.value='true'; submit();">
				<li>
			</ul>
		</form>
	</div>

	<%
	} else {

	// establecemos conexion con el servidor 
	Connection conexion = null;
	Statement estado = null;
	ResultSet resultado = null;
	int filasActualizadas = 0;
	// Controlador 
	String controlador = "com.mysql.cj.jdbc.Driver";
	Class.forName(controlador);
	String url = "jdbc:mysql://localhost:3307/partes_de_trabajo";
	String usuario = "root";
	String pass = "1111";

	// Verificar estado de la sesion iniciada

	conexion = DriverManager.getConnection(url, usuario, pass);

	estado = conexion.createStatement();

	String añadirNombre = request.getParameter("Nombre");
	String añadirNIF = request.getParameter("Nif");
	String añadirCorreo = request.getParameter("Correo");
	String añadirTelefono = request.getParameter("Telefono");

	// Añadir 

	String añadirQuery = "INSERT INTO clientes (Nombre , NIF, email,Telefono) VALUES ('" + añadirNombre + "','" + añadirNIF
			+ "','" + añadirCorreo + "','" + añadirTelefono + "')";
	int filasInsertadas = estado.executeUpdate(añadirQuery);
	out.print(añadirQuery);
	

	}%>
	

	<form action="añadirCliente.jsp">
		<input type="submit" value="volver"> <input type="button"
			value="Atras" onclick="javascript:window.history.back()"></input>
	</form>

</body>
</html>