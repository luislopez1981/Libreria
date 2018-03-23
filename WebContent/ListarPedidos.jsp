<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.LineaPedido"%>
<%@page import="model.Pedido"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LISTAR PEDIDOS</title>
<style>
body {
	background-color: #31372B;
}
</style>
</head>
<body>
<font color="White" face="Franklin Gothic ,arial">
<%List<Pedido> listaPedido = (List<Pedido>)request.getAttribute("listaPedido");


%>
<DIV ALIGN="center">
<hr/><H1>PANEL DE PEDIDOS</H1><hr/>
<jsp:include page="Usuario.jsp" />
<h3>BUSCAR PEDIDO POR FECHA</h3>
<FORM action="GestionAdmon?opcion=listarPedidos" method="post">
<input type="date" name="fecha" required>
<input type="submit" VALUE="SELECCIONAR">
<br><br>
</FORM>

	
		
		<%
		if(listaPedido!=null && request.getAttribute("fecha2")!=null ){
			SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");	
			String date = formato.format(request.getAttribute("fecha2"));
			%><h3>PEDIDOS A DÍA: <%=date %></h3>
			<BR>
			<table border='1'>
		<tr>
			<th>Nº Pedido</th>
			<th>Cliente</th>
			<th>Dirección Entrega</th>			
		</tr>
			<%for (Pedido ele : listaPedido) {
		%>
		<tr>
			<td><%=ele.getIdPedido()%></td>
			<td><%=ele.getUsuario().getNombre()%></td>
			<td><%=ele.getDireccionEntrega()%></td>
		</tr>
		<tr>
			<th>Título</th>
			<th>Autor</th>
			<th>Precio</th>
		</tr>
			<%List<LineaPedido> listaLineas = ele.getLineaPedidos(); 
			for(LineaPedido ele2:listaLineas){
			%>	
				
			<tr>
			<td><%=ele2.getLibro().getTitulo() %></td>
			<td><%=ele2.getLibro().getAutor()%></td>
			<td><%=ele2.getPrecioVenta() %></td>
			</tr>
			
			
			<%}%>
			<tr></tr>		<tr></tr>	<tr></tr>	<tr></tr>	<tr></tr>	<tr></tr>	<tr></tr>	
			<tr></tr>	<tr></tr>	<tr></tr>	<tr></tr>	
		</tr>		
		<%
			}}
		%>
	</table>


<BR> <a href='Admon.jsp'><button type="button">
					<font color=#31372B face="Franklin Gothic ,arial"><br>VOLVER
						A MENÚ<br>
					<br>
				</button></a>
</DIV>
<jsp:include page="Pie.jsp" />
</body>
</html>