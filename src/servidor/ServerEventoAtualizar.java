package servidor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dados.Evento;
import dao.Eventodao;
import util.Upload;

/**
 * Servlet implementation class ServerEventoAtualizar
 */
public class ServerEventoAtualizar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "c:/upload";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServerEventoAtualizar() {
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

			int id_evento = Integer.parseInt((String) upload.getForm().get("id_evento"));
			String data_evento = (String) upload.getForm().get("data_evento");
			String nome_evento = (String) upload.getForm().get("nome_evento");
			String estado = (String) upload.getForm().get("estado");
			String turno = (String) upload.getForm().get("turno");
			String cat_evento = (String) upload.getForm().get("cat_evento");
			String tipo_evento = (String) upload.getForm().get("tipo_evento");
			String carga_horaria = (String) upload.getForm().get("carga_horaria");
			String periodo = (String) upload.getForm().get("periodo");
			String horario = (String) upload.getForm().get("horario");
			String ementa = (String) upload.getForm().get("ementa");
			String setor = (String) upload.getForm().get("setor");
     		String cargo = (String) upload.getForm().get("cargo");
//			String responsavel1 = (String) upload.getForm().get("responsavel1");
//			String qtd_turmas = (String) upload.getForm().get("qtd_turmas");
//			String responsavel2 = (String) upload.getForm().get("responsavel2");
//			String responsavel3 = (String) upload.getForm().get("responsavel3");
//			String assinatura2 = (String) upload.getForm().get("assinatura2");
//			String assinatura3 = (String) upload.getForm().get("assinatura3");
			// PrintWriter out = response.getWriter();

			Evento ee = new Evento();
			Eventodao ev = new Eventodao();

			ee.setId_evento(id_evento);
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
//			ee.setResponsavel1(responsavel1);
//			ee.setQtd_turmas(qtd_turmas);
//			ee.setResponsavel2(responsavel2);
//			ee.setResponsavel3(responsavel3);
//			ee.setAssinatura2(assinatura2);
//			ee.setAssinatura3(assinatura3);

			// Lógica para dinamismo das assinaturas e corrigir erro:
			// java.lang.IndexOutOfBoundsException
			// List<String> arquivos = upload.getFiles();

//			for (int i = 0; i < upload.getFiles().size(); i++) {
//
//				if (upload.getFiles().size() == 1  ) {
//
//					String file = (String) UPLOAD_DIRECTORY + "/" + upload.getFiles().get(0);
//					ee.setFile(file);
//
//				} else if (upload.getFiles().size() <= 2) {
//
//					String file = (String) UPLOAD_DIRECTORY + "/" + upload.getFiles().get(0);
//					ee.setFile(file);
//
//					String file2 = (String) UPLOAD_DIRECTORY + "/" + upload.getFiles().get(1);
//					ee.setFile2(file2);
//
//				} else if (upload.getFiles().size() <= 3) {
//					String file = (String) UPLOAD_DIRECTORY + "/" + upload.getFiles().get(0);
//					ee.setFile(file);
//
//					String file2 = (String) UPLOAD_DIRECTORY + "/" + upload.getFiles().get(1);
//					ee.setFile2(file2);
//
//					String file3 = (String) UPLOAD_DIRECTORY + "/" + upload.getFiles().get(2);
//					ee.setFile3(file3);
//				}
//
//			}

			ev.open();
			if (ev != null) {
				ev.atualizar(ee);
				
				response.sendRedirect("sucessoeventoalterar.jsp");

			}
			//response.sendRedirect("sucessoeventoalterar.jsp?id_evento=" + id_evento);
		}

	}
}
