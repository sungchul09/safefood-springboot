package com.ssafy.edu.dto;

import java.util.ArrayList;

// 게시판 목록보기 화면에서 필요한 모든 데이터를 하나의 객체에 담기 위한 클래스
public class FoodPageDto {
	private ArrayList<FoodDto> foodList;
	private int page;
	private int startPage;
	private int endPage;
	private int totalPage;
///////////////////////////////////////////////////////////
	public FoodPageDto() {}
	public FoodPageDto(ArrayList<FoodDto> foodList, int page, int startPage, int endPage, int totalPage) {
		this.foodList = foodList;
		this.page = page;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
	}
/////////////////////////////////////////////////////////////	
	public ArrayList<FoodDto> getfoodList() {
		return foodList;
	}
	
	public void setfoodList(ArrayList<FoodDto> foodList) {
		this.foodList = foodList;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
