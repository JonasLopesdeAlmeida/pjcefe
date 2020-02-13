package dados;

import java.io.Serializable;

public class Cursista implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id_cursista;
	private String nome, cpf, matricula, instituicao, email, fone, funcao, cargo, setor, datanasc;
   


	private Evento evento;

	public Cursista() {

	}

	
	
	
	public Cursista(int id_cursista, String nome, String cpf, String matricula, String instituicao, String email,
			String fone, String funcao, String cargo, String setor, String datanasc) {
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
	
	
	}


	public int getId_cursista() {
		return id_cursista;
	}

	public void setId_cursista(int id_cursista) {
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
	




	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id_cursista;
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
		if (id_cursista != other.id_cursista)
			return false;
		return true;
	}

	

	
	
	
}
