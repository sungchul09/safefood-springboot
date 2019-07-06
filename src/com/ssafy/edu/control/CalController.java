package com.ssafy.edu.control;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.edu.dto.CalendarDto;
import com.ssafy.edu.dto.FoodDto;
import com.ssafy.edu.dto.MemberDto;
import com.ssafy.edu.service.IAllergiesService;
import com.ssafy.edu.service.ICalendarService;
import com.ssafy.edu.service.IFoodService;
import com.ssafy.edu.service.IMAllergiesService;

@Controller
public class CalController {
	@Autowired
	IFoodService iFoodService;

	@Autowired
	IAllergiesService iAllergiesService;

	@Autowired
	IMAllergiesService iMAllergiesService;

	@Autowired
	ICalendarService iCalendarService;

	@RequestMapping(value = "bestlist.do", method = RequestMethod.GET)
	public String bestlist(Model model, HttpSession session) throws Exception {
		MemberDto member = (MemberDto) session.getAttribute("member");
		model.addAttribute("foods", iFoodService.getFoodlist());
		List<FoodDto> foodlist = new ArrayList<>();
		if (member != null) {
			model.addAttribute("user_email", member.getEmail());
			List<CalendarDto> list = iCalendarService.getCalEmailBest(member.getEmail());
			model.addAttribute("quantity", list);
			// System.out.println(list.toString());
			for (CalendarDto cal : list) {
				foodlist.add(iFoodService.searchFoodByCode(cal.getCode()));
			}
			model.addAttribute("sortfood", foodlist);
			model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
		} else {
			model.addAttribute("user_email", "");
			model.addAttribute("quantity", null);
			model.addAttribute("sortfood", foodlist);
			model.addAttribute("userarg", "");
		}
		return "bestlist";
	}

	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendar(Model model, HttpSession session, String left, String right, String wdate, String y,
			String m, String d) throws Exception {
		Calendar calender = Calendar.getInstance();
		MemberDto member = (MemberDto) session.getAttribute("member");
		
		int year = 0;
		int month = 0;
		if (y != null && m != null && d != null) {
			if (Integer.parseInt(m) < 10) {
				m = "0" + m;
			}
			if (Integer.parseInt(d) < 10) {
				d = "0" + d;
			}
			wdate = y + "-" + m + "-" + d;
		} else if (wdate == null) {
			String tyear = String.valueOf(calender.get(calender.YEAR));
			String tmonth = String.valueOf((calender.get(calender.MONTH) + 1));
			String tday = String.valueOf(calender.get(calender.DATE));
			if (Integer.parseInt(tmonth) < 10) {
				tmonth = "0" + tmonth;
			}
			if (Integer.parseInt(tday) < 10) {
				tday = "0" + tday;
			}
			wdate = tyear + "-" + tmonth + "-" + tday;
		}
		String syear = wdate.substring(0, 4);
		String smonth = wdate.substring(5, 7);
		String sday = wdate.substring(8, 10);
		if (syear != null && !syear.trim().equals("")) {
			year = Integer.parseInt(syear.trim());
		}
		if (smonth != null && !smonth.trim().equals("")) {
			month = Integer.parseInt(smonth.trim());
		}

		if (month > 12) {
			month = 1;
			year++;
		} else if (month < 1) {
			month = 12;
			year--;
		}
		if (left != null && left.equals("ok")) {
			month -= 1;
			sday = "1";
		} else if (right != null && right.equals("ok")) {
			month += 1;
			sday = "1";
		}
		calender.set(Calendar.YEAR, year);
		calender.set(Calendar.MONTH, month - 1);
		calender.set(Calendar.DATE, 1);
		int dayofweek = calender.get(Calendar.DAY_OF_WEEK);// 1일의 요일 1~7
		int lastday = calender.getActualMaximum(Calendar.DAY_OF_MONTH);

		model.addAttribute("dayofweek", dayofweek);
		model.addAttribute("lastday", lastday);
		// model.addAttribute("today", today);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", sday);

		List<CalendarDto> daycals = new ArrayList<>();
		List<FoodDto> foods = new ArrayList<>();
		if(member == null)
			return "calendar";
		daycals = iCalendarService.searchCalendarList(new CalendarDto(member.getEmail(), wdate));
		if (!daycals.isEmpty()) {
			model.addAttribute("daycals", daycals);
			for (int i = 0; i < daycals.size(); i++) {
				for (int j = 0; j < daycals.get(i).getQuantity(); j++) {
					foods.add(iFoodService.searchFoodByCode(daycals.get(i).getCode()));
				}
			}
			model.addAttribute("foods", foods);
			double calory = 0, carbo = 0, protein = 0, fat = 0, sugar = 0, natrium = 0, chole = 0, fattyacid = 0,
					transfat = 0;
			for (int i = 0; i < foods.size(); i++) {
				calory += foods.get(i).getCalory();
				carbo += foods.get(i).getCarbo();
				protein += foods.get(i).getProtein();
				fat += foods.get(i).getFat();
				sugar += foods.get(i).getSugar();
				natrium += foods.get(i).getNatrium();
				chole += foods.get(i).getChole();
				fattyacid += foods.get(i).getFattyacid();
				transfat += foods.get(i).getTransfat();
			}
			model.addAttribute("calory", calory);
			model.addAttribute("carbo", carbo);
			model.addAttribute("protein", protein);
			model.addAttribute("fat", fat);
			model.addAttribute("sugar", sugar);
			model.addAttribute("natrium", natrium);
			model.addAttribute("chole", chole);
			model.addAttribute("fattyacid", fattyacid);
			model.addAttribute("transfat", transfat);

			if(280<=chole&&chole<=320) {
				model.addAttribute("cholecol", "green");	
			}else {
				model.addAttribute("cholecol", "red");						
			}
			if(1300<=natrium&&natrium<=1700) {
				model.addAttribute("natriumcol", "green");
			}else {
				model.addAttribute("natriumcol", "red");						
			}


			if(member.getGender().equals("male")) {
				if(member.getTall()<170) {
					if(2500<=calory&&calory<=2900) {
						model.addAttribute("calorycol", "green");
					}else {
						model.addAttribute("calorycol", "red");						
					}

					if(370<=carbo&&carbo<=470) {
						model.addAttribute("carbocol", "green");
					}else {
						model.addAttribute("carbocol", "red");						
					}

					if(55<=protein&&protein<=65) {
						model.addAttribute("proteincol", "green");
					}else {
						model.addAttribute("proteincol", "red");						
					}
					
					if(100<=fat&&fat<=200) {
						model.addAttribute("fatcol", "green");
					}else {
						model.addAttribute("fatcol", "red");						
					}

					if(sugar<=calory/10) {
						model.addAttribute("sugarcol", "green");
					}else {
						model.addAttribute("sugarcol", "red");						
					}

					if(fattyacid<=(calory/20)) {
						model.addAttribute("fattyacidcol", "green");
					}else {
						model.addAttribute("fattyacidcol", "red");						
					}

					if(transfat<=(calory/100)) {
						model.addAttribute("transfatcol", "green");
					}else {
						model.addAttribute("transfatcol", "red");						
					}


				}else {

					if(2400<=calory&&calory<=2800) {
						model.addAttribute("calorycol", "green");
					}else {
						model.addAttribute("calorycol", "red");						
					}

					if(360<=carbo&&carbo<=460) {
						model.addAttribute("carbocol", "green");
					}else {
						model.addAttribute("carbocol", "red");						
					}

					if(50<=protein&&protein<=60) {
						model.addAttribute("proteincol", "green");
					}else {
						model.addAttribute("proteincol", "red");						
					}

					if(100<=fat&&fat<=160) {
						model.addAttribute("fatcol", "green");
					}else {
						model.addAttribute("fatcol", "red");						
					}
					
					if(sugar<=calory/20) {
						model.addAttribute("sugarcol", "green");
					}else {
						model.addAttribute("sugarcol", "red");						
					}


					if(fattyacid<=(calory/20)) {
						model.addAttribute("fattyacidcol", "green");
					}else {
						model.addAttribute("fattyacidcol", "red");						
					}

					if(transfat<=(calory/100)) {
						model.addAttribute("transfatcol", "green");
					}else {
						model.addAttribute("transfatcol", "red");						
					}


				}
			}else {
				if(member.getTall()<160) {
					if(1800<=calory&&calory<=2200) {
						model.addAttribute("calorycol", "green");
					}else {
						model.addAttribute("calorycol", "red");						
					}

					if(280<=carbo&&carbo<=350) {
						model.addAttribute("carbocol", "green");
					}else {
						model.addAttribute("carbocol", "red");						
					}

					if(40<=protein&&protein<=50) {
						model.addAttribute("proteincol", "green");
					}else {
						model.addAttribute("proteincol", "red");						
					}
					
					if(80<=fat&&fat<=150) {
						model.addAttribute("fatcol", "green");
					}else {
						model.addAttribute("fatcol", "red");						
					}

					if(sugar<=calory/20) {
						model.addAttribute("sugarcol", "green");
					}else {
						model.addAttribute("sugarcol", "red");						
					}

					if(fattyacid<=(calory/20)) {
						model.addAttribute("fattyacidcol", "green");
					}else {
						model.addAttribute("fattyacidcol", "red");						
					}

					if(transfat<=(calory/100)) {
						model.addAttribute("transfatcol", "green");
					}else {
						model.addAttribute("transfatcol", "red");						
					}

				}else {
					if(1900<=calory&&calory<=2300) {
						model.addAttribute("calorycol", "green");
					}else {
						model.addAttribute("calorycol", "red");						
					}

					if(290<=carbo&&carbo<=370) {
						model.addAttribute("carbocol", "green");
					}else {
						model.addAttribute("carbocol", "red");						
					}

					if(45<=protein&&protein<=55) {
						model.addAttribute("proteincol", "green");
					}else {
						model.addAttribute("proteincol", "red");						
					}
					
					if(80<=fat&&fat<=130) {
						model.addAttribute("fatcol", "green");
					}else {
						model.addAttribute("fatcol", "red");						
					}

					if(sugar<=calory/20) {
						model.addAttribute("sugarcol", "green");
					}else {
						model.addAttribute("sugarcol", "red");						
					}

					if(fattyacid<=(calory/20)) {
						model.addAttribute("fattyacidcol", "green");
					}else {
						model.addAttribute("fattyacidcol", "red");						
					}

					if(transfat<=(calory/100)) {
						model.addAttribute("transfatcol", "green");
					}else {
						model.addAttribute("transfatcol", "red");						
					}

				}
			}

		}

		return "calendar";
	}

	@RequestMapping(value = "calwritebf.do", method = RequestMethod.GET)
	   public String calwritebf(Model model, HttpSession session, String left, String right, String wdate, String y,
	         String m, String d) throws Exception {
	      if(Integer.parseInt(m)<10) {
	         m="0"+m;
	      }
	      if(Integer.parseInt(d)<10) {
	         d="0"+d;
	      }
	      model.addAttribute("y", y);
	      model.addAttribute("m", m);
	      model.addAttribute("d", d);
	      model.addAttribute("foods", iFoodService.getFoodlist());

	      return "calwrite";
	   }

	@RequestMapping(value = "calwriteaf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String calwriteaf(Model model, HttpSession session, CalendarDto cal) throws Exception {
		if (cal == null) {
			model.addAttribute("msg", "잘못 입력된 곳이 존재합니다.");
			model.addAttribute("location", "./calwritebf.do");
		} else {
			CalendarDto temp = iCalendarService
					.searchCalendar(new CalendarDto(cal.getEmail(), cal.getCode(), cal.getWdate()));
			if (temp == null) {
				iCalendarService.addCalendar(cal);
				model.addAttribute("msg", "정상적으로 추가되었습니다.");
				model.addAttribute("location", "./calendar.do");
			} else {

				model.addAttribute("msg", "중복된 자료가 존재합니다. (수정 기능을 사용해주세요)");
				model.addAttribute("location", "./calupdatebf2.do");
				session.setAttribute("cal", cal);
			}
		}
		return "alert";
	}

