<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="mitema" class="model.Tema" scope="request" />
<jsp:setProperty property="*" name="mitema" />
<%
	if (request.getParameter("descTema") != null) {
%>
<jsp:forward page="GestionAdmon?opcion=altaTemaBean" />

<%
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ALTA DE TEMAS</title>
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
			<H1>ALTA DE TEMA NUEVO</H1>
			<hr />
			<jsp:include page="Usuario.jsp" />
			<BR>
			<BR>
			<BR>
			<BR>
			<BR>
			<form action="AltaTemas.jsp" method="post">
				<input type="text" maxlength="20" size="20" name="descTema"
					placeholder="Descripción"> <br>
				<br> <input type="password" maxlength="20" size="20"
					name="abreviatura" placeholder="Abreviatura"> <br>
				<br> <input type="submit" value="ALTA">

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