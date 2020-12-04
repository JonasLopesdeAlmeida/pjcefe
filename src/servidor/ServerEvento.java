package servidor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dados.Evento;
import dao.Eventodao;
import util.Upload;

/**
 * Servlet implementation class ServerEvento
 */


public class ServerEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "c:/upload";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServerEvento() {
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

		Upload upload = new Upload();

		upload.setFolderUpload(UPLOAD_DIRECTORY);

		if (upload.formProcess(getServletContext(), request)) {

			String data_evento = upload.getForm().get("data_evento");
			String nome_evento =  upload.getForm().get("nome_evento");
			String estado =  upload.getForm().get("estado");
			String turno = upload.getForm().get("turno");
			String cat_evento = upload.getForm().get("cat_evento");
			String tipo_evento = upload.getForm().get("tipo_evento");
			String carga_horaria = upload.getForm().get("carga_horaria");
			String periodo = upload.getForm().get("periodo");
			String horario = upload.getForm().get("horario");
			String ementa =  upload.getForm().get("ementa");
			String setor =  upload.getForm().get("setor");
			String cargo =  upload.getForm().get("cargo");
			String responsavel1 = upload.getForm().get("responsavel1");
			String qtd_turmas =  upload.getForm().get("qtd_turmas");
			String responsavel2 = upload.getForm().get("responsavel2");
			String responsavel3 =  upload.getForm().get("responsavel3");
			String assinatura2 = upload.getForm().get("assinatura2");
			String assinatura3 =  upload.getForm().get("assinatura3");
			String file = UPLOAD_DIRECTORY + "/" + upload.getFiles().get(0);
			String file2 = UPLOAD_DIRECTORY + "/" + upload.getFiles().get(1);
			String file3 = UPLOAD_DIRECTORY + "/" + upload.getFiles().get(2);
			//PrintWriter out = response.getWriter();
			
			
			List<String> files = Arrays.asList(file, file2, file3);
			Iterator<String> it = files.iterator();
			
			Evento ee = new Evento();
			Eventodao ev = new Eventodao();

			ee.setData_evento(data_evento);
			ee.setNome_evento(nome_evento);
			ee.setEstado(estado);
			ee.setTurno(turno);
			ee.setCat_evento(cat_evento);
			ee.setTipo_evento(tipo_evento);
			ee.setCarga_horaria(carga_horaria);
			ee.setPeriodo(periodo);
			ee.setHorario(horario);
			ee.setEmenta(ementa);
			ee.setSetor(setor);
			ee.setCargo(cargo);
			ee.setResponsavel1(responsavel1);
			ee.setQtd_turmas(qtd_turmas);
			ee.setResponsavel2(responsavel2);
			ee.setResponsavel3(responsavel3);
			ee.setAssinatura2(assinatura2);
			ee.setAssinatura3(assinatura3);
			
			//Iterando na lista de files enquanto tiver arquivo.
			while(it.hasNext()) 
			{
			ee.setFile(it.next());
			ee.setFile2(it.next());
			ee.setFile3(it.next());			
		    }
   
			
			ev.open();
			if (ev != null) {
				ev.gravar(ee);

			}
            
			 response.sendRedirect("sucessoevento.jsp");
			//response.sendRedirect("sucessoevento.jsp?nome_evento=" + nome_evento);
		    

		} else {
			System.out.print("erro");
		}

	}

}
