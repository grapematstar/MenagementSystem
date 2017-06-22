package gyum_02.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SugangIndexController {

	@RequestMapping("/sg_payList.do")
	public ModelAndView sgpayList(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sugang/sg_payList");
		return mav;
	}
}
