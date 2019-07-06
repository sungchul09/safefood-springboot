package com.ssafy.edu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.edu.dao.MAllergiesDao;

@Service
public class MAllergiesServiceImpl implements IMAllergiesService {
	@Autowired
	private MAllergiesDao mAllergiesDao;

	public List<String> getMAllergiesByEmail(String email) throws Exception {
		return mAllergiesDao.getMAllergiesByEmail(email);
	}

	public void insertMAllergies(HashMap<String, String> allergiesMap) throws Exception {
		mAllergiesDao.insertMAllergies(allergiesMap);
	}

	public void deleteMAllergies(String email) throws Exception {
		mAllergiesDao.deleteMAllergies(email);
	}

	public List<String> getIngredientByEmail(String email) throws Exception {
		return mAllergiesDao.getIngredientByEmail(email);
	}
}
