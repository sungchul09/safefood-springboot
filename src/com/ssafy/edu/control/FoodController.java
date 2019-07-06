package com.ssafy.edu.control;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.edu.dto.FoodDto;
import com.ssafy.edu.dto.MemberDto;
import com.ssafy.edu.service.IAllergiesService;
import com.ssafy.edu.service.IFoodService;
import com.ssafy.edu.service.IMAllergiesService;

@Controller
public class FoodController {

   @Autowired
   IFoodService iFoodService;

   @Autowired
   IAllergiesService iAllergiesService;

   @Autowired
   IMAllergiesService iMAllergiesService;

   @RequestMapping(value = "main.do", method = RequestMethod.GET)
   public String main(Model model, HttpSession session) throws Exception {

      model.addAttribute("foods", iFoodService.getFoodlist());
      model.addAttribute("allergies", iAllergiesService.getAllergieslist());
      MemberDto member = (MemberDto) session.getAttribute("member");
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "main";
   }

   @RequestMapping(value = "foodlist.do", method = RequestMethod.GET)
   public String foodlist(Model model, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("foods", iFoodService.getFoodlist());
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "foodlist";
   }

   @RequestMapping(value = "foodview.do", method = RequestMethod.GET)
   public String foodview(Model model, int code, String name, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("food", iFoodService.searchFoodByCode(code));
      model.addAttribute("allergies", iAllergiesService.getAllergieslist());
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "foodview";
   }

   @RequestMapping(value = "foodsearch.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String search(@RequestParam String searchOption, @RequestParam String searchName,
         @RequestParam String currentPage, Model model, HttpSession session) throws Exception {
      HashMap<String, String> foodMap = new HashMap<>();
      foodMap.put("searchOption", searchOption);
      foodMap.put("searchName", searchName);
      model.addAttribute("foods", iFoodService.searchFood(foodMap));
      model.addAttribute("allergies", iAllergiesService.getAllergieslist());
      
      
      
      MemberDto member = (MemberDto) session.getAttribute("member");
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      
      
      
      if (currentPage.equals("main")) {
         return "main";
      }else {
         return "foodlist";
      }
   }

   @RequestMapping(value = "foodqna.do", method = RequestMethod.GET)
      public String foodqna(Model model, HttpSession session) throws Exception {
         MemberDto member = (MemberDto) session.getAttribute("member");
         model.addAttribute("foods", iFoodService.getFoodlist());
         model.addAttribute("member", session.getAttribute("member"));
         
         if (member != null) {
            session.setAttribute("membername", (String)member.getUsername());
            model.addAttribute("membernm", (String)member.getUsername());
            model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
         } else {
            session.setAttribute("membername","");
            model.addAttribute("membernm", "");
            model.addAttribute("userarg", "");
         }
         return "foodqna";
      }
   
   @RequestMapping(value = "notice.do", method = RequestMethod.GET)
      public String notice(Model model,HttpSession session) throws Exception {
         MemberDto member = (MemberDto) session.getAttribute("member");
         
         if(member==null) {
            model.addAttribute("admin", false);
         }
         else if(member.getEmail().equals("root@root.com")) {
            model.addAttribute("admin", true);
         }
         else {
            model.addAttribute("admin", false);
         }
         
         return "notice";
    }
   
   @RequestMapping(value = "Foodadd.do", method = {RequestMethod.GET,RequestMethod.POST})
   public String Foodadd(Model model, int code,String name,String supportpereat,double calory,double carbo,double protein,double fat,double sugar,double natrium,double chole,double fattyacid,double transfat,String maker,String material,String img, HttpSession session) throws Exception {
      if (code > 0) {
         FoodDto food=new FoodDto(code, name, Double.parseDouble(supportpereat), calory, carbo, protein, fat, sugar, natrium, chole, fattyacid, transfat, maker, material, img);
         iFoodService.addFood(food);
         MemberDto member = (MemberDto) session.getAttribute("member");
         model.addAttribute("foods", iFoodService.getFoodlist());
         if (member != null) {
            model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
         } else {
            model.addAttribute("userarg", "");
         }
         return "foodlist";
      } else {
          model.addAttribute("msg", "추가 중 에러가 발생했습니다. 다시 시도해주세요.");
         model.addAttribute("location", "./foodlist.do");            
         return "alert";
      }
   }
   
   
   @RequestMapping(value = "addFood.do", method = RequestMethod.GET)
   public String addFood(Model model, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("foods", iFoodService.getFoodlist());
      model.addAttribute("member", session.getAttribute("member"));
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "foodadd";
   }
   
   @RequestMapping(value = "deleteFood.do", method = {RequestMethod.GET,RequestMethod.POST})
   public String deleteFood(Model model, int code, HttpSession session) throws Exception {
      if (code > 0) {
         iFoodService.deleteFood(code);
         MemberDto member = (MemberDto) session.getAttribute("member");
         model.addAttribute("foods", iFoodService.getFoodlist());
         if (member != null) {
            model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
         } else {
            model.addAttribute("userarg", "");
         }
         return "foodlist";
      } else {
         model.addAttribute("msg", "삭제 중 에러가 발생했습니다. 다시 시도해주세요.");
         model.addAttribute("location", "./foodlist.do");            
         return "alert";
      }
   }
   
   @RequestMapping(value = "updateFood.do", method = RequestMethod.GET)
   public String updateFood(Model model, int code, String name, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("food", iFoodService.searchFoodByCode(code));
      model.addAttribute("allergies", iAllergiesService.getAllergieslist());
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "foodupdate";
   }

   @RequestMapping(value = "Foodupdate.do",  method = {RequestMethod.GET,RequestMethod.POST})
   public String Foodupdate(Model model,int code,String name,String supportpereat,double calory,double carbo,double protein,double fat,double sugar,double natrium,double chole,double fattyacid,double transfat,String maker,String material,String img, HttpSession session) throws Exception {
      if (code > 0) {
         FoodDto food=new FoodDto(code, name, Double.parseDouble(supportpereat), calory, carbo, protein, fat, sugar, natrium, chole, fattyacid, transfat, maker, material, img);
         iFoodService.updateFood(food);
      }
         MemberDto member = (MemberDto) session.getAttribute("member");
         model.addAttribute("food", iFoodService.searchFoodByCode(code));
         model.addAttribute("allergies", iAllergiesService.getAllergieslist());
         if (member != null) {
            model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
         } else {
            model.addAttribute("userarg", "");
         }
         return "foodview";
   }
   
   
   @RequestMapping(value = "fooddiary.do",  method = {RequestMethod.GET,RequestMethod.POST})
   public String fooddiary(Model model) throws Exception {

         return "fooddiary";
   }
}