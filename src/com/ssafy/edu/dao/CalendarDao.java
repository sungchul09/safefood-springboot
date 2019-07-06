package com.ssafy.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.dto.CalendarDto;

@Repository
public class CalendarDao {
	String ns = "com.ssafy.edu.calendar.";

	@Autowired
	private SqlSession sqlSession;
	
	public void addCalendar(CalendarDto cal) throws Exception {
		sqlSession.insert(ns + "addCalendarContent", cal);
	}
	public List<CalendarDto> getCalEmail(String email) throws Exception {
		return sqlSession.selectList(ns + "getCalendarListByEmail", email);
	}
	public List<CalendarDto> getCalDate(String wdate) throws Exception {
		return sqlSession.selectList(ns + "getCalendarListByDate", wdate);
	}
	public List<CalendarDto> getCalCode(int code) throws Exception {
		return sqlSession.selectList(ns + "getCalendarListByCode", code);
	}
	public void deleteCalendar(int isbn) throws Exception {
		sqlSession.delete(ns + "deleteCalendar", isbn);
	}
	public void updateCalendar(CalendarDto cal) throws Exception {
		sqlSession.update(ns + "updateCalendar", cal);
	}
	public CalendarDto searchCalendar(CalendarDto cal) throws Exception{
		return sqlSession.selectOne(ns+"searchCalendar", cal);
	}
	public List<CalendarDto> searchCalendarList(CalendarDto cal) throws Exception{
		return sqlSession.selectList(ns+"searchCalendarList",cal);
	}
}
