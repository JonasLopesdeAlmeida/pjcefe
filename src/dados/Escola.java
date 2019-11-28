package dados;

import java.io.Serializable;

public class Escola implements Serializable {

	private static final long serialVersionUID = 1L;


	private Long id_escola;
	
	private String instituicao,modalidade,gestor,endereco,telefone,email;
	
	public Escola() {
		
		
	}
	
	public Escola(Long id_escola, String instituicao, String modalidade, String gestor, String endereco, String telefone,
			String email) {
		super();
		this.id_escola = id_escola;
		this.instituicao = instituicao;
		this.modalidade = modalidade;
		this.gestor = gestor;
		this.endereco = endereco;
		this.telefone = telefone;
		this.email = email;
	}
	public Long getId_escola() {
		return id_escola;
	}
	public void setId_escola(Long id_escola) {
		this.id_escola = id_escola;
	}
	public String getInstituicao() {
		return instituicao;
	}
	public void setInstituicao(String instituicao) {
		this.instituicao = instituicao;
	}
	public String getModalidade() {
		return modalidade;
	}
	public void setModalidade(String modalidade) {
		this.modalidade = modalidade;
	}
	public String getGestor() {
		return gestor;
	}
	public void setGestor(String gestor) {
		this.gestor = gestor;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id_escola == null) ? 0 : id_escola.hashCode());
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
		Escola other = (Escola) obj;
		if (id_escola == null) {
			if (other.id_escola != null)
				return false;
		} else if (!id_escola.equals(other.id_escola))
			return false;
		return true;
	}

	
	
}
