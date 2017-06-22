package gyum_02.cybercampus.Controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.cybercampus.Model.CC_AttendDAO;
import gyum_02.cybercampus.Model.CC_EpilogueDAO;
import gyum_02.cybercampus.Model.CC_EpilogueDTO;

@Controller
public class CC_EpilogueController {

	@Autowired
	private CC_EpilogueDAO cc_EpilogueDAO;
	
	@Autowired
	private CC_AttendDAO cc_AttendDAO;
	
	@RequestMapping(value="/cc_gotoEpilogueClass.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoEpilogueClass(HttpSession session,
			@RequestParam(value="cp",defaultValue="1")int cp){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int class_idx = (Integer)session.getAttribute("class_idx");
//		String usergrade = (String)session.getAttribute("usergrade");
		int totalCnt = cc_AttendDAO.cc_totalCntAttendList(class_idx);
		int pageSize = 5;
		int listSize = 5;
		List<CC_EpilogueDTO> list = cc_EpilogueDAO.cc_gotoEpilogueList(cp,listSize,class_idx);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_writedate(transFormat.format(list.get(i).getC_r_writedate()));
		}
		String pageStr = gyum_02.paging.Paging_PageModule.pageMake("cc_gotoEpilogueClass.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("/cybercampus/cc_class/cc_09.epilogue/cc_epilogueClass_main");
		return mav;
	}
	@RequestMapping(value="/cc_submitEpilogueWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitEpilogueWrite(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@ModelAttribute("dto")CC_EpilogueDTO dto,HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		dto.setC_r_writer((String)session.getAttribute("id"));
		dto.setClass_idx((Integer)session.getAttribute("class_idx"));
		cc_EpilogueDAO.cc_submitEpilogueWrite(dto);
		ModelAndView mav=new ModelAndView("yongJson");
		return mav;
	}
	@RequestMapping(value="/cc_submitEpilogueUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_submitEpilogueUpdate(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@ModelAttribute("dto")CC_EpilogueDTO dto,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		cc_EpilogueDAO.cc_submitEpilogueUpdate(dto);
		ModelAndView mav=cc_gotoEpilogueClass(session,cp);
		return mav;
	}
	@RequestMapping(value="/cc_submitEpilogueDelete.do",method=RequestMethod.POST)
	public ModelAndView cc_submitEpilogueDelete(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="c_r_idx",defaultValue="0")int c_r_idx,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		cc_EpilogueDAO.cc_submitEpilogueDelete(c_r_idx);
		ModelAndView mav=cc_gotoEpilogueClass(session,cp);
		return mav;
	}
}
