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
<title>Listado de clientes</title>
<link rel = "stylesheet" href ="CSS/listadoClientes.css">
</head>
<body>

	<!-- Consulta sobre el listado de clientes -->

	<h1>Listado de Clientes</h1>

	<table class="centrar" >

		<tr>
			<th>   #   </th>
			<th>Nombre</th>
			<th>Columna 3</th>
			<th>Columna 4</th>
		</tr>
		<!--Conexion-->
		<%
		Connection conexion = null;
		Statement estado = null;
		ResultSet resultado = null;

		try {

			out.println("Entro");
			String controlador = "com.mysql.cj.jdbc.Driver";
			out.println("aqui si");
			Class.forName(controlador);
			out.println("Antes de conexion- 0");

			String url = "jdbc:mysql://localhost:3307/partes_de_trabajo";
			String usuario = "root";
			String pass = "1111";

			out.println("Antes de conexion");

			conexion = DriverManager.getConnection(url, usuario, pass);
			out.println("conexion");

			estado = conexion.createStatement();
			out.println("Conexión realizada");

			String query = "Select * From clientes";

			resultado = estado.executeQuery(query);
			
			int contador = 1;

			while (resultado.next()) {
				out.print("<tr>");
				out.print("<td>"+contador);
				out.print("<td>"  + resultado.getString("Nombre") + "</td>");
				out.print("</tr>");
				contador ++;
			}
			
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
	</table>
	<br>
	<form class="boton" action="edicionCliente.jsp"> <input  type="submit" value="Editar datos Cliente">
	
	
	</input>
	</form>
	 

</body>
</html>