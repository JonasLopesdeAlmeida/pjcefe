package servidor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dados.Escola;
import dao.Escoladao;

/**
 * Servlet implementation class ServerEscola
 */
public class ServerEscola extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerEscola() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
   	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   	 */
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		// TODO Auto-generated method stub
   		response.getWriter().append("Served at: ").append(request.getContextPath());
   		try {
   			doService(response,request);
   		
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
   	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   	 */
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		// TODO Auto-generated method stub
   	
   		try {
   			doService(response,request);
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
   	
   	private void doService(HttpServletResponse response, HttpServletRequest request)throws Exception {
   		// TODO Auto-generated method stub
   		response.setContentType("text/html");
   		
   	//	int id_curso = Integer.parseInt(request.getParameter("id_evento"));
   		String instituicao = request.getParameter("instituicao");
   		String modalidade = request.getParameter("modalidade");
   		String gestor = request.getParameter("gestor");
   		String endereco= request.getParameter("endereco");
   		String telefone = request.getParameter("telefone");
   		String email = request.getParameter("email");
   
//   		String email = request.getParameter("email");
//   		String naturalidade = request.getParameter("naturalidade");
//   		String uf = request.getParameter("uf");
//   		String[] documentos = request.getParameterValues("documentos");
//   		String[] situacao = request.getParameterValues("situacao");
   		
   		Escola es  = new Escola();
   		Escoladao ed = new Escoladao();
//   		a.setId_curso(id_curso);
   		es.setInstituicao(instituicao);
   		es.setModalidade(modalidade);
   		es.setGestor(gestor);
   		es.setEndereco(endereco);
   		es.setTelefone(telefone);
   		es.setEmail(email);
   
//   		a.setEmail(email);
//   		a.setNaturalidade(naturalidade);
//   		a.setUf(uf);
   		
//   		if(documentos != null){
//   			String doc = Arrays.toString(documentos).replaceAll("\\[","").replaceAll("\\]","");
//   			a.setDocumentos(doc);
//   			}
//   		
//   		
//   		if(situacao != null){
//   			String sit = Arrays.toString(situacao).replaceAll("\\[","").replaceAll("\\]","");
//   			a.setSituacao(sit);
//   			}
   		
   		
   		
   		
   		
   		ed.open();
   		if(ed != null)
   		{
   			ed.gravar(es);
   			
   		
   		}
   		

   	response.sendRedirect("sucessoescola.jsp?instituicao=" + instituicao);
   	}
}
