package com.ssafy.edu.dto;

import java.util.Arrays;

public class MAllergiesDto {
	private String email;
	private String argname;

	public MAllergiesDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MAllergiesDto(String email, String argname) {
		super();
		this.email = email;
		this.argname = argname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getArgname() {
		return argname;
	}

	public void setArgname(String argname) {
		this.argname = argname;
	}

	@Override
	public String toString() {
		return "MAllergiesDto [email=" + email + ", argname=" + argname + "]";
	}

}
