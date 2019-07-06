package com.ssafy.edu.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.dto.FoodDto;

@Repository
public class FoodDao {
	String ns = "com.ssafy.edu.food.";

	@Autowired
	private SqlSession sqlSession;

	public List<FoodDto> getFoodlist() throws Exception {
		return sqlSession.selectList(ns + "getFoodlist");
	}

	public FoodDto getFood(FoodDto food) throws Exception {
		return sqlSession.selectOne(ns + "getFood", food);
	}

	public FoodDto searchFoodByCode(int code) throws Exception {
		return sqlSession.selectOne(ns + "searchFoodByCode", code);
	}

	public List<FoodDto> searchFood(HashMap<String, String> foodMap) throws Exception {
		return sqlSession.selectList(ns + "searchFood", foodMap);
	}
	public void deleteFood(int code) throws Exception {
		sqlSession.selectOne(ns + "deleteFood", code);
	}
	public void updateFood(FoodDto food) throws Exception {
		sqlSession.selectOne(ns + "updateFood", food);
	}
	public void addFood(FoodDto food) throws Exception {
		sqlSession.selectOne(ns + "addFood", food);
	}

}
