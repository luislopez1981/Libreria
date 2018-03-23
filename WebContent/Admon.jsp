<%@page import="model.Tema"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PANEL DE ADMINISTRADOR</title>
<style>
body {
	background-color: #31372B;
}
</style>
</head>
<body>
<font color="White" face="Franklin Gothic ,arial">

<div align="center">

<hr/><H1>PANEL DE ADMINISTRADOR</H1><hr/>
<jsp:include page="Usuario.jsp" />

<br><a href="AltaTemas.jsp"><button type="button"><BR><DIV><font color=#31372B face="Franklin Gothic ,arial">ALTA DE TEMAS</div><BR></button></a>
 <a href="AltaLibros.jsp"><button type="button"><BR><DIV><font color=#31372B face="Franklin Gothic ,arial">ALTA DE LIBROS</div><BR></button></a>
 <a href="ListarPedidos.jsp"><button type="button"><BR><DIV><font color=#31372B face="Franklin Gothic ,arial">LISTAR PEDIDOS</div><BR></button></a>
 <a href="EstadisticaCliente.jsp"><button type="button"><BR><DIV><font color=#31372B face="Franklin Gothic ,arial">ESTADÍSTICA CLIENTE</div><BR></button></a>
<BR><BR><a href="GestionAdmon?opcion=desconn"><button type="button"><BR><DIV><font color=#31372B face="Franklin Gothic ,arial">CERRAR SESIÓN</div><BR></button></a>
</div>
<jsp:include page="Pie.jsp" />
</body>
</html>