<%@page import="model.Tema"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ALTA DE LIBROS</title>
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
			<H1>ALTA DE LIBRO NUEVO</H1>
			<hr />
			<jsp:include page="Usuario.jsp" />
			<BR>
			<BR>
			<BR>
			<BR>

<form action="GestionAdmon?opcion=altaLibro" method="post">
<input type="text" maxlength="20" size="20" name="isbn"
				placeholder="ISBN" required>
				<br><br>
			<input type="text" maxlength="20" size="20" name="autor"
				placeholder="Autor" required>	
				<br><br>
				<input type="text" maxlength="20" size="20" name="titulo"
				placeholder="Título" required>	
				<br><br>
				<input type="text" maxlength="20" size="20" name="precioUnitario"
				placeholder="Precio" required>	
				<br><br>
				<input type="text" maxlength="20" size="20" name="stock"
				placeholder="Stock" required>	
				<br><br>
				Pertenece al Tema : 
				<%List<Tema> listaTema=(List<Tema>)session.getAttribute("listaTema");%>
  <select name ="tema">
  <%for (Tema ele:listaTema){ %>
  
  <option value="<%= ele.getIdTema()%>"><%= ele.getDescTema().toUpperCase()%></option>
  <%} %>
  </select>	
				<br><br>
			<input type="submit" value="ALTA">	
</form>
<BR> <a href='Admon.jsp'><button type="button">
					<font color=#31372B face="Franklin Gothic ,arial"><br>VOLVER
						A MENÚ<br>
					<br>
				</button></a>
</div>
<jsp:include page="Pie.jsp" />
</body>
</html>