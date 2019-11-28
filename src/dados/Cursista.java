package dados;

import java.io.Serializable;

public class Cursista implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id_cursista;
	private String nome, cpf, matricula, instituicao, email, fone, funcao, cargo, setor, datanasc;
	private int id_evento;


	private Evento evento;

	public Cursista() {

	}

	public Cursista(Long id_cursista, String nome, String cpf, String matricula, String instituicao, String email, String fone, String funcao,
			String cargo, String setor, String datanasc, int id_evento) {
		super();
		this.id_cursista = id_cursista;
		this.nome = nome;
		this.cpf = cpf;
		this.matricula = matricula;
		this.instituicao = instituicao;
		this.email = email;
		this.fone = fone;
		this.funcao = funcao;
		this.cargo = cargo;
		this.setor = setor;
		this.datanasc = datanasc;
		this.id_evento = id_evento;
	}

	public Long getId_cursista() {
		return id_cursista;
	}

	public void setId_cursista(Long id_cursista) {
		this.id_cursista = id_cursista;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	
	public String getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(String instituicao) {
		this.instituicao = instituicao;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFone() {
		return fone;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getSetor() {
		return setor;
	}

	public void setSetor(String setor) {
		this.setor = setor;
	}

	public Evento getEvento() {
		return evento;
	}

	public void setEvento(Evento evento) {
		this.evento = evento;
	}

	public String getDatanasc() {
		return datanasc;
	}

	public void setDatanasc(String datanasc) {
		this.datanasc = datanasc;
	}
	

	public int getId_evento() {
		return id_evento;
	}

	public void setId_evento(int id_evento) {
		this.id_evento = id_evento;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id_cursista == null) ? 0 : id_cursista.hashCode());
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
		Cursista other = (Cursista) obj;
		if (id_cursista == null) {
			if (other.id_cursista != null)
				return false;
		} else if (!id_cursista.equals(other.id_cursista))
			return false;
		return true;
	}


	
	
	
}
