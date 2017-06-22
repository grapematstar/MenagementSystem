package gyum_02.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SocketController {
     
    @RequestMapping("/chat.do")
    public String viewChattingPage(HttpServletRequest req) {
    	if((req.getSession().getServletContext().getAttribute("chat"))==null){    		
    		req.getSession().getServletContext().setAttribute("chat", "now");
    	}else{
    		return "mypage/my_qna/my_qna_msg";
    	}
    	
        return "mypage/my_qna/my_qna_chat";
    }
    
    @RequestMapping("/masterchat.do")
    public ModelAndView viewChattingPage_master(HttpSession session) {

    	String user = (String)session.getAttribute("usergrade");
    	if(user==null||!(user.equals("master"))){
    		ModelAndView login = new ModelAndView("mypage/my_member/my_memberLogin");
    		return login;
    	}
    	
        ModelAndView mav = new ModelAndView("mypage/my_qna/my_qna_chat");
        mav.addObject("master", "master");
        return mav;
    }
    
    @RequestMapping("/removechat.do")
    public ModelAndView viewChattingPage_remove(HttpServletRequest req, HttpSession session) {
    	
    	String user = (String)session.getAttribute("usergrade");
    	if(user==null||!(user.equals("master"))){
    		ModelAndView login = new ModelAndView("mypage/my_member/my_memberLogin");
    		return login;
    	}
    	
    	req.getSession().getServletContext().removeAttribute("chat");
    	ModelAndView mav = new ModelAndView("mypage/my_qna/my_qna_chat");
        mav.addObject("master", "master");
        return mav;
    }
}
