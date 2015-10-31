package com.com2mem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usr {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long usrId;
	private String login;
	private String password;
	private String email;
	
	public Usr(){
		
	}
	
	public Usr(String login, String email) {
		super();
		this.login = login;
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

    @Override
    public String toString() {
        return "User [usrId=" + usrId + ", login=" + login + ", password=" + password
                + ", email=" + email + "]";
    }
	
}
