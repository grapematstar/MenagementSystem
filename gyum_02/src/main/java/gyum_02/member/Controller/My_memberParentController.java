package gyum_02.member.Controller;

import java.util.Date;
import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.member.model.*;

@Controller
public class My_memberParentController {
   
   @Autowired
   private My_memberStudentDAO My_memberDao1;
   @Autowired
   private My_memberParentDAO My_memberDao2;
   @Autowired
   private My_memberTeacherDAO My_memberDao3;
   @Autowired
   private My_memberLoyalDAO My_memberDao4;
   
   @RequestMapping("/my_memberparent.do")
   public String parentWriteForm(){
      return "mypage/my_member/my_memberParent";
   }

   @RequestMapping("/parentWrite.do")
   public ModelAndView parentWrite(My_memberParentDTO dto){
      
      String par_id = dto.getPar_id();
      ModelAndView mav = new ModelAndView();
      
      int idCheck = My_memberDao3.idCheck(par_id);
      if(!(par_id==null||par_id.equals(""))){
         if(idCheck==0){
            idCheck=My_memberDao1.idCheck(par_id);
            if(idCheck==0) {
               idCheck=My_memberDao2.idCheck(par_id);
               if(idCheck==0) {
                  mav.addObject("par_id", par_id);
                  int result = My_memberDao2.parentWrite(dto);
                  String msg = result>0?"회원가입 성공":"회원가입 실패";
                  
                  mav.setViewName("/mypage/my_member/my_memberMsg");
                  mav.addObject("msg",msg);
                  return mav;
               }
            }
         }
         mav.setViewName("/mypage/my_member/my_joinMsg");
         mav.addObject("msg", "회원 가입 실패");
         mav.addObject("locationOrder", "my_memberparent.do");
         return mav;
      }
      return mav;
   }
   
   @RequestMapping("/idCheck2.do")
   public ModelAndView idCheck2(My_memberParentDTO dto){
      String par_id = dto.getPar_id();
      ModelAndView mav = new ModelAndView();
      
      int idCheck = My_memberDao2.idCheck(par_id);
      if(!(par_id==null||par_id.equals(""))){
         if(idCheck==0){
            idCheck=My_memberDao1.idCheck(par_id);
            if(idCheck==0) {
               idCheck=My_memberDao3.idCheck(par_id);
               if(idCheck==0) {
                  mav.addObject("par_id", par_id);
                  mav.addObject("msg", "사용 가능한 아이디입니다.");
                  mav.setViewName("yongJson");
                  return mav;
               }
            }
         }
         mav.addObject("par_id", "");
         mav.addObject("msg", "사용 불가능한 아이디입니다. 다시 입력해 주세요.");
         mav.setViewName("yongJson");
         
      }
      return mav;
   }
   @RequestMapping("/loginCheck.do")
   public ModelAndView loginCheck(HttpServletRequest req,HttpServletResponse resp,
         @RequestParam(value="ckb",defaultValue="off")String ckb,
         @RequestParam(value="user_id")String user_id,
         @RequestParam(value="user_pwd")String user_pwd,HttpSession session){
      System.out.println(user_id +"//"+user_pwd);
      String id = "";
      ModelAndView mav = new ModelAndView();
      
      String delete = "탈퇴탈퇴탈퇴";
      int check=My_memberDao2.login(user_id, user_pwd,session);
      
      if(check==0){
         check=My_memberDao1.login(user_id, user_pwd,session);
         if(check==0){
            check=My_memberDao4.login(user_id, user_pwd,session);
            if(check==0){
               check= My_memberDao3.login(user_id, user_pwd,session);
               String msg = "아이디 혹시 비번이 틀렸습니다. \\n다시 입력해 주세요.";
               mav.addObject("msg",msg);
               mav.setViewName("mypage/my_member/my_loginMsg");
            }
         }
      }
      if(check==1){
    	  String msg = "아이디 혹시 비번이 틀렸습니다. \\n다시 입력해 주세요.";
          mav.addObject("msg",msg);
          mav.setViewName("mypage/my_member/my_loginMsg");
      }
      if(check==2){      
         My_memberParentDTO dto2 = My_memberDao2.par_in_out_date(user_id);
         if(dto2==null || dto2.getPar_name().equals(delete)){
            String msg = "회원 탈퇴한 아이디입니다. \\n다른 아이디로 로그인 해주세요.";
            mav.addObject("msg",msg);
            mav.setViewName("mypage/my_member/my_deleteMsg");
            My_memberStudentDTO dto1 = My_memberDao1.in_out_date_check(user_id);
            if(dto1==null||dto1.getStu_in_date().compareTo(dto1.getStu_out_date())!=0){
               msg = "회원 탈퇴한 아이디입니다. \\n다른 아이디로 로그인 해주세요.";
               mav.addObject("msg",msg);
               mav.setViewName("mypage/my_member/my_deleteMsg");
               My_memberStudentDTO dto4 = My_memberDao1.mas_check(user_id);
               if(dto4==null||!(dto4.getMas_id().equals("master"))){
            	   msg = "회원 탈퇴한 아이디입니다. \\n다른 아이디로 로그인 해주세요.";
                   mav.addObject("msg",msg);
                   mav.setViewName("mypage/my_member/my_deleteMsg");
               }else{
            	   mav.setViewName("index");
               }
            }else{
               mav.setViewName("index");
            }
         }else{
            mav.setViewName("index");
         } 
      }
      if(ckb.equals("on")){
         Cookie ck = new Cookie("saveid",user_id);
         ck.setMaxAge(60*60*60);
         resp.addCookie(ck);
      }else{
    	  Cookie ck = new Cookie("saveid",id);
    	  ck.setMaxAge(0);
    	  resp.addCookie(ck);
      }
      return mav;
   }

