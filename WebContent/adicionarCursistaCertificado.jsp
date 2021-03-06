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
			<li><a href="acessoEscola.jsp">Consultar Escola</a></li>
			<li><a href="acessoEvento.jsp">Consultar Evento</a></li>
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


	</main>
	<br>
	<br>
	<br>
	<div class="container">

		<form id="frm" name="frm" action="ServerCertificado" method="post">

			<input type="hidden" name="id_mat" style="text-transform: uppercase;"
				value="" class="form-control" />
			<div class="row">

				<div class="col-sm-6">
					<%
						Date dataAtual = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy - HH:mm:ss");
						String dataStr = sdf.format(dataAtual);
					%>

					<label for="comment"
						style="text-transform: uppercase; color: gray;">DATA:</label> <input
						type="text" name="data_cert" value="<%=dataStr%>"
						style="text-transform: uppercase;" readonly="true"
						class="form-control" />
				</div>

				<%
					//int id_aluno = Integer.parseInt(request.getParameter("id_aluno"));
				int id_mat1 = Integer.parseInt(request.getParameter("id_mat"));
			    

				if (id_mat1 != 0 ) {

						PreparedStatement ps = null;
						Connection con = null;
						ResultSet rs = null;
						{

							try {

								Class.forName("org.postgresql.Driver").newInstance();
								con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres",
										"252107");
								// ps = con.prepareStatement(
										//"select data_mat,cursista.id_cursista as id_cursista,cursista.nome as nome,cursista.cpf as cpf,evento.nome_evento as evento,evento.periodo as periodo,evento.horario as horario,evento.data_evento as data_evento,evento.turno as turno from matricula inner join evento on matricula.id_evento= evento.id_evento inner join cursista on matricula.id_cursista = cursista.id_cursista where cpf = ? ");
								//	     select data_matricula,aluno.id_aluno,aluno.nome as nome,aluno.cpf as cpf,curso.descricao as curso,curso.periodo as periodo,curso.horario as horario,curso.diassemana as dias,curso.turno as turno from matricula inner join curso on matricula.id_curso = curso.id_curso inner join aluno on matricula.id_aluno = aluno.id_aluno

							  ps = con.prepareStatement("select id_mat, cursista.id_cursista as id_cursista,cursista.nome as nome,cursista.cpf as cpf,cursista.fone as fone,cursista.email as email,evento.nome_evento as nome_evento,evento.periodo as periodo,evento.horario as horario,evento.data_evento as data_evento,evento.turno as turno from matricula inner join evento on matricula.id_evento = evento.id_evento inner join cursista on matricula.id_cursista = cursista.id_cursista where id_mat = ?"); 

								ps.setInt(1, id_mat1);
								rs = ps.executeQuery();

								if (rs.next()) {
				%>
				<div class="col-sm-6">

					<label for="comment"
						style="text-transform: uppercase; color: gray;">CPF:</label> <input
						type="hidden" name="id_cursista"
						value="<%=rs.getInt("id_cursista")%>"
						style="text-transform: uppercase;" class="form-control" /> <input
						type="text" name="cpf" value="<%=rs.getString("cpf")%>"
						style="text-transform: uppercase;" readonly="true"
						class="form-control" /> <br>
				</div>
				<div class="col-sm-12">
					<label for="comment"
						style="text-transform: uppercase; color: gray;">CURSISTA:</label>
					<input type="text" name="nome" value="<%=rs.getString("nome")%>"
						style="text-transform: uppercase;" readonly="true"
						class="form-control" /> <br>
				</div>

				<%
					} else

								{
									response.sendRedirect("erroPage.jsp");
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


			</div>
			<div class="row">

				<%
				int id_mat2 = Integer.parseInt(request.getParameter("id_mat"));
			    

				if (id_mat2 != 0 ) {
						PreparedStatement ps1 = null;
						Connection con1 = null;
						ResultSet rs1 = null;

						{

							try {
								Class.forName("org.postgresql.Driver").newInstance();
								con1 = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres",
										"252107");
								ps1 = con1.prepareStatement("select id_mat, cursista.id_cursista as id_cursista,cursista.nome as nome,cursista.cpf as cpf,cursista.fone as fone,cursista.email as email,evento.nome_evento as nome_evento,evento.periodo as periodo,evento.horario as horario,evento.data_evento as data_evento,evento.turno as turno, evento.id_evento as id_evento from matricula inner join evento on matricula.id_evento = evento.id_evento inner join cursista on matricula.id_cursista = cursista.id_cursista where id_mat = ?");
								ps1.setInt(1, id_mat2);
								rs1 = ps1.executeQuery();

								if (rs1.next()) {
				%>
				<div class="col-sm-12">
					<label>EVENTO:</label> <input type="hidden" name="id_evento"
						style="text-transform: uppercase;"
						value="<%=rs1.getInt("id_evento")%>" class="form-control" /> <input
						type="text" name="id_evento" style="text-transform: uppercase;"
						readonly="true" value="<%=rs1.getString("nome_evento")%>"
						class="form-control" />
				</div>



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
								if (rs1 != null)
									rs1.close();
								if (ps1 != null)
									ps1.close();
								if (con1 != null)
									con1.close();
							}
						}
					}
				%>

			</div>
			<br><button type="submit" class="btn btn-success btn-block"
						style="width: 105px;">Confirmar</button>


		</form>




	</div>
	<br>
	<br>
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
