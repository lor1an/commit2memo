package com.com2mem.model;

public enum Role {
	ROLE_USER(new String[] { "ROLE_USER" }), ROLE_ADMIN(new String[] {
			"ROLE_USER", "ROLE_ADMIN" });
	private final String[] roles;

	private Role(String[] roles) {
		this.roles = roles;
	}

	public String[] getRoles() {
		return roles;
	}
}
