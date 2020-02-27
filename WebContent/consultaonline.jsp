<%@page import="dados.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>CEFE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">

<!-- =======================================================
    Theme Name: Regna
    Theme URL: https://bootstrapmade.com/regna-bootstrap-onepage-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>
	<!--==========================
  Header
  ============================-->
	<header id="header">
	<div class="container">

		<div id="logo" class="pull-left">
			<a href="#hero"><img src="img/logo.png" alt="" title="" /></img></a>
			<!-- Uncomment below if you prefer to use a text logo -->
			<!--<h1><a href="#hero">Regna</a></h1>-->
		</div>

		<nav id="nav-menu-container">
		<ul class="nav-menu">
			<li class="menu-active"><a href="index.jsp">Home</a></li>
			<li><a href="consultaonline.jsp">Inscrições On-line</a></li>
			<li><a href="#solicitacoescursos">Solicitação de Cursos</a></li>
			<li><a href="acessoCursista.jsp">Espaço Cursista</a></li>
			<li><a href="#team">Espaço Fisico</a></li>
			<li><a href="#">Contato</a></li>
			
		<!-- #nav-menu-container -->
	</div>
	</header>
	<!-- #header -->

	<!--==========================
    Hero Section
  ============================-->
	<section id="hero_1"> </section>
	<!-- #hero -->

	<main id="main"> <br>
	<br>





	<h1 style="text-align: center;">EVENTOS DISPONÍVEIS</h1>

	<div class="container-fluid">

		<br>
		<div class="panel panel-primary">
			<div class="panel-body">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th>Nome</th>
							<th>Turno</th>
							<th style="text-align: center;">Data</th>
							<th style="text-align: center;">Tipo</th>
							<th style="text-align: center;">Carga Horária</th>
							<th style="text-align: center;">Periodo</th>
							<th style="text-align: center;">Horário</th>
							<th style="text-align: center;">Inscricão</th>




						</tr>
					</thead>

					<%
						//String descricao = request.getParameter("descricao");

						//if(descricao != null)
						//{

						int limite = 5;
						String numPagina = request.getParameter("numpagina");
						if (numPagina == null)
							numPagina = "1";
						int offset = (Integer.parseInt(numPagina) * limite) - limite;

						//out.println("limite = " + limite);
						//out.println("numPagina = " + numPagina);
						//out.println("limite = " + offset + "<br><br>");

						PreparedStatement ps = null;
						Connection con = null;
						ResultSet rs = null;

						{

							try {
								Class.forName("org.postgresql.Driver").newInstance();
								con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");
								//con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres","*abomax9637");
								ps = con.prepareStatement("select id_evento, COALESCE(evento.nome_evento,'') as nome_evento, COALESCE(evento.turno,'') as turno, COALESCE(evento.data_evento,'') as data_evento, COALESCE(evento.tipo_evento,'') as tipo_evento, COALESCE(evento.carga_horaria,'') as carga_horaria, COALESCE(evento.periodo,'') as periodo, COALESCE(evento.horario,'') as horario from evento limit 5 offset " + offset);
								//  ps.setString(1,'%'+descricao+'%');
								rs = ps.executeQuery();

								while (rs.next()) {
					%>

					<tbody>

						<tr>
							<td><%=rs.getString("nome_evento")%></td>
							<td><%=rs.getString("turno")%></td>
							<td align="center"><%=rs.getString("data_evento")%></td>
							<td align="center"><%=rs.getString("tipo_evento")%></td>
							<td align="center"><%=rs.getString("carga_horaria")%></td>
							<td align="center"><%=rs.getString("periodo")%></td>
							<td align="center"><%=rs.getString("horario")%></td>
							<td align="center"><a
								href="acesso.jsp?id_evento=<%=rs.getInt("id_evento")%>"><img
									alt="" width="30" src="img/insc.png"></a></td>

							<%
								}

										//out.println("<a href= consultaonline.jsp?numpagina=1>1</a>");
										// out.println("<a href= consultaonline.jsp?numpagina=2>2</a>");

									} catch (ClassNotFoundException erroClass) /*erro caso ele não localize a classe o driver*/
									{
										out.println("Classe Driver JDBC não foi localizado, erro " + erroClass);
									}

									catch (SQLException erroSQL) /* erro no banco de dados */
									{
										out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
									} finally {
										if (rs != null)
											rs.close();
										if (ps != null)
											ps.close();
										if (con != null)
											con.close();
									}
								}
							%>


						</tr>
					</tbody>
				</table>
				<%
					Class.forName("org.postgresql.Driver").newInstance();
					con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");

					//con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres",
					//"*abomax9637");
					ps = con.prepareStatement("select count(*) AS contaRegistros from evento");
					rs = ps.executeQuery();
					rs.next();

					int totalRegistros = Integer.parseInt(rs.getString("contaRegistros"));
					int totalPaginas = totalRegistros / limite;
					if (totalRegistros % limite != 0)
						totalPaginas++;
					//out.println("Quantidade de registros: " + totalRegistros);
					//out.println("Quantidade de paginas: " + totalPaginas);
				%>
				<nav aria-label="Navegação de página exemplo">
				<ul class="pagination justify-content-center">





					<%
						int pagAnterior;
						if (Integer.parseInt(numPagina) > 1) {

							pagAnterior = Integer.parseInt(numPagina) - 1;

							out.println("<li class= page-item disabled> <a class=page-link  href= consultaonline.jsp?numpagina="
									+ pagAnterior + "> Anterior</a></li>");
						}
					%>

					<%
						for (int i = 1; i <= totalPaginas; i++) {

							out.println("<li class= page-item ><a class=page-link  href= consultaonline.jsp?numpagina=" + i + ">"
									+ i + "</a></li>");

						}
					%>

					<%
						int pagProxima;
						if ((totalRegistros - (Integer.parseInt(numPagina) * limite)) > 0) {

							pagProxima = Integer.parseInt(numPagina) + 1;

							out.println("<li class= page-item > <a class=page-link  href= consultaonline.jsp?numpagina="
									+ pagProxima + "> Próximo </a></li>");
						}
					%>

				</ul>
				</nav>




			</div>
		</div>
	</main>
	<br>



	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/superfish/hoverIntent.js"></script>
	<script src="lib/superfish/superfish.min.js"></script>

	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>
