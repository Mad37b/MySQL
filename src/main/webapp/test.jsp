<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--Conexion-->
<html>

<head>
<meta charset="UTF-8">
<title>Modificar clientes</title>
<link rel="stylesheet" href="cliente.css">
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
	Connection conexion = null;
	Statement estado = null;
	ResultSet resultado = null;

	try {
		out.println(" Deputacion de la conexion : ");
		out.println("Estacleciendo conexion con el controlador, -->");
		String controlador = "com.mysql.cj.jdbc.Driver";
		out.println("  Conexion Estaclecida con el controlador " + controlador);
		Class.forName(controlador);
		out.println("  Iniciando sesion - 0");

		String url = "jdbc:mysql://localhost:3307/partes_de_trabajo";
		String usuario = "root";
		String pass = "1111";

		out.println(
		" ,Sesion iniciada  =" + " -- " + url + " - " + "  Usuario :" + usuario + " - " + " Contraseña : " + pass);

		conexion = DriverManager.getConnection(url, usuario, pass);
		out.println("conexion" + conexion);

		estado = conexion.createStatement();
		out.println("Conexión realizada" + estado);

		String actualizar = request.getParameter("actualizar");
	%>



	<%
	if (actualizar == null) {

		String nombre = request.getParameter("Nombre");
		String nif = request.getParameter("Nif");
		String correo = request.getParameter("correo");
		String telefono = request.getParameter("Telefono");
	%>

	<!--  Formulario de Modificar -->

	<div class="contenedor">
		");

		<form action="ModificacionCliente.jsp" id="modificar" method="post">
			"
			<ul>

				<li><label>Nombre: </label> <input type="text" name="Nombre"
					placeholder="<%request.getParameter("Nombre");%>"></li>

				<li><br>
				<label>NIF: </label> <input type="text" name="Nif"
					placeholder="<%request.getParameter("Nif");%>"></li>

				<li><br>
				<label>Correo:</label><input type="text" name="Correo"
					placeholder="<%request.getParameter("correo");%>"> <br>
				<label>Telefono:</label><input type="text" name="Telefono"
					placeholder="<%request.getParameter("Telefono");%>"></li>

				<br>
				<li><br>
				<input onclick="alert('Los datos del cliente se han actualizado');"
					type="submit" value="Actualizar Datos Cliente" name="actualizar">
				<li>
			</ul>
		</form>
	</div>

	<%
	} else {
	String nuevoNombre = request.getParameter("nuevoNombre");
	String nuevoNif = request.getParameter("nuevoNif");
	String nuevoCorreo = request.getParameter("nuevoCorreo");
	String nuevoTelefono = request.getParameter("nuevoTelefono");

	String updateQuery = "UPDATE clientes SET Nombre='" + nuevoNombre + "', Nif='" + nuevoNif + "', Correo='" + nuevoCorreo + "', Telefono='" + nuevoTelefono + "' WHERE Nombre='" + request.getParameter("Nombre") + "'";

	}

	} catch (SQLException e) {
	out.print("\n ha saltado esta excepcion 1");
	e.printStackTrace();

	} finally {
	try {
	if (resultado != null)
		resultado.close();
	if (resultado != null)
		resultado.close();
	if (resultado != null)
		resultado.close();

	} catch (SQLException e2) {
	e2.printStackTrace();
	}

	}
	%>
	<form action="edicionCliente.jsp" name="editar.jsp">
		<input type="submit" value="volver a editar">
	</form>
</body>
</html>