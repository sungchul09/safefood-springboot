package com.ssafy.edu.service;

import java.util.HashMap;
import java.util.List;

import com.ssafy.edu.dto.MAllergiesDto;

public interface IMAllergiesService {

	public List<String> getMAllergiesByEmail(String email) throws Exception;

	public void insertMAllergies(HashMap<String, String> allergiesMap) throws Exception;

	public void deleteMAllergies(String email) throws Exception;

	public List<String> getIngredientByEmail(String email) throws Exception;
}
