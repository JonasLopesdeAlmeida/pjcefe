<%@page import="dados.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
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
			<li><a href="#inscricaoonline">Inscrições On-line</a></li>
			<li><a href="#solicitacoescursos">Solicitação de Cursos</a></li>
			<li><a href="#team">Espaço Fisico</a></li>
			<li><a href="#contact">Contato</a></li>
			<li class="menu-has-children"><a href="">Cadastro</a>
				<ul>
					<li><a href="evento.jsp">Evento</a></li>
					<li><a href="escola.jsp">Escola</a></li>
				</ul></li>
		</ul>
		</nav>
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





	<h1 style="text-align: center;">CURSISTA CADASTRADO</h1>

	<div class="container-fluid">

		<br>
		<div class="panel panel-primary">
			<div class="panel-body">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th>CPF</th>
							<th>NOME</th>
							<th>DATA DE NASCIMENTO</th>
							<th style="text-align: center;">INSTITUIÇÃO</th>
							<th style="text-align: center;">SETOR DE LOTAÇÃO</th>
							<th style="text-align: center;">NOME DO CARGO</th>
							<th style="text-align: center;">NOME DA FUNÇÃO</th>
							<th style="text-align: center;">MATRÍCULA</th>
							<th style="text-align: center;">FONE/CELULAR</th>
							<th style="text-align: center;">EMAIL</th>
							<th style="text-align: center;">EDITAR</th>





						</tr>
					</thead>

					<%
						String cpf = request.getParameter("cpf");
						//int id_curso = Integer.parseInt(request.getParameter("id_curso"));

						if (cpf != null) {

							PreparedStatement ps = null;
							Connection con = null;
							ResultSet rs = null;

							{

								try {
									Class.forName("org.postgresql.Driver").newInstance();
									con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");
									//con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres",
									//"*abomax9637");
									ps = con.prepareStatement("select * from cursista where cpf=?");
									ps.setString(1, cpf);
									rs = ps.executeQuery();

									if (rs.next()) {
					%>
                  
					<tbody>

						<tr>
							<td><%=rs.getString("cpf")%></td>
							<td><%=rs.getString("nome")%></td>
							<td ><%=rs.getString("datanasc" )%> </td>
							<td align="center"><%=rs.getString("instituicao")%></td>
							<td align="center"><%=rs.getString("setor")%></td>
							<td align="center"><%=rs.getString("cargo")%></td>
							<td align="center"><%=rs.getString("funcao")%></td>
							<td align="center"><%=rs.getString("matricula")%></td>
							<td align="justify"><%=rs.getString("fone")%></td>
							<td align="center"><%=rs.getString("email")%></td>
							<td align="center"><a
								href="alterarcursista.jsp?id_cursista=<%=rs.getInt("id_cursista")%>"><img
									alt="" width="30" src="img/editar.png"></a></td>

							<%
								} else

											{

												response.sendRedirect("erroPageCursista.jsp");
											}
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
								}
							%>


						</tr>
					</tbody>
				</table>


				</ul>
				</nav>




			</div>
		</div>

		<h1 style="text-align: center;">CURSOS FEITOS</h1>

		<div class="container-fluid">

			<br>
			<div class="panel panel-primary">
				<div class="panel-body">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th>CURSISTA</th>
								<th>CPF</th>
								<th>EVENTO</th>
								<th>HORARIO</th>
								<th style="text-align: center;">PERIODO</th>
								<th style="text-align: center;">TURNO</th>
								<th style="text-align: center;">CERTIFICADO</th>






							</tr>
						</thead>

						<%
							//int id_cursista = Integer.parseInt(request.getParameter ("id_cursista")); 
							String cpf1 = request.getParameter("cpf");

							if (cpf1 != null) {

								PreparedStatement ps = null;
								Connection con = null;
								ResultSet rs = null;

								{

									try {
										Class.forName("org.postgresql.Driver").newInstance();
										con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");
										//con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres",
										//"*abomax9637");
										ps = con.prepareStatement(
												"select cursista.id_cursista as id_cursista,cursista.nome as nome,cursista.cpf as cpf,evento.nome_evento as nome_evento,evento.periodo as periodo,evento.horario as horario,evento.data_evento as dias,evento.turno as turno from matricula inner join evento on matricula.id_evento = evento.id_evento inner join cursista on matricula.id_cursista = cursista.id_cursista where cpf = ? order by data_mat desc");
										// select data_matricula,aluno.id_aluno,aluno.nome as nome,aluno.cpf as cpf,curso.descricao as curso,curso.periodo as periodo,curso.horario as horario,curso.diassemana as dias,curso.turno as turno from matricula inner join curso on matricula.id_curso = curso.id_curso inner join aluno on matricula.id_aluno = aluno.id_aluno
										// ps = con.prepareStatement("select * from cursista where id_cursista = ? ");
										ps.setString(1, cpf1);
										rs = ps.executeQuery();

										while (rs.next()) {
						%>

						<tbody>

							<tr>

								<td><%=rs.getString("nome")%></td>
								<td><%=rs.getString("cpf")%></td>
								<td><%=rs.getString("nome_evento")%></td>
								<td><%=rs.getString("horario")%></td>
								<td align="center"><%=rs.getString("periodo")%></td>
								<td align="center"><%=rs.getString("turno")%></td>
								<td align="center"><a
								href="#"><img
									alt="" width="30" src="img/cert.png"></a></td>


								<%
									}

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
									}
								%>



							</tr>
						</tbody>
					</table>


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
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>