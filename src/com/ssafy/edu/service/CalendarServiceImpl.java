package com.ssafy.edu.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.AllergiesDao;
import com.ssafy.edu.dao.CalendarDao;
import com.ssafy.edu.dto.CalendarDto;

@Service
public class CalendarServiceImpl implements ICalendarService {
	public void quicksort(List<CalendarDto> input, int start, int end) {
		int left = start;
		int right = end;
		int mid = input.get((left + right) / 2).getQuantity();
		
		do {
			while (input.get(left).getQuantity() < mid)
				left++;
			while (input.get(right).getQuantity() > mid)
				right--;
			if (left <= right) {
				if(left<right) {
				CalendarDto temp = input.get(left);
				CalendarDto temp2 = input.get(right);
				input.remove(right);
				input.remove(left);
				input.add(left, temp2);
				input.add(right,temp);
				}
				

				
				
				
				left++;
				right--;

			}

		} while (left <= right);
		if (start < right) {
			quicksort(input, start, right);
		}
		if (end > left) {
			quicksort(input, left, end);
		}

	}

	@Autowired
	CalendarDao calendarDao;

	@Override
	public void addCalendar(CalendarDto cal) throws Exception {
		calendarDao.addCalendar(cal);
	}

	@Override
	@Transactional(readOnly = true)
	public List<CalendarDto> getCalEmail(String email) throws Exception {
		return calendarDao.getCalEmail(email);
	}

	@Override
	@Transactional(readOnly = true)
	public List<CalendarDto> getCalDate(String wdate) throws Exception {
		return calendarDao.getCalDate(wdate);
	}

	@Override
	@Transactional(readOnly = true)
	public List<CalendarDto> getCalCode(int code) throws Exception {
		return calendarDao.getCalCode(code);
	}

	@Override
	public void deleteCalendar(int isbn) throws Exception {
		calendarDao.deleteCalendar(isbn);
	}

	@Override
	public void updateCalendar(CalendarDto cal) throws Exception {
		calendarDao.updateCalendar(cal);
	}

	@Override
	public CalendarDto searchCalendar(CalendarDto cal) throws Exception {
		return calendarDao.searchCalendar(cal);
	}

	@Override
	public List<CalendarDto> searchCalendarList(CalendarDto cal) throws Exception {
		return calendarDao.searchCalendarList(cal);
	}

	@Override
	public List<CalendarDto> getCalEmailBest(String email) throws Exception {
		// TODO Auto-generated method stub
		List<CalendarDto> temp = calendarDao.getCalEmail(email);
		if(temp.size()==0) {
			return temp;
		}
		HashMap<Integer, CalendarDto> map = new HashMap();
		for (CalendarDto cal : temp) {
			if (map.containsKey(cal.getCode())) {
				map.get(cal.getCode()).setQuantity(map.get(cal.getCode()).getQuantity() + cal.getQuantity());
			} else {
				map.put(cal.getCode(), cal);
			}
		}
		List<CalendarDto> temp2 = new ArrayList<>();
		for (CalendarDto caldto : map.values()) {
			temp2.add(caldto);
		}
		
		quicksort(temp2, 0, temp2.size() - 1);
		
		Collections.reverse(temp2);
		
		return temp2;
	}
}
