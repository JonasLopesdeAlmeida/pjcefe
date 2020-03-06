package dados;

import java.io.Serializable;

public class Evento implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id_evento;
	private String data_evento, nome_evento, turno, cat_evento, tipo_evento, carga_horaria, periodo, horario, ementa,
			setor, cargo, responsavel1,qtd_turmas, file;
	// private byte[] img1,img2,img3;


	public Evento() {

	}

	public Evento(int id_evento, String data_evento, String nome_evento, String turno, String cat_evento,
			String tipo_evento, String carga_horaria, String periodo, String horario, String ementa, String setor,
			String cargo, String responsavel1,  String qtd_turmas, String file) {

		super();
		this.id_evento = id_evento;
		this.data_evento = data_evento;
		this.nome_evento = nome_evento;
		this.turno = turno;
		this.cat_evento = cat_evento;
		this.tipo_evento = tipo_evento;
		this.carga_horaria = carga_horaria;
		this.periodo = periodo;
		this.horario = horario;
		this.ementa = ementa;
		this.setor = setor;
		this.cargo = cargo;
		this.responsavel1 = responsavel1;
//		this.responsavel2 = responsavel2;
//		this.responsavel3 = responsavel3;
		this.qtd_turmas = qtd_turmas;
		this.file = file;
//		this.img1 = img1;
//		this.img2 = img2;
//		this.img3 = img3;
		
	}

	public int getId_evento() {
		return id_evento;
	}

	public void setId_evento(int id_evento) {
		this.id_evento = id_evento;
	}

	public String getData_evento() {
		return data_evento;
	}

	public void setData_evento(String data_evento) {
		this.data_evento = data_evento;
	}

	public String getNome_evento() {
		return nome_evento;
	}

	public void setNome_evento(String nome_evento) {
		this.nome_evento = nome_evento;
	}

	public String getTurno() {
		return turno;
	}

	public void setTurno(String turno) {
		this.turno = turno;
	}

	public String getTipo_evento() {
		return tipo_evento;
	}

	public void setTipo_evento(String tipo_evento) {
		this.tipo_evento = tipo_evento;
	}

	public String getCarga_horaria() {
		return carga_horaria;
	}

	public void setCarga_horaria(String carga_horaria) {
		this.carga_horaria = carga_horaria;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public String getEmenta() {
		return ementa;
	}

	public void setEmenta(String ementa) {
		this.ementa = ementa;
	}

	public String getSetor() {
		return setor;
	}

	public void setSetor(String setor) {
		this.setor = setor;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getCat_evento() {
		return cat_evento;
	}

	public void setCat_evento(String cat_evento) {
		this.cat_evento = cat_evento;
	}

	public String getQtd_turmas() {
		return qtd_turmas;
	}

	public void setQtd_turmas(String qtd_turmas) {
		this.qtd_turmas = qtd_turmas;
	}

	public String getResponsavel1() {
		return responsavel1;
	}

	public void setResponsavel1(String responsavel1) {
		this.responsavel1 = responsavel1;
	}

//	public String getResponsavel2() {
//		return responsavel2;
//	}
//
//
//
//
//
//	public void setResponsavel2(String responsavel2) {
//		this.responsavel2 = responsavel2;
//	}
//
//
//
//
//
//	public String getResponsavel3() {
//		return responsavel3;
//	}
//
//
//
//
//
//	public void setResponsavel3(String responsavel3) {
//		this.responsavel3 = responsavel3;
//	}

//	public byte[] getImg1() {
//		return img1;
//	}
//
//
//
//
//
//	public void setImg1(byte[] img1) {
//		this.img1 = img1;
//	}
//
//
//
//
//
//	public byte[] getImg2() {
//		return img2;
//	}
//
//
//
//
//
//	public void setImg2(byte[] img2) {
//		this.img2 = img2;
//	}
//
//
//
//
//
//	public byte[] getImg3() {
//		return img3;
//	}
//
//
//
//
//
//	public void setImg3(byte[] img3) {
//		this.img3 = img3;
//	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id_evento;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Evento other = (Evento) obj;
		if (id_evento != other.id_evento)
			return false;
		return true;
	}

}
