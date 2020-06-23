package servidor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dados.Cursista;
import dao.Cursistadao;
import util.ValidaCPF;

/**
 * Servlet implementation class ServerCursista
 */
public class ServerCursista extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServerCursista() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			doService(response, request);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			doService(response, request);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doService(HttpServletResponse response, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		String nome = request.getParameter("nome");
		nome = nome.toUpperCase();
		String cpf = request.getParameter("cpf");
		nome = nome.toUpperCase();
		String matricula = request.getParameter("matricula");
		nome = nome.toUpperCase();
		String instituicao = request.getParameter("instituicao");
		String email = request.getParameter("email");
		String fone = request.getParameter("fone");
		String funcao = request.getParameter("funcao");
		String cargo = request.getParameter("cargo");
		String setor = request.getParameter("setor");
		String datanasc = request.getParameter("datanasc");

		Cursista a = new Cursista();
		Cursistadao ad = new Cursistadao();

		a.setNome(nome);
		a.setCpf(cpf);
		a.setMatricula(matricula);
		a.setInstituicao(instituicao);
		a.setEmail(email);
		a.setFone(fone);
		a.setFuncao(funcao);
		a.setCargo(cargo);
		a.setSetor(setor);
		a.setDatanasc(datanasc);

		ad.open();
		if (ValidaCPF.isCPF(cpf) == true) {

			if(ad != null) {
				ad.gravar(a);
				
				response.sendRedirect("sucessocursista.jsp");
				//response.sendRedirect("sucessocursista.jsp?nome=" + nome + "&cpf=" + cpf);
	
			}
			    
			} 
		     else {

			response.sendRedirect("CpfNaoValido.jsp");

		}
         
	}

}
