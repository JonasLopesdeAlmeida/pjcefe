<%@page import="dados.*"%>
<%@page import="dao.*"%>
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
<title>CLAM</title>
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
					<li><a href="cursista.jsp">Cursista</a></li>
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
	<div class="container">
		<div class="card">
			<div class="card-body">
				<%
					//String cpf = request.getParameter("cpf");
					int id_cursista = Integer.parseInt(request.getParameter("id_cursista"));

					if (id_cursista != 0) {

						PreparedStatement ps = null;
						Connection con = null;
						ResultSet rs = null;
						{

							try {
								Class.forName("org.postgresql.Driver").newInstance();
								con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");
								ps = con.prepareStatement("select * from cursista where id_cursista = ?");

								ps.setInt(1, id_cursista);
								rs = ps.executeQuery();
								if (rs.next()) {
				%>

				<form method="post" action="ServerCursistaAtualizar" name="frmAdd"
					enctype="multipart/formdata">

					</select>

 						<div class="row">
						<div class="col-sm-4">
							<label for="exampleInputEmail1">CPF</label><br>
							<input type="hidden" name="id_cursista" value="<%= rs.getInt("id_cursista")%>"/>
							 <input
								type="text" minlength="14" maxlength="14" name="cpf"
								class="form-control" value="<%=rs.getString("cpf")%>" 
								onkeypress="$(this).mask('000.000.000-00');"  />
							<br>
						</div>
						<div class="col-sm-8">
							<label for="exampleInputEmail1">NOME</label><br>
							
							 <input
								type="text" name="nome" class="form-control" value="<%=rs.getString("nome")%>"  />
							<br>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<label>DATA DE NASCIMENTO:</label> <input type="Date"
								name="datanasc" class="form-control"
								value="<%=rs.getString("datanasc")%>" /> <br>
						</div>


						<div class="col-sm-8">
							<label for="exampleInputEmail1">INSTITUIÇÃO</label><br> <input
								type="text" name="instituicao" class="form-control" value="<%=rs.getString("instituicao")%>" /> <br>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<label for="exampleInputEmail1">SETOR DE LOTAÇÃO</label><br>
							<input type="text" name="setor" class="form-control" value="<%=rs.getString("setor")%>"/> <br>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<label for="exampleInputEmail1"> NOME DO CARGO</label><br> <input
								type="text" name="cargo" class="form-control" id="text1" value="<%=rs.getString("cargo")%>" /> <br>
						</div>
					</div>


					<div class="row">
						<div class="col-sm-12">
							<label for="exampleInputEmail1"> NOME DA FUNÇÃO</label><br>
							<input type="text" name="funcao" class="form-control" id="text1" value="<%=rs.getString("funcao")%>" />
							<br>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2">
							<label for="exampleInputEmail1">MATRÍCULA</label><br> <input
								type="text" minlength="8" maxlength="8" name="matricula"
								class="form-control" onkeypress="$(this).mask('000000-0')"
								value="<%=rs.getString("matricula")%>"/>

						</div>
						<div class="col-sm-2">
							<label for="exampleInputEmail1">FONE/CELULAR</label><br> <input
								type="text" minlength="14" maxlength="14" name="fone"
								class="form-control"
								onkeypress="$(this).mask('(00) 00000-0000')" value="<%=rs.getString("fone")%>" /> <br>

						</div>
						<div class="col-sm-8">
							<label for="exampleInputEmail1">E-MAIL</label><br> <input
								type="Email" name="email" class="form-control" value="<%=rs.getString("email")%>" />
						</div>

					</div>


					<div class="row">
						<div class="col-sm-12">
							<label for="exampleInputEmail1"
								style="color: black; border-color: black;">EVENTO
								FORMATIVO</label><br> <select class="form-control" name="id_evento"
								class="form-control" >
                                <%
								
										try {
											Class.forName("org.postgresql.Driver").newInstance();
											con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");
											ps = con.prepareStatement("select * from evento");
											// ps.setLong(1, id);
											rs = ps.executeQuery();
											//  ps.clearParameters();
											while (rs.next()) {
								%>
								<option></option>
								<option value="<%=rs.getInt("id_evento")%>">
									<%=rs.getString("nome_evento")%></option>
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
								%>

							</select> <br>
						</div>
					</div>

					<input type="submit" value="Atualizar" id="Atualizar"
						style="width: 83px;" />
				</form>
				<%
				

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
		</div>
	</div>



	</main>

	<!--==========================
    Footer
  ============================-->
	<footer id="footer">
	<div class="footer-top">
		<div class="container"></div>
	</div>

	<div class="container">
		<div class="credits">
			<br> <br> <br>

			<!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Regna
        -->
			<!--
        Desenvolvimento <a href="https://bootstrapmade.com/">Walter Carvalho Barbosa</a><br>
        Contato<a href="https://bootstrapmade.com/">(98)98103-6150</a><br>
        Email <a href="https://bootstrapmade.com/">Waltercarvalhob@gmail.com</a>
        -->
		</div>
	</div>
	</footer>
	<!-- #footer -->

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
