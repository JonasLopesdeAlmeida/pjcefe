<%@page import="dados.*"%>
<%@page import="dao.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html; charset=ISO-8859-1" language="java"
	pageEncoding="UTF-8" import="java.sql.*" errorPage=""%>
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

	<script>
		function validarForm() {
			var selecao = document.getElementById("cat_evento").value;

			if (selecao == 1) {
				document.getElementById("periodo").disabled = false;
			} else {
				document.getElementById("periodo").disabled = true;

			}
		}
	</script>
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
	<div class="container">
		<div class="card">
			<div class="card-body">
				<%
					int id_escola = Integer.parseInt(request.getParameter("id_escola"));

					if (id_escola != 0) {

						PreparedStatement ps = null;
						Connection con = null;
						ResultSet rs = null;
						{

							try {
								Class.forName("org.postgresql.Driver").newInstance();
								con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");
								ps = con.prepareStatement("select * from escola where id_escola = ?");

								ps.setInt(1, id_escola);
								rs = ps.executeQuery();
								if (rs.next()) {
				%>

				<h1 style="text-align: center;">ESCOLA</h1>

				<form method="post" action="ServerEscolaAtualizar" name="frmAdd"
					enctype="multipart/formdata">

					<div class="row">
						<div class="col-sm-12">
							<label>INSTITUIÇÃO:</label>
							<input type="hidden" name="id_escola" value="<%= rs.getInt("id_escola")%>"/>
							 <input type="text"
								name="instituicao" value="<%=rs.getString("instituicao")%>" style="text-transform: uppercase;"
								class="form-control" required="required" /> <br>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label>MODALIDADE:</label> <select value="<%=rs.getString("modalidade")%>" class="form-control"
								name="modalidade" class="form-control" required="required"  >
								<option value="ENSINO FUNDAMENTAL">ENSINO FUNDAMENTAL</option>
								<option value="ENSINO INFANTIL">ENSINO INFANTIL</option>
							</select> <br>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label>GESTOR:</label> <input type="text" name="gestor" value="<%=rs.getString("gestor")%> "
								style="text-transform: uppercase;" class="form-control"
								required="required" /> <br>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<label>ENDEREÇO:</label> <input type="text" name="endereco"
								value="<%=rs.getString("endereco")%> " style="text-transform: uppercase;" class="form-control" />
							<br>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<label for="exampleInputEmail1">FONE/CELULAR:</label> <input
								 type="text" minlength="14" maxlength="14" name="telefone"
								class="form-control"
								onkeypress="$(this).mask('(00) 00000-0000')" value="<%=rs.getString("telefone")%>" /> <br>
						</div>

						<div class="col-sm-8">
							<label>EMAIL:</label> <input type="Email" name="email" value="<%=rs.getString("email")%>"
								style="text-transform: uppercase;" class="form-control" /> <br>
						</div>
					</div>


					
					<button type="submit" class="btn btn-success btn-block"
						style="width: 83px;">Salvar</button>



				</form>


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




			</div>
		</div>
	</div>



	</main>
    <br>
	<!--==========================
    Footer
  ============================-->
	<footer id="footer" class="foter">
    <div class="footer-top">
      <div class="container">
		<p>Desenvolvimento Secretaria Municipal de Informação de Tecnologia - SEMIT</p>
      </div>
    </div>

	<div class="container">
		<div class="credits">
			<br>

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
