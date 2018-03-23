<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ESTADÍSTICA CLIENTE</title>
<style>
body {
	background-color: #31372B;
}
</style>
</head>
<body>
	<font color="White" face="Franklin Gothic ,arial">
		<div align="center">
			<hr />
			<H1>ESTADÍSTICA CLIENTE</H1>
			<hr />
			<jsp:include page="Usuario.jsp" />

			<h3>BUSCAR CLIENTE</h3>
			<form action="GestionAdmon?opcion=cliente" method="post">
				<input type="text" maxlength="20" size="20" name="usuario2"
					placeholder="Usuario" required> <input type="submit" value="BUSCAR">
			</form>


			<%
				if (request.getSession().getAttribute("estadistica") != null) {
			%>
			<%Usuario usuario = (Usuario)request.getSession().getAttribute("usuario3");%>
			<H4>ESTADÍSTICAS DE:</H4><H3><%=usuario.getNombre().toUpperCase() %> <%=usuario.getApellido().toUpperCase() %></H3>
			<table border='1'>
				<tr>
					<th>TOTAL ARTÍCULOS</th>
					<th>TEMAS DISTINTOS</th>
					<th>TOTAL IMPORTE</th>
				</tr>
				<tr>
					<%
						Object[] array = (Object[]) request.getSession().getAttribute("estadistica");
							for (Object ele : array) {
					%>

					<th><%=ele%></th>
					<%
						}
					%>
				</tr>

				<%
					request.getSession().removeAttribute("estadistica");
					} else {
					}
				%>



			</table>



			<BR> <a href='Admon.jsp'><button type="button">
					<font color=#31372B face="Franklin Gothic ,arial"><br>VOLVER
						A MENÚ<br> <br>
				</button></a>

		</div>
		<jsp:include page="Pie.jsp" />
</body>
</html>