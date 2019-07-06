package com.ssafy.edu.dto;

import java.io.Serializable;
import java.util.Arrays;

public class MemberDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private String username;
	private String email;
	private String pass;
	private String phonenum;
	private String gender;
	private double tall;

	public MemberDto() {
	}

	public MemberDto(String username, String email, String pass, String phonenum) {
		super();
		this.username = username;
		this.email = email;
		this.pass = pass;
		this.phonenum = phonenum;
	}
	public MemberDto(String username, String email, String pass, String phonenum, String gender, double tall) {
		super();
		this.username = username;
		this.email = email;
		this.pass = pass;
		this.phonenum = phonenum;
		this.gender = gender;
		this.tall = tall;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public double getTall() {
		return tall;
	}

	public void setTall(double tall) {
		this.tall = tall;
	}


	@Override
	public String toString() {
		return "MemberDto [username=" + username + ", email=" + email + ", pass=" + pass + ", phonenum=" + phonenum
				+ ", gender=" + gender + ", tall=" + tall + "]";
	}

	

}
