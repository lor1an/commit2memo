package com.com2mem.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "usr")
public class Usr {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long usrId;
	private String login;
	private String password;
	private String email;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usr")
	private List<Deck> decks;

	public Usr() {

	}

    public Usr(final String login,final  String password,final  String email) {
        super();
        this.login = login;
        this.password = password;
        this.email = email;
    }

	public Long getUsrId() {
		return usrId;
	}

	public void setUsrId(Long usrId) {
		this.usrId = usrId;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Deck> getDecks() {
		return decks;
	}

	public void setDecks(List<Deck> decks) {
		this.decks = decks;
	}

	@Override
	public String toString() {
		return "User [usrId=" + usrId + ", login=" + login + ", password="
				+ password + ", email=" + email + "]";
	}

}
