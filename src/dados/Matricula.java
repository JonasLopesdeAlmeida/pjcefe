package dados;

import java.io.Serializable;

public class Matricula implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id_mat, id_evento, id_cursista;
	private String data_mat;
	
	
	public Matricula() {
		
		
	}


	public Matricula(int id_mat, int id_evento, int id_cursista, String data_mat) {
		super();
		this.id_mat = id_mat;
		this.id_evento = id_evento;
		this.id_cursista = id_cursista;
		this.data_mat = data_mat;
	}


	public int getId_mat() {
		return id_mat;
	}


	public void setId_mat(int id_mat) {
		this.id_mat = id_mat;
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


	public String getData_mat() {
		return data_mat;
	}


	public void setData_mat(String data_mat) {
		this.data_mat = data_mat;
	}
	
	
	
	
	
	
	
	
	
}
