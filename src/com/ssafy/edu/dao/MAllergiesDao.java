package com.ssafy.edu.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itextpdf.text.log.SysoLogger;
import com.ssafy.edu.dto.MAllergiesDto;

@Repository
public class MAllergiesDao {
	String ns = "com.ssafy.edu.mallergies.";

	@Autowired
	private SqlSession sqlSession;

	public List<String> getMAllergiesByEmail(String email) throws Exception {
		return sqlSession.selectList(ns + "getMAllergiesByEmail", email);
	}

	public void insertMAllergies(HashMap<String, String> allergiesMap) throws Exception {
		sqlSession.insert(ns + "insertMAllergies", allergiesMap);
	}

	public void deleteMAllergies(String email) throws Exception {
		sqlSession.delete(ns + "deleteMAllergies", email);
	}
	
	public List<String> getIngredientByEmail(String email) throws Exception {
		return sqlSession.selectList(ns + "getIngredientByEmail", email);
	}
}
