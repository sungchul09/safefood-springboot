package com.ssafy.edu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ssafy.edu.dto.CalendarDto;
import com.ssafy.edu.dto.FoodDto;

public interface ICalendarService {
	public void addCalendar(CalendarDto cal) throws Exception;

	public List<CalendarDto> getCalEmail(String email) throws Exception;

	public List<CalendarDto> getCalDate(String wdate) throws Exception;

	public List<CalendarDto> getCalCode(int code) throws Exception;

	public void deleteCalendar(int isbn) throws Exception;

	public void updateCalendar(CalendarDto cal) throws Exception;
	
	public CalendarDto searchCalendar(CalendarDto cal) throws Exception;
	
	public List<CalendarDto> searchCalendarList(CalendarDto cal) throws Exception;
	public List<CalendarDto> getCalEmailBest(String email) throws Exception;
}