   @RequestMapping("/logout.do")
   public ModelAndView logout(HttpServletRequest req){
      ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();
      session.removeAttribute("id");
      session.removeAttribute("idx");
      session.removeAttribute("name");
      session.removeAttribute("usergrade");
      
      mav.setViewName("mypage/my_member/my_memberLogin");
      return mav;
   }
   @RequestMapping("/par_information.do")
   public ModelAndView par_infoForm(HttpSession session){
      String ids=(String)session.getAttribute("id");
      My_memberParentDTO dto = My_memberDao2.getparInfo(ids);
      ModelAndView mav = new ModelAndView();
      mav.addObject("dto",dto);
      mav.setViewName("mypage/my_information/my_par_info");
      return mav;
   }
   
   @RequestMapping("/par_Update.do")
   public ModelAndView par_Update(My_memberParentDTO dto){
      int result = My_memberDao2.par_Update(dto);
      String msg = result>0?"회원 수정 성공":"회원 수정 실패";
      ModelAndView mav = new ModelAndView("mypage/my_information/my_infoMsg","msg",msg);
      return mav;
   }
   
   @RequestMapping("/par_infoDel.do")
   public ModelAndView par_infoDel(String id,HttpSession session){
      String ids=(String)session.getAttribute("id");
      My_memberParentDTO dto = My_memberDao2.par_InfoDel(ids);
      ModelAndView mav = new ModelAndView();
      mav.addObject("dto",dto);
      mav.setViewName("mypage/my_information/my_par_delete");
      return mav;
   }
   
   @RequestMapping("/par_Delete.do")
   public ModelAndView par_Delete(HttpServletRequest req,HttpSession session,String par_pwd){
      String par_id = (String)session.getAttribute("id");
      int result = My_memberDao2.par_Delete(par_id,par_pwd);
      String msg = result>0?"회원 삭제 성공":"회원 삭제 실패";
      ModelAndView mav = new ModelAndView("mypage/my_information/my_infoMsg","msg",msg);
      session = req.getSession();
      session.removeAttribute("id");
      session.removeAttribute("idx");
      session.removeAttribute("name");
      session.removeAttribute("usergrade");
      return mav;
   }
   
   @RequestMapping("password_check_form.do")
   public String password_check_form(){
      return "mypage/my_member/my_memberPWCheck";
   }
}