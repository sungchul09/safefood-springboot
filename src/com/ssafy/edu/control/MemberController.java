package com.ssafy.edu.control;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itextpdf.text.log.SysoCounter;
import com.ssafy.edu.dto.CalendarDto;
import com.ssafy.edu.dto.FoodDto;
import com.ssafy.edu.dto.MemberDto;
import com.ssafy.edu.service.ICalendarService;
import com.ssafy.edu.service.IFoodService;
import com.ssafy.edu.service.IMAllergiesService;
import com.ssafy.edu.service.IMemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private IMemberService imemberService;

	@Autowired
	private IMAllergiesService iMAllergiesService;

	@Autowired
	private IFoodService iFoodService;

	@Autowired
	private ICalendarService iCalendarService;

	@RequestMapping(value = "registerbf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String registerbf(Model model) throws Exception {
		logger.debug("Welcome Member registerbf! " + new Date());
		return "register";
	}

	@RequestMapping(value = "register.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String register(@ModelAttribute MemberDto mem, String[] allergy, Model model, HttpSession session)
			throws Exception {
		logger.debug("Welcome Member register! " + new Date());

		MemberDto tmpmem = imemberService.findMemberByEmail(mem.getEmail());
		MemberDto member = null;
		if (tmpmem == null) {
			imemberService.insertMember(mem);
			if (allergy == null) {

			} else {
				for (int i = 0; i < allergy.length; i++) {
					HashMap<String, String> allergiesMap = new HashMap<>();
					allergiesMap.put("email", mem.getEmail());
					allergiesMap.put("argname", allergy[i]);
					iMAllergiesService.insertMAllergies(allergiesMap);
				}
			}
			member = imemberService.checkMember(mem);
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			session.setAttribute("member", member);
			model.addAttribute("location", "./main.do");
			return "alert";
		} else {
			return "main";
		}
	}

	@RequestMapping(value = "loginbf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginbf(Model model) throws Exception {
		logger.debug("Welcome UserController loginbf! " + new Date());
		return "login";
	}

	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute MemberDto mem, Model model, HttpSession session) throws Exception {
		logger.debug("Welcome Member login! " + new Date());
		MemberDto member = imemberService.checkMember(mem);
		if (member != null) {
			session.setAttribute("member", member);
			session.setAttribute("basket", null);
			return "redirect:/main.do";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(Model model, HttpSession session) throws Exception {
		logger.debug("Welcome UserController logout! " + new Date());
		session.invalidate();
		return "redirect:/main.do";
	}

	@RequestMapping(value = "detail_membf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String detail_membf(String email, Model model) throws Exception {
		logger.debug("Welcome Member detail_membf! " + new Date());
		List<String> arglist = new LinkedList<>();
		MemberDto member = imemberService.findMemberByEmail(email);
		arglist = iMAllergiesService.getMAllergiesByEmail(member.getEmail());

		model.addAttribute("member", member);
		
		for (int i = 0; i < arglist.size(); i++) {
			if (member.getGender().equals("male")) {
				model.addAttribute("male", member.getGender());
			} else if (member.getGender().equals("female")) {
				model.addAttribute("female", member.getGender());
			}
		}
		
		for (int i = 0; i < arglist.size(); i++) {
			String name = arglist.get(i);
			if (name.equals("대두")) {
				model.addAttribute("bean", name);
			} else if (name.equals("우유")) {
				model.addAttribute("milk", name);
			} else if (name.equals("게")) {
				model.addAttribute("crap", name);
			} else if (name.equals("새우")) {
				model.addAttribute("shirimp", name);
			} else if (name.equals("참치")) {
				model.addAttribute("tuna", name);
			} else if (name.equals("연어")) {
				model.addAttribute("salmon", name);
			} else if (name.equals("쑥")) {
				model.addAttribute("ssuk", name);
			} else if (name.equals("소고기")) {
				model.addAttribute("beef", name);
			} else if (name.equals("닭고기")) {
				model.addAttribute("chicken", name);
			} else if (name.equals("돼지고기")) {
				model.addAttribute("pork", name);
			} else if (name.equals("복숭아")) {
				model.addAttribute("peach", name);
			} else if (name.equals("민들레")) {
				model.addAttribute("flower", name);
			} else if (name.equals("계란흰자")) {
				model.addAttribute("egg", name);
			}
		}
		return "change";
	}

	@RequestMapping(value = "change.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String change(@ModelAttribute MemberDto mem, String[] allergy, Model model) throws Exception {
		logger.debug("Welcome Member change! " + new Date());
		String email = mem.getEmail();
		imemberService.updateMember(mem);
		iMAllergiesService.deleteMAllergies(email);
		if (allergy != null) {
			for (int i = 0; i < allergy.length; i++) {
				HashMap<String, String> allergiesMap = new HashMap<>();
				allergiesMap.put("email", email);
				allergiesMap.put("argname", allergy[i]);
				iMAllergiesService.insertMAllergies(allergiesMap);
			}

		}
		model.addAttribute("msg", "수정이 완료되었습니다.");
		model.addAttribute("location", "./main.do");
		return "alert";
	}

	@RequestMapping(value = "index.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String index(Model model) throws Exception {
		logger.debug("Welcome Member index! " + new Date());
		return "redirect:/main.do";
	}

	@RequestMapping(value = "deletemem.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deletemem(Model model, String email, HttpSession session) throws Exception {
		logger.debug("Welcome Member deletemem! " + new Date());
		if (email != null) {
			iMAllergiesService.deleteMAllergies(email);
			imemberService.deleteMember(email);
			model.addAttribute("msg", "탈퇴가완료되었습니다.");
			model.addAttribute("location", "./main.do");
			session.invalidate();
		}
		return "alert";
	}

	@RequestMapping(value = "basket.do", method = RequestMethod.GET)
	public String basket(Model model, HttpSession session) throws Exception {
		MemberDto member = (MemberDto) session.getAttribute("member");
		model.addAttribute("member", session.getAttribute("member"));
		model.addAttribute("foods", session.getAttribute("basket"));
		return "foodbasket";
	}

	@RequestMapping(value = "basketadd.do", method = RequestMethod.GET)
	public String basketadd(Model model, HttpSession session, int code) throws Exception {
		FoodDto food = iFoodService.searchFoodByCode(code);
		List<FoodDto> foods = (List<FoodDto>) session.getAttribute("basket");
		List<FoodDto> newlist = new ArrayList<>();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if (member != null) {
			model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
		} else {
			model.addAttribute("userarg", "");
		}

		boolean stop = false;
		// 담겨있는게 있다면
		if (foods != null) {
			newlist = foods;
			for (int i = 0; i < foods.size(); i++) {
				if (foods.get(i).getCode() == code) {
					stop = true;
					break;
				}
			}
			// 이미존재한다면
			if (stop == true) {
				model.addAttribute("msg", "이미 장바구니에 담긴 아이템입니다.");
				model.addAttribute("location", "./foodlist.do");
				return "alert";
			}
		}
		newlist.add(food);
		session.setAttribute("basket", newlist);
		model.addAttribute("msg", "성공적으로 담았습니다.");
		model.addAttribute("location", "./foodlist.do");
		return "alert";
	}

	@RequestMapping(value = "basketdelete.do", method = RequestMethod.GET)
	public String basketdelete(Model model, HttpSession session, int code) throws Exception {
		FoodDto food = iFoodService.searchFoodByCode(code);
		List<FoodDto> foods = (List<FoodDto>) session.getAttribute("basket");
		List<FoodDto> newlist = new ArrayList<>();
		for (int i = 0; i < foods.size(); i++) {
			if (foods.get(i).getCode() == code) {
				foods.remove(i);
			}
		}
		MemberDto member = (MemberDto) session.getAttribute("member");
		if (member != null) {
			model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
		} else {
			model.addAttribute("userarg", "");
		}
		session.setAttribute("basket", foods);

		return "redirect:./basket.do";
	}
	@RequestMapping(value = "searchpassbf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchpassbf(Model model) throws Exception {
		logger.debug("Welcome UserController loginbf! " + new Date());
		return "searchpass";
	}

	@RequestMapping(value = "searchpass.do", method = { RequestMethod.GET, RequestMethod.POST })
	   public String searchpass(Model model, String email,String name,HttpSession session) throws Exception {
	      System.out.println("email : "+email);
	      
	      logger.debug("Welcome Member login! " + new Date());
	      MemberDto member=imemberService.searchpass(email);
	      String getname = member.getUsername();
	      if (getname.equals(name)) {

	         //임시 비밀번호 생성
	         char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'};
	           StringBuilder sb = new StringBuilder("");
	           Random rn = new Random();
	           for( int i = 0 ; i < 8 ; i++ ){
	               sb.append( charaters[ rn.nextInt( charaters.length ) ] );
	           }
	           member.setPass(sb.toString());
	           imemberService.updateMember(member);               
	         session.setAttribute("searchemail", email);
	         session.setAttribute("searchname", name);
	         session.setAttribute("searchpass", sb.toString());
	         
	         return "sendMail";
	      } else {
	         System.out.println("search pass error");
	         return "main";
	      }
	   }
	
	@RequestMapping(value = "location.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchpass(Model model, HttpSession session) throws Exception {
		return "location";
	}
	
}
