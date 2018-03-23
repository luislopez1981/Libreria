<%@page import="model.Tema"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TEMAS</title>
<style>
body {
	background-color: #31372B;
		
}
</style>
</head>
<body>
<font color="White" face="Franklin Gothic ,arial">
<div align="center">
<hr/><h1>TEMAS</h1><hr/>
<jsp:include page="Usuario.jsp" />
<BR><BR>
<%List<Tema> listaTema=(List<Tema>)session.getAttribute("listaTema");%>

<table border='1'>
<tr>
<th><h2>TEMAS DISPONIBLES</h2></th>
</tr>
</table>
<BR><BR>
<%for (Tema ele:listaTema){ %>

 
<form action="ControlLibros?opcion=eligeLibros" method="post">


 <input type="Radio" name="tema" value=<%=ele.getIdTema()%> checked><%= ele.getDescTema().toUpperCase()%> <br/>




<%} %>
<br>
<input type="submit" name="boton" value="ELEGIR">
</form>
<br><a href="MenuCliente.jsp"><button type="button"><BR><DIV><font color=#31372B face="Franklin Gothic ,arial">VOLVER A MENÚ</div><BR></button></a>
</div>
<jsp:include page="Pie.jsp" />
</body>
</html>