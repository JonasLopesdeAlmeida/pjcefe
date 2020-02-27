<%@page import="dados.*"%>
<%@page import="dao.*"%>
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
	<div class="container">
		<div class="card">
			<div class="card-body">
				<%
					
					int id_certificado = Integer.parseInt(request.getParameter("id_certificado"));

					if (id_certificado != 0) {

						PreparedStatement ps = null;
						Connection con = null;
						ResultSet rs = null;
						{

							try {
								Class.forName("org.postgresql.Driver").newInstance();
								con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");
								ps = con.prepareStatement("select id_certificado,data_cert,cursista.id_cursista as id_cursista,cursista.nome as nome,cursista.cpf as cpf, evento.nome_evento as nome_evento,COALESCE(evento.periodo,'') as periodo,evento.horario as horario, evento.data_evento as data_evento,evento.turno as turno from certificado inner join evento on certificado.id_evento = evento.id_evento  inner join cursista on certificado.id_cursista = cursista.id_cursista where id_certificado=? order by data_cert DESC");

								ps.setInt(1, id_certificado);
								rs = ps.executeQuery();
								if (rs.next()) {
				%>

				

					<form method="post" action="ServerRel" name="frmAdd"
					enctype="multipart/formdata">
					<div class="row">
						<div class="col-sm-6">
							<label>NOME DO EVENTO:</label>
							<input type="hidden" name="id_certificado" value="<%= rs.getInt("id_certificado")%>"/>
							 <input type="text"
								name="nome_evento" id="nome_evento"
								class="form-control" readonly="true"value="<%=rs.getString("nome_evento")%>"/>
						</div>

						<div class="col-sm-3">
							<label>TURNO:</label> <input type="text" name="turno" class="form-control"
								readonly="true" value="<%=rs.getString("turno")%>"></input> <br>
						</div>

					<div class="col-sm-3">
						<label>DATA:</label> <input type="text" name="data_evento"
							readonly="true" value="<%=rs.getString("data_evento")%>" id="data_evento" class="form-control"
							 />
						<br>
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
  <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>

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
