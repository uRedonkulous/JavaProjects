package com.thanh.newProject.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class Login {

	@NotEmpty(message="Email is required.")
	@Email(message="Invalid Email.")
	private String email;
	
	@NotEmpty(message="Password is required.")
	@Size(message="Incorrect Password.")
	private String password;
	
	public Login() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
