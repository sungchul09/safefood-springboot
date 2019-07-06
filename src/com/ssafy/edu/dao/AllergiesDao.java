package com.ssafy.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.dto.AllergiesDto;

@Repository
public class AllergiesDao {
	String ns = "com.ssafy.edu.allergies.";

	@Autowired
	private SqlSession sqlSession;

	public List<AllergiesDto> getAllergieslist() throws Exception {
		return sqlSession.selectList(ns + "getAllergieslist");
	}

	public AllergiesDto getAllergies(String argname) throws Exception {
		return sqlSession.selectOne(ns + "getAllergies");
	}

}
