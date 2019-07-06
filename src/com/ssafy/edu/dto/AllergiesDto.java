package com.ssafy.edu.dto;

public class AllergiesDto {
	private String argname;
	private String argingredient;

	public AllergiesDto() {
		super();
	}

	public AllergiesDto(String argname, String argingredient) {
		super();
		this.argname = argname;
		this.argingredient = argingredient;
	}

	public String getArgname() {
		return argname;
	}

	public void setArgname(String argname) {
		this.argname = argname;
	}

	public String getArgingredient() {
		return argingredient;
	}

	public void setArgingredient(String argingredient) {
		this.argingredient = argingredient;
	}

	@Override
	public String toString() {
		return "AllergiesDto [argname=" + argname + ", argingredient=" + argingredient + "]";
	}

}