<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Cliente</title>
<link rel="stylesheet" href="cliente.css">
</head>
<body>

	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.Statement"%>
	<%@ page import="java.sql.ResultSet"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@ page import="java.util.Date"%>

<table border="1">

		<tr>
			<th>   #  </th>
			<th>Nombre</th>
			<th>NIF</th>
			<th>Email</th>
			<th>Telefono</th>
			<th>Editar</th>
			<th>Borrar</th>
		</tr>
		<!--Conexion-->
		<%
		Connection conexion = null;
		Statement estado = null;
		ResultSet resultado = null;

		try {
			out.println(" Deputacion de la conexion : ");
			out.println("Estacleciendo conexion con el controlador, -->");
			String controlador = "com.mysql.cj.jdbc.Driver";
			out.println("  Conexion Estaclecida con el controlador "+ controlador);
			Class.forName(controlador);
			out.println("  Iniciando sesion - 0");

			String url = "jdbc:mysql://localhost:3307/partes_de_trabajo";
			String usuario = "root";
			String pass = "1111";

			out.println(" ,Sesion iniciada  ="+" -- "+url+" - "+"  Usuario :"+usuario+" - "+" Contraseña : "+pass);

			conexion = DriverManager.getConnection(url, usuario, pass);
			out.println("conexion"+conexion);

			estado = conexion.createStatement();
			out.println("Conexión realizada"+estado);

			String query = "Select * From clientes";

			resultado = estado.executeQuery(query);
			
			int contador = 1;
			
			
		

			while (resultado.next()) {
				out.print("<tr>");
				out.println("<td id=\"contador\">"+contador);
				out.println("<td id=\"nombre\">"  + resultado.getString("nombre") + "</td>");
				out.println("<td id=\"Nif\">"  + resultado.getString("Nif") + "</td>");
				out.println("<td id=\"email\">"  + resultado.getString("email") + "</td>");
				out.println("<td id=\"telefono\">"  + resultado.getString("telefono") + "</td>");
				out.println("<td id=\"editar\">"+"<form action=\"ModificacionCliente.jsp\" method=\"post\">" +"<input type=\"image\" src=\"editar.png\" value=\"resultado.getString\"(\"Nif\")>"+
							"<input type=\"hidden\" name=\"Nif\" value=\""+resultado.getString("Nif")+"\">"+"<input type=\"hidden\" name=\"Nombre\" value=\""+resultado.getString("Nombre")+"\">"+
									"<input type=\"hidden\" name=\"correo\" value=\""+resultado.getString("email")+"\">"+
											"<input type=\"hidden\" name=\"Telefono\" value=\""+resultado.getString("telefono")+"\">"+"</form>"+"</td>");
				out.println("<td id=\"borrar\">"+"<form action=\"eliminarCliente.jsp\" method=\"post\">" +"<input type=\"image\" value=\"Borrar\" src=\"Equis.webp\">"+"</input>"+"</form>"+"</td>");
				out.println("</tr>");
				contador ++;
			}
			
			if(resultado.getString("Nombre")=="<input type=\"image\" value=\"editar\">"){
				String Nombre=getInitParameter("Nombre");
				
				
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








<h3>Añadir Cliente</h3>

<form action="añadirCliente.jsp"> <input type="submit" value="Añadir">
	
	
	</input></form>
<h3>Volver atrás</h3>

<form action="listadoClientes.jsp"> <input type="submit" value="volver">
	
	<input type="button" value="Atras" onclick="javascript:window.history.back()">
	</input></form>
	<% Date date= new Date(); 
	out.print(date);%>
	
</body>
</html>