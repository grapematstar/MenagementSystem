package gyum_02.masterpage.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Mp_indexController {
	public Mp_indexController() {
		// TODO Auto-generated constructor stub
	}
	//관리자(성윤)
	@RequestMapping("/mp_index.do")
	public ModelAndView mp_Index(HttpSession session){
		String id=(String)session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		System.out.println(id);
		if(id==null || id.equals("") ){
			mav.addObject("msg","관리자로 로그인바람.");
			mav.setViewName("masterpage/mp_member/mp_member_msg_warning");
		}else if(id=="master" || id.equals("master")){
			mav.setViewName("masterpage/mp_index");
		}else{
			mav.addObject("msg","관리자만 접근가능합니다.");
			mav.setViewName("masterpage/mp_member/mp_member_msg_warning");
		}
		return mav;
	}

}
