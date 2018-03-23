<%@page import="java.math.BigDecimal"%>
<%@page import="model.LineaPedido"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carrito</title>
<style>
body {
	background-color: #31372B;
}
</style>
</head>
<body>
<font color="White" face="Franklin Gothic ,arial">

<%List<LineaPedido>  carrito = (List<LineaPedido>)session.getAttribute("lineaPedido");
double acumuladorTotal = 0;
%>

<div align="center">
<hr/><h1>CARRITO</h1><hr/>
<jsp:include page="Usuario.jsp" />
<br><br>
	<table border='1'>
		<tr>
			<th>Libro</th>
			<th>Precio</th>
			<th>Cantidad</th>
			<th>Total</th>
			<th>Borrar</th>
		</tr>
		<%
		if(carrito!=null){
			for (LineaPedido ele : carrito) {
		%>
		<% BigDecimal producto = ele.getPrecioVenta().multiply(ele.getCantidad()); %>
		<tr>
			<td><%=ele.getLibro().getTitulo()%></td>
			<td><%=ele.getPrecioVenta()%></td>
			<td><%=ele.getCantidad()%></td>
			<td><%=producto%></td>
			<td><a href='ControlLibros?opcion=borrar&isbn=<%=carrito.indexOf(ele)%>'><button type="button"><font color=#009999 face="Franklin Gothic ,arial">X</button></a></td>
			
		</tr>
		<%//acumuladorTotal += producto.doubleValue(); %>
		<%
			}}
		%>
	</table>
	<br>
	<a href='ControlLibros?opcion=comprar'><button type="button"><br><font color=#31372B face="Franklin Gothic ,arial">CONFIRMAR COMPRA<br><br></button></a>
	
	<a href='ControlLibros?opcion=vaciar'><button type="button"><br><font color=#31372B face="Franklin Gothic ,arial">VACIAR CARRITO<br><br></button></a>
	
	
	<br><br>
<a href='ElegirLibros.jsp'><button type="button"> <font color=#31372B face="Franklin Gothic ,arial"><br>VOLVER A LIBROS<br><br></button></a>
</body>
<jsp:include page="Pie.jsp" />
</html>