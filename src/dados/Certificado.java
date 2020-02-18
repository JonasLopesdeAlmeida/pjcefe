package dados;

import java.io.Serializable;

public class Certificado implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id_certificado, id_evento, id_cursista;
	private String data_cert;
	public Certificado() {
		
	}

	
	public Certificado(int id_certificado, int id_evento, int id_cursista, String data_cert) {
		super();
		this.id_certificado = id_certificado;
		this.id_evento = id_evento;
		this.id_cursista = id_cursista;
		this.data_cert = data_cert;
		
	
	}


	public int getId_certificado() {
		return id_certificado;
	}



	public void setId_certificado(int id_certificado) {
		this.id_certificado = id_certificado;
	}




	public int getId_evento() {
		return id_evento;
	}


	public void setId_evento(int id_evento) {
		this.id_evento = id_evento;
	}


	public int getId_cursista() {
		return id_cursista;
	}


	public void setId_cursista(int id_cursista) {
		this.id_cursista = id_cursista;
	}


	public String getData_cert() {
		return data_cert;
	}


	public void setData_cert(String data_cert) {
		this.data_cert = data_cert;
	}


    
	
	


	
	
	
	

}
