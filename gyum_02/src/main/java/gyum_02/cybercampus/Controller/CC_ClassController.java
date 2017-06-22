package gyum_02.cybercampus.Controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.cybercampus.Model.CC_AttendDAO;
import gyum_02.cybercampus.Model.CC_AttendDTO;

@Controller
public class CC_ClassController {
	
	@Autowired
	private CC_AttendDAO cc_AttendDAO;
	
	@RequestMapping(value="cc_gotoClass.do",method=RequestMethod.GET)
	public String cc_gotoClass(){
		return "/cybercampus/cc_class/cc_01.notice/cc_notice_list";
	}
	
	@RequestMapping(value="/cc_gotoMyClassMate.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoMyClassMate(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int class_idx=(Integer)session.getAttribute("class_idx");
		int listSize=10;
		int pageSize=5;
		int totalCnt=cc_AttendDAO.cc_totalCntMyClassMate(class_idx,listSize,cp);
		List<CC_AttendDTO> list=cc_AttendDAO.cc_gotoMyClassMate(class_idx);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_stuindate(transFormat.format(list.get(i).getStu_in_date()));
		}
		String pageStr=gyum_02.paging.Paging_PageModule.pageMake("cc_gotoMyClassMate.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_classmate");
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		return mav;
	}
}
