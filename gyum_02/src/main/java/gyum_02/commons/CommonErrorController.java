package gyum_02.commons;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/error")
public class CommonErrorController {
	
	@RequestMapping(value="/throwable.do")
	public String Throwable(HttpServletRequest request){
		return "/errorPage/commonErrorPage";
	}
	@RequestMapping(value="/exception.do")
	public String exception(HttpServletRequest request){
		return "/errorPage/commonErrorPage";
	}
	@RequestMapping(value="/400.do")
	public String e400(HttpServletRequest request){
		return "/errorPage/commonErrorPage";
	}
	@RequestMapping(value="/403.do")
	public String e403(HttpServletRequest request){
		return "/errorPage/commonErrorPage";
	}
	@RequestMapping(value="/404.do")
	public String e404(HttpServletRequest request){
		return "/errorPage/commonErrorPage";
	}
	@RequestMapping(value="/405.do")
	public String e405(HttpServletRequest request){
		return "/errorPage/commonErrorPage";
	}
	@RequestMapping(value="/500.do")
	public String e500(HttpServletRequest request){
		return "/errorPage/commonErrorPage";
	}
	@RequestMapping(value="/503.do")
	public String e503(HttpServletRequest request){
		return "/errorPage/commonErrorPage";
	}
}
