package com.ssafy.edu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.FoodDao;
import com.ssafy.edu.dto.FoodDto;

@Service
public class FoodServiceImpl implements IFoodService {
	@Autowired
	FoodDao foodDao;

	@Override
	@Transactional(readOnly = true)
	public List<FoodDto> getFoodlist() throws Exception {
		return foodDao.getFoodlist();
	}

	@Override
	@Transactional(readOnly = true)
	public FoodDto getFood(FoodDto food) throws Exception {
		return foodDao.getFood(food);
	}

	@Override
	@Transactional(readOnly = true)
	public FoodDto searchFoodByCode(int code) throws Exception {
		return foodDao.searchFoodByCode(code);
	}

	@Override
	@Transactional(readOnly = true)
	public List<FoodDto> searchFood(HashMap<String, String> foodMap) throws Exception {
		return foodDao.searchFood(foodMap);
	}
	
	@Override
	@Transactional
	public void deleteFood(int code) throws Exception {
		foodDao.deleteFood(code);
	}
	
	@Override
	@Transactional
	public void updateFood(FoodDto food) throws Exception {
		foodDao.updateFood(food);
	}

	@Override
	@Transactional
	public void addFood(FoodDto food) throws Exception {
		foodDao.addFood(food);
		
	}
}
