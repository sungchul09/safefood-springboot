package com.ssafy.edu.service;

import java.util.List;
import com.ssafy.edu.dto.AllergiesDto;

public interface IAllergiesService {
	public List<AllergiesDto> getAllergieslist() throws Exception;

	public AllergiesDto getAllergies(String argname) throws Exception;
}
