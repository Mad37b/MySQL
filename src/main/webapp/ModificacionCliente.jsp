<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--Conexion-->
<%

%>



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
	<%@ page import="Mensajes.Mensaje"%>
	<%@ page import="Validacion.ValidarPartes"%>



	<!--Conexion-->
	<h3>Modificar Cliente</h3>
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

		String url = "jdbc:mysql://localhost:3306/partes";
		String usuario = "root";
		String pass = "root";

		out.println(
		" ,Sesion iniciada  =" + " -- " + url + " - " + "  Usuario :" + usuario + " - " + " Contraseña : " + pass);

		conexion = DriverManager.getConnection(url, usuario, pass);
		out.println("conexion" + conexion);

		estado = conexion.createStatement();
		out.println("Conexión realizada" + estado);

		// UPDATE

		String update = "UPDATE clientes SET Nombre=" + request.getParameter("Nombre") + "Where ="
		+ request.getParameter("Nombre") + request.getParameter("Nif");

		// Variables para nuevo Nombre

		String nuevoNombre = ("");
		String nuevoNif = ("");
		String nuevoCorreo = ("");
		String nuevoTelefono = ("");

		int resultUpdate1 = estado.executeUpdate(update);
		int resultUpdate2 = estado.executeUpdate(update);
		int resultUpdate3 = estado.executeUpdate(update);
		int resultUpdate4 = estado.executeUpdate(update);

		ValidarPartes vNombre = new ValidarPartes();
		ValidarPartes vNif= new ValidarPartes();
		ValidarPartes vCorreo = new ValidarPartes();
		ValidarPartes vTelefono = new ValidarPartes();
		
		// Metodo para Validar Nuevos Partes 
		

		if (nuevoNombre != null && !nuevoNombre.isEmpty() && vNombre.validarNif("Nif")) {

			update += "nuevoNombre";

		}
		if (nuevoNif != null && !nuevoNif.isEmpty() && vNif.validarNif("Nif")) {

			update += "nuevoNif";

		}
		if (nuevoCorreo != null && !nuevoCorreo.isEmpty() && vCorreo.validarEmail("Nif")) {

			update += "nuevoCorreo";

		}
		if (nuevoTelefono != null && !nuevoTelefono.isEmpty() && vTelefono.validarTelefono("Nif")) {

			update += "nuevoTelefono";

		}

		out.print("<div class=\"contenedor\">");

		out.println("<form action=\"modificacionCliente.jsp\" id=\"modificar\">");
		out.println("<ul>");

		out.println("<li>");
		out.print("<label>Nombre: </label>");
		out.print("<input type=\"text\" name=\"Nombre\" placeholder=\"" + request.getParameter("Nombre") + "\">");
		out.println("</li>");

		out.println("<li>");
		out.print("<br><label>NIF: </label>");
		out.print("<input type=\"text\" name=\"Nif\" placeholder=\"" + request.getParameter("Nif") + "\">");
		out.println("</li>");
		out.println("<li>");
		out.print("<br><label>Correo:</label><input type=\"text\" name=\"Correo\" placeholder=\""
		+ request.getParameter("Correo") + "\">");
		out.print("<br><label>Telefono:</label><input type=\"text\" name=\"Telefono\" placeholder=\""
		+ request.getParameter("Telefono") + "\">");
		out.println("</li>");

		out.print("<br>");
		out.println("<li>");
		out.print(
		"<br><input onclick=\"alert('Los datos del cliente se han actualizado');\" type=\"submit\" value= \"Actualizar Datos Cliente\" name=\"actualizar\">");
		out.println("<li>");
		out.println("</ul>");
		out.print("</form>");
		out.print("</div>");
		//Mensaje.verMensaje(update);

	} catch (SQLException e) {
		out.print("\n ha saltado esta excepcion 1");
		
	} finally {
		try {
			if (resultado != null)
		resultado.close();
			if (resultado != null)
		resultado.close();
			if (resultado != null)
		resultado.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	%>
	<form action="edicionCliente.jsp" name="editar.jsp">
		<input type="submit" value="volver a editar">
</body>
</html>