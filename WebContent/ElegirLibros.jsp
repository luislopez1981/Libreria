<%@page import="model.Libro"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ELEGIR LIBROS</title>
<style>
body {
	background-color: #31372B;
	font
}
</style>
</head>
<body>
<font color="White" face="Franklin Gothic ,arial">

<div align="center">
<hr/><h1>TEMAS</h1><hr/>
<jsp:include page="Usuario.jsp" />
<BR><BR><BR>
<%List<Libro> listaLibro=(List<Libro>)session.getAttribute("listaLibro");%>

<table border='1'>
<tr>
<th><h2>LIBROS DISPONIBLES</h2></th>
</tr>
</table>
<BR><BR><BR>
<%if (listaLibro!=null){
	for (Libro ele:listaLibro){ %>

<div>
<form action="ControlLibros?opcion=addLibros" method="post">
<input   type="checkbox" name="libroElegido" value="<%=ele.getIsbn()%>" required><%=ele.getTitulo() %> <br/><br/>

<%}} %>
<input  type="submit" name="boton" value="SUMAR A CARRITO"><br/><br/>
</form>
<br><br>
<a href='Temas.jsp'><button type="button"><font color=#31372B face="Franklin Gothic ,arial"><BR>VOLVER A TEMAS<BR><BR></button></a>
<a href="ControlLibros?opcion=desconn"><button type="button"><font color=#31372B face="Franklin Gothic ,arial"><BR>CERRAR SESIÓN<BR><BR></button></a>
</div>


</div>
<jsp:include page="Pie.jsp" />
</body>
</html>