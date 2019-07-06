package com.ssafy.edu.dto;

public class CalendarDto {

	private int isbn;
	private String email;
	private int code;
	private int quantity;
	private String title;
	private String content;
	private String wdate;

	public CalendarDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CalendarDto(int isbn, String email, int code, int quantity, String title, String content, String wdate) {
		this.isbn = isbn;
		this.email = email;
		this.code = code;
		this.quantity = quantity;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
	}
	
	public CalendarDto(String email, int code, int quantity, String title, String content, String wdate) {
		this.email = email;
		this.code = code;
		this.quantity = quantity;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
	}

	public CalendarDto(String email, int code, String wdate) {
		this.email = email;
		this.code = code;
		this.wdate = wdate;
	}
	
	public CalendarDto(String email, String wdate) {
		this.email = email;
		this.wdate = wdate;
	}


	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "CalendarDto [isbn=" + isbn + ", email=" + email + ", code=" + code + ", quantity=" + quantity
				+ ", title=" + title + ", content=" + content + ", wdate=" + wdate + "]";
	}

}
