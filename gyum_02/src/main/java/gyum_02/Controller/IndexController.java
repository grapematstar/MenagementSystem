package gyum_02.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.my_student.model.my_stu_LetterDAO;
import gyum_02.sugang.model.SugangDAO;
import gyum_02.sugang.model.SugangDTO;
import gyum_02.my_student.model.*;

@Controller
public class IndexController {
	
	@Autowired
	private SugangDAO sugangDao;
	
	@Autowired
	private my_stu_LetterDAO my_stu_letterDao;
	
	@Autowired
	private my_stu_ClassStudentDAO my_stu_classstudentDao;
	
	@RequestMapping("/index.do")
	public ModelAndView Index(HttpSession sgsession,
			@RequestParam(value="cp",defaultValue="1")int cp){
		
		ModelAndView mav = new ModelAndView();
		
		if(sgsession.getAttribute("idx")==null){
			mav.setViewName("mypage/my_member/my_memberLogin");
			return mav;
		}
		
		List<my_stu_LetterDTO> letterlist = my_stu_letterDao.getMyLetterIndex((String)sgsession.getAttribute("id"));
		
		int totalCnt = sugangDao.classTotalCnt();
		int listSize = 5;
		int pageSize = 5;
		List<SugangDTO> sgClassList = sugangDao.sugangList(cp, listSize);
		Map<String, Object> searchMap = new HashMap<String, Object>();
		String pageStr = gyum_02.paging.Paging_PageModule.searchPaging("../gyum_02/index.do", totalCnt, listSize, pageSize, cp, searchMap);
		mav.addObject("sgClassList", sgClassList);
		mav.addObject("letterlist", letterlist);
		mav.setViewName("index");
		return mav;
	}	
	
	@RequestMapping("/my_index.do")
	public ModelAndView my_index(HttpSession session){
		
		String user = (String)session.getAttribute("usergrade");
		ModelAndView mav = new ModelAndView("mypage/my_index");
		if(user==null){
			ModelAndView login = new ModelAndView("mypage/my_member/my_memberLogin");
			return login;
		}
		
		if(user.equals("student")){
			mav.addObject("gopage", "stu_information.do");
		}else if(user.equals("parent")){
			mav.addObject("gopage", "par_information.do");			
		}else if(user.equals("teacher")){
			mav.addObject("gopage", "tea_information.do");
		}else{
			mav.addObject("gopage", "index.do");
		}		
		
		return mav;
	}
	
}