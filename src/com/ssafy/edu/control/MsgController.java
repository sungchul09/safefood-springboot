package com.ssafy.edu.control;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.edu.dto.MemberDto;
import com.ssafy.edu.dto.MsgDto;
import com.ssafy.edu.service.IAllergiesService;
import com.ssafy.edu.service.IMAllergiesService;
import com.ssafy.edu.service.IMemberService;
import com.ssafy.edu.service.IMsgService;

@Controller
public class MsgController {

   @Autowired
   IMsgService imsgService;   

   @Autowired
   IAllergiesService iAllergiesService;

   @Autowired
   IMAllergiesService iMAllergiesService;

   @Autowired
   IMemberService imemberservice;

   @RequestMapping(value = "msglist.do", method = RequestMethod.GET)
   public String msglist(Model model, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("msgs", imsgService.getMsglist());
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "msglistreceive";
   }
   @RequestMapping(value = "msglistsend.do", method = RequestMethod.GET)
   public String msglistsend(Model model, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("msgs", imsgService.searchMsgBySend(member.getEmail()));
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "msglistsend";
   }
   @RequestMapping(value = "msglistreceive.do", method = RequestMethod.GET)
   public String msglistreceive(Model model, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("msgs", imsgService.searchMsgByReceive(member.getEmail()));
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "msglistreceive";
   }

   @RequestMapping(value = "msgview.do", method = RequestMethod.GET)
   public String msgview(Model model, int msg_code, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("msg", imsgService.searchMsgByCode(msg_code));
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "msgview";
   }

   @RequestMapping(value = "Msgadd.do", method = {RequestMethod.GET,RequestMethod.POST})
   public String Msgadd(Model model,  String receive_email , String contents, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      if(!receive_email.equals("")&&!contents.equals("")) {
         if(imemberservice.findMemberByEmail(receive_email)!=null) {
            Date d=new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            MsgDto msg=new MsgDto(member.getEmail(), receive_email, contents, sdf.format(d));
            System.out.println(msg.toString());
            imsgService.addMsg(msg);
         }else {
            model.addAttribute("msg", "존재하지않는 이메일입니다. 수신인 이메일을 확인해주세요:)");
            model.addAttribute("location", "./addMsg.do");            
            return "alert";
         }
      }else {
         model.addAttribute("msg", "아이디나 내용을 입력해주세요ㅠ.ㅠ");
         model.addAttribute("location", "./addMsg.do");            
         return "alert";
      }
      model.addAttribute("msgs", imsgService.searchMsgBySend(member.getEmail()));
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "msglistsend";


   }

   @RequestMapping(value = "addMsg.do", method = RequestMethod.GET)
   public String addMsg(Model model, HttpSession session) throws Exception {
      MemberDto member = (MemberDto) session.getAttribute("member");
      model.addAttribute("msgs", imsgService.getMsglist());
      model.addAttribute("member", session.getAttribute("member"));
      if (member != null) {
         model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
      } else {
         model.addAttribute("userarg", "");
      }
      return "msgadd";
   }

   @RequestMapping(value = "deleteMsg.do", method = {RequestMethod.GET,RequestMethod.POST})
   public String deleteMsg(Model model, int msg_code, HttpSession session) throws Exception {
      if (msg_code > 0) {
         imsgService.deleteMsg(msg_code);
         MemberDto member = (MemberDto) session.getAttribute("member");
         model.addAttribute("msgs", imsgService.searchMsgByReceive(member.getEmail()));
         if (member != null) {
            model.addAttribute("userarg", iMAllergiesService.getIngredientByEmail(member.getEmail()));
         } else {
            model.addAttribute("userarg", "");
         }
         return "msglistreceive";
      } else {
         model.addAttribute("msg", "삭제 중 오류가 발생했습니다. 관리자에게 문의해주세요ㅠ.ㅠ");
         model.addAttribute("location", "./msglistreceive.do");            
         return "alert";
         
      }
   }

}