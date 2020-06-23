package dados;

import java.io.Serializable;

public class Evento implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id_evento;
	private String data_evento, nome_evento, estado, turno, cat_evento, tipo_evento, carga_horaria, periodo, horario, ementa,
			setor, cargo, responsavel1,qtd_turmas, file, responsavel2, file2, responsavel3, file3, assinatura2, assinatura3;
	// private byte[] img1,img2,img3;


	public Evento() {

	}

	public Evento(int id_evento, String data_evento, String nome_evento,String estado, String turno, String cat_evento,
			String tipo_evento, String carga_horaria, String periodo, String horario, String ementa, String setor,
			String cargo, String responsavel1,  String qtd_turmas, String file, String responsavel2, String file2, String responsavel3, String file3, String assinatura2, String assinatura3) {

		super();
		this.id_evento = id_evento;
		this.data_evento = data_evento;
		this.nome_evento = nome_evento;
		this.estado = estado;
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
		this.qtd_turmas = qtd_turmas;
		this.file = file;
		this.responsavel2 = responsavel2;
		this.file2 = file2;
		this.responsavel3 = responsavel3;
		this.file3 = file3;
		this.assinatura2 = assinatura2;
		this.assinatura3 = assinatura3;
		
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
	

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
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

	public String getResponsavel2() {
		return responsavel2;
	}

	public void setResponsavel2(String responsavel2) {
		this.responsavel2 = responsavel2;
	}
	

	public String getResponsavel3() {
		return responsavel3;
	}


	public void setResponsavel3(String responsavel3) {
		this.responsavel3 = responsavel3;
	}



	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
	}
	
	public String getAssinatura2() {
		return assinatura2;
	}

	public void setAssinatura2(String assinatura2) {
		this.assinatura2 = assinatura2;
	}

	public String getAssinatura3() {
		return assinatura3;
	}

	public void setAssinatura3(String assinatura3) {
		this.assinatura3 = assinatura3;
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
