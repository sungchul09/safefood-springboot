package com.ssafy.edu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.ssafy.edu.dto.FoodDto;

public interface IFoodService {
	//public void addFood(FoodDto food) throws Exception;

	public List<FoodDto> getFoodlist() throws Exception;

	public FoodDto getFood(FoodDto food) throws Exception;

	public FoodDto searchFoodByCode(int code) throws Exception;

	public List<FoodDto> searchFood(HashMap<String, String> foodMap) throws Exception;

	public void deleteFood(int code) throws Exception;

	public void updateFood(FoodDto food) throws Exception;

	void addFood(FoodDto food) throws Exception;

}