	@RequestMapping(value = "calupdatebf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String calupdatebf(Model model, HttpSession session, CalendarDto cal, int code, String name, int quantity,
			String title, String content, String wdate) throws Exception {
		MemberDto member = (MemberDto) session.getAttribute("member");
		model.addAttribute("foods", iFoodService.getFoodlist());
		CalendarDto temp = (CalendarDto) session.getAttribute("cal");
		if (temp != null) {
			model.addAttribute("cal", temp);
			session.removeAttribute("cal");
		} else {
			cal = new CalendarDto(member.getEmail(), code, quantity, title, content, wdate);
			model.addAttribute("cal", cal);
		}
		return "calupdate";
	}

	@RequestMapping(value = "calupdatebf2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String calupdatebf2(Model model, HttpSession session, CalendarDto cal) throws Exception {
		MemberDto member = (MemberDto) session.getAttribute("member");
		model.addAttribute("foods", iFoodService.getFoodlist());
		CalendarDto temp = (CalendarDto) session.getAttribute("cal");
		if (temp != null) {
			model.addAttribute("cal", temp);
			session.removeAttribute("cal");
		} else {
			cal = new CalendarDto(member.getEmail(), cal.getCode(), cal.getQuantity(), cal.getTitle(), cal.getContent(),
					cal.getWdate());
			model.addAttribute("cal", cal);
		}
		return "calupdate";
	}

	@RequestMapping(value = "calupdateaf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String calupdateaf(Model model, HttpSession session, CalendarDto cal) throws Exception {
		MemberDto member = (MemberDto) session.getAttribute("member");
		if (cal == null) {
			model.addAttribute("msg", "잘못 입력된 곳이 존재합니다.");
			model.addAttribute("location", "./calupdatebf.do");
			session.setAttribute("cal", cal);
		} else {
			CalendarDto cal123 = iCalendarService.searchCalendar(cal);
			cal = new CalendarDto(cal123.getIsbn(), member.getEmail(), cal.getCode(), cal.getQuantity(), cal.getTitle(),
					cal.getContent(), cal.getWdate());
			iCalendarService.updateCalendar(cal);
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("location", "./calendar.do");
		}
		return "alert";
	}

	@RequestMapping(value = "deletecal.do", method = RequestMethod.GET)
	public String deletecal(Model model, int isbn, HttpSession session) throws Exception {
		iCalendarService.deleteCalendar(isbn);
		model.addAttribute("msg", "삭제가 완료되었습니다.");
		model.addAttribute("location", "./calendar.do");
		return "alert";
	}
}
