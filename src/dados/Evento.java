package dados;

import java.io.Serializable;


public class Evento implements Serializable{
	private static final long serialVersionUID = 1L;

	private Long id_evento;
	private String data_evento, nome_evento, turno,cat_evento, tipo_evento, carga_horaria, periodo, horario, ementa, setor, cargo;
	private int qtd_turmas;
	
	
	
	public Evento() {
		
	}

	
	public Evento(Long id_evento, String data_evento, String nome_evento, String turno, String cat_evento, String tipo_evento,
			String carga_horaria, String periodo, String horario, String ementa, String setor, String cargo,
			int qtd_turmas) {
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
		this.qtd_turmas = qtd_turmas;
	}
	
	
	public Long getId_evento() {
		return id_evento;
	}
	public void setId_evento(Long id_evento) {
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


	public int getQtd_turmas() {
		return qtd_turmas;
	}
	public void setQtd_turmas(int qtd_turmas) {
		this.qtd_turmas = qtd_turmas;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id_evento == null) ? 0 : id_evento.hashCode());
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
		if (id_evento == null) {
			if (other.id_evento != null)
				return false;
		} else if (!id_evento.equals(other.id_evento))
			return false;
		return true;
	}
	


}
