package com.ssafy.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.AllergiesDao;
import com.ssafy.edu.dto.AllergiesDto;

@Service
public class AllergiesServiceImpl implements IAllergiesService {
	@Autowired
	AllergiesDao allergiesDao;

	@Override
	@Transactional(readOnly = true)
	public List<AllergiesDto> getAllergieslist() throws Exception {
		return allergiesDao.getAllergieslist();
	}

	@Override
	@Transactional(readOnly = true)
	public AllergiesDto getAllergies(String argname) throws Exception {
		return allergiesDao.getAllergies(argname);
	}

}
