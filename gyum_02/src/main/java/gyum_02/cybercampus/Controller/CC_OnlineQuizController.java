package gyum_02.cybercampus.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CC_OnlineQuizController {
	
	@RequestMapping(value="/cc_gotoOnlineQuizClass.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoOnlineQuizClass(){
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_07.onlineQuiz/cc_onlineQuizClass_main");
		return mav;
	}
	@RequestMapping(value="/cc_gotoOnlineQuizWrite.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoOnlineQuizWrite(){
		ModelAndView mav=new ModelAndView("/cybercampus/cc_03.onlineQuiz/cc_onlineQuizQuestion_write");
		return mav;
	}
	public ModelAndView cc_gotoOnlineQuizUpdate(){
		ModelAndView mav=new ModelAndView("/cybercampus/cc_0f3.onlineQuiz/cc_onlineQuizQuestion_update");
		return mav;
	}
}
