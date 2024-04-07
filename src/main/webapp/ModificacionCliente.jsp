<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--Conexion-->
<html>

<head>
<meta charset="UTF-8">
<title>Modificar clientes</title>
<link rel="stylesheet" href="CSS/modificarClientes.css">
<link rel="shortcut icon" href="editar.png">
</head>
<body>

	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.Statement"%>
	<%@ page import="java.sql.ResultSet"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@ page import="java.util.Date"%>



	<%@ page import="java.sql.PreparedStatement"%>



	<!--Conexion-->
	<h3>Modificar Cliente</h3>
	<br>
	<%
	String actualizar = request.getParameter("actualizar");
	%>


	<%
	if (actualizar == null) {

		out.print("En estos momentos actualizar vale =" + actualizar);
		String nombre = request.getParameter("Nombre");
		String nif = request.getParameter("Nif");
		String correo = request.getParameter("email");
		String telefono = request.getParameter("Telefono");
	%>

	<!--  Formulario de Modificar -->

	<div class="contenedor">
		");

		<form action="ModificacionCliente.jsp" id="modificar" method="post">
			"
			<ul>

				<li><label>Nombre: </label> <input type="text" name="Nombre"
					placeholder="<%=request.getParameter("Nombre")%>"></li>

				<li><br> <label>NIF: </label> <input type="text"
					name="Nif" placeholder="<%=request.getParameter("Nif")%>"></li>

				<li><br> <label>Correo: </label><input type="text"
					name="Correo" placeholder="<%=request.getParameter("email")%>">
					<br> <label>Telefono: </label><input type="text"
					name="Telefono" placeholder="<%=request.getParameter("Telefono")%>"></li>

				<br>
				<li><br> <input type="hidden" name="nombreAnterior"
					value="<%=request.getParameter("Nombre")%>"> <!-- Campo oculto para almacenar el nombre anterior -->

					<input type="hidden" name="actualizar" value="true"> <input
					type="button" name="Enviar" value="Actualizar"
					onclick="actualizar.value='true'; submit();">
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

	String nuevoNombre = request.getParameter("Nombre");
	String nuevoNif = request.getParameter("Nif");
	String nuevoCorreo = request.getParameter("Correo");
	String nuevoTelefono = request.getParameter("Telefono");

	// hacemos la consulta Update

	String updateQuery = "UPDATE clientes SET Nombre='" + nuevoNombre + "', NIF='" + nuevoNif + "', email='" + nuevoCorreo
			+ "', Telefono='" + nuevoTelefono + "' WHERE Nombre='" + request.getParameter("nombreAnterior") + "'";

	// ejecutamos ResultSet

	filasActualizadas = estado.executeUpdate(updateQuery);
	out.print(updateQuery);

	}
	%>

	<form action="edicionCliente.jsp" name="editar.jsp">
		<input type="submit" value="volver a editar">
	</form>
</body>
</html>