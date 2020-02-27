package dados;

import java.io.Serializable;

public class login implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id_login;
	private String usuario, senha;
	
	public login() {
		
		
	}

	public login(int id_login, String usuario, String senha) {
		super();
		this.id_login = id_login;
		this.usuario = usuario;
		this.senha = senha;
	}

	public int getId_login() {
		return id_login;
	}

	public void setId_login(int id_login) {
		this.id_login = id_login;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id_login;
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
		login other = (login) obj;
		if (id_login != other.id_login)
			return false;
		return true;
	}
	
	
	
	

}
