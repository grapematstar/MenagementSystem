package gyum_02.cybercampus.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.cybercampus.Model.CC_AttendDAO;
import gyum_02.cybercampus.Model.CC_AttendDTO;


@Controller
public class CC_AttendController {
	
	@Autowired
	private CC_AttendDAO cc_AttendDAO;
	
	@RequestMapping(value="/cc_gotoAttendClass.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoAttendMain(
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
		String usergrade=(String)session.getAttribute("usergrade");
		int totalCnt=cc_AttendDAO.cc_totalCntAttendList(class_idx);
		totalCnt=totalCnt==0?1:totalCnt;
		int pageSize=5;
		int listSize=10;
		String pageStr = gyum_02.paging.Paging_PageModule.pageMake("cc_gotoAttendClass.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		if(usergrade.equals("teacher")||usergrade.equals("master")){
			List<CC_AttendDTO> list=cc_AttendDAO.cc_gotoTeacherAttendMain(cp,listSize,class_idx); //not yet correct sql:class_idx
			String subject_name=cc_AttendDAO.cc_callSubjectName(class_idx);
			mav.setViewName("/cybercampus/cc_class/cc_03.attend/cc_teacher/cc_attendScore_content");
			mav.addObject("list", list);
			mav.addObject("subject_name", subject_name);
			mav.addObject("pageStr", pageStr);
		}else if(usergrade.equals("student")){
			
			mav.setViewName("/cybercampus/cc_class/cc_03.attend/cc_student/cc_attend_content");
		}
		return mav;
	}
	
	@RequestMapping(value="/cc_callAttendClass.do",method=RequestMethod.GET)
	public ModelAndView cc_callAttend(HttpSession session){
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_03.attend/cc_student/cc_callAttend");
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoSingleAttendContentList.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoSingleAttendContentList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="stu_idx",defaultValue="0")int stu_idx,
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
		
		Map<String,Object> searchMap=new HashMap<String,Object>();
		searchMap.put("class_idx", class_idx);
		searchMap.put("stu_idx", stu_idx);
		int totalCnt=cc_AttendDAO.cc_totalCntSingleAttendContentList(searchMap);
		int listSize=5;
		int pageSize=5;
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		searchMap.put("startnum", startnum);
		searchMap.put("endnum", endnum);
		List<CC_AttendDTO> list=cc_AttendDAO.cc_gotoSingleAttendContentList(searchMap);
		for(int i=0;i<list.size();i++){
			String attenddate=String.valueOf(list.get(i).getAttend_date());
			String year=attenddate.substring(0, 4);
			String month=attenddate.substring(4, 6);
			String day=attenddate.substring(6, 8);
			list.get(i).setString_attenddate(year+"년 "+month+"월 "+day+"일");
		}
		searchMap.remove("startnum");
		searchMap.remove("endnum");
		searchMap.remove("stu_idx");
		searchMap.remove("class_idx");
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPagingForAjax("cc_callAttendPaging", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_03.attend/cc_student/cc_singleAttend_content");
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoSingleAttendContentListAjax.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoSingleAttendContentListAjax(
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
		int stu_idx=(Integer)session.getAttribute("idx");
		Map<String,Object> searchMap=new HashMap<String,Object>();
		searchMap.put("class_idx", class_idx);
		searchMap.put("stu_idx", stu_idx);
		int totalCnt=cc_AttendDAO.cc_totalCntSingleAttendContentList(searchMap);
		int listSize=5;
		int pageSize=5;
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		searchMap.put("startnum", startnum);
		searchMap.put("endnum", endnum);
		List<CC_AttendDTO> list=cc_AttendDAO.cc_gotoSingleAttendContentList(searchMap);
		for(int i=0;i<list.size();i++){
			String attenddate=String.valueOf(list.get(i).getAttend_date());
			String year=attenddate.substring(0, 4);
			String month=attenddate.substring(4, 6);
			String day=attenddate.substring(6, 8);
			list.get(i).setString_attenddate(year+"년 "+month+"월 "+day+"일");
		}
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPagingForAjax("cc_callAttendPaging", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_03.attend/cc_student/cc_singleAttend_content");
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoSingleScoreContentList.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoSingleScoreContentList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="stu_idx",defaultValue="0")int stu_idx,
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
		int totalCnt=cc_AttendDAO.cc_totalCntScoreList(class_idx, stu_idx);
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=5;
		int pageSize=5;
		List<CC_AttendDTO> list=cc_AttendDAO.cc_gotoScoreContentList(cp, listSize, class_idx, stu_idx);
		for(int i=0;i<list.size();i++){
			String attenddate=String.valueOf(list.get(i).getS_s_date());
			String year=attenddate.substring(0, 4);
			String month=attenddate.substring(4, 6);
			String day=attenddate.substring(6, 8);
			list.get(i).setString_ssdate(year+"년 "+month+"월 "+day+"일");
		}
		Map<String,Object> searchMap=new HashMap<String,Object>();
		searchMap.put("stu_idx", stu_idx);
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_gotoSingleScoreContentList.do", totalCnt, listSize, pageSize, cp, searchMap);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_03.attend/cc_teacher/cc_score_main");
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoAllScoreWrite.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoAllScoreWrite(HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int class_idx=(Integer)session.getAttribute("class_idx");
		HashMap<String,Object> map=cc_AttendDAO.cc_gotoAllScoreWrite(class_idx);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_03.attend/cc_teacher/cc_scoreAll_write","HashMap",map);
		mav.addObject("class_idx", class_idx);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitAllScoreWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitAllScoreWrite(
			@ModelAttribute(value="dto")CC_AttendDTO dto,
			@RequestParam(value="writeyear",defaultValue="2017")int writeyear,
			@RequestParam(value="writemonth",defaultValue="6")int writemonth,
			@RequestParam(value="writeday",defaultValue="27")int writeday,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		
		int writedate=writeyear*10000+writemonth*100+writeday;
		
		int class_idx=(Integer)session.getAttribute("class_idx");
		List<CC_AttendDTO> dtolist=dto.getList();
		for(int i=0;i<dto.getList().size();i++){
			dtolist.get(i).setS_s_date(writedate);
			dtolist.get(i).setClub_idx(class_idx);
		}
		int result=cc_AttendDAO.cc_submitAllScoreWrite(dtolist, class_idx);
		String locationOrder="cc_gotoAttendClass.do",msg=result>0?"성적 등록이 완료되었습니다.":"성적 등록에 실패했습니다.";
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
		mav.addObject("locationOrder", locationOrder);
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoAllAttendWrite.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoAllAttendWrite(HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int class_idx=(Integer)session.getAttribute("class_idx");
		SimpleDateFormat today=new SimpleDateFormat("yyyy-MM-dd");
		String date=today.format(new Date());
		List<CC_AttendDTO> list=cc_AttendDAO.cc_gotoAllAttendWrite(class_idx);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_03.attend/cc_teacher/cc_attendAll_write","list",list);
		mav.addObject("date", date);
		return mav;
	}

	@RequestMapping(value="/cc_submitOneAttendWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitOneAttendWrite(
			@ModelAttribute("dto") CC_AttendDTO dto,
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
		dto.setClass_idx(class_idx);
		if(dto.getAttend_note()==null)dto.setAttend_note("");
		int count=cc_AttendDAO.cc_countOneAttendWrite(dto);
		if(count>0){
			cc_AttendDAO.cc_submitOneAttendUpdate(dto);
		}else{
			cc_AttendDAO.cc_submitOneAttendWrite(dto);
		}
		ModelAndView mav=cc_gotoDateAttendWrite(dto.getAttend_date(), session);
		return mav;
	}
	@RequestMapping(value="/cc_submitAllAttendWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitAllAttendWrite(
			@RequestParam(value="a_a_idx",defaultValue="0")int a_a_idx,
			@RequestParam(value="attend_date",defaultValue="20170627")int attend_date,
			@RequestParam(value="stu_idx[]",defaultValue="0")List<Integer> stu_idxList,
			@RequestParam(value="attend_note[]",defaultValue="")List<String> attend_noteList,
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
		for(int i=0;i<stu_idxList.size();i++){
			CC_AttendDTO dto=new CC_AttendDTO();
			dto.setA_a_idx(a_a_idx);
			dto.setStu_idx(stu_idxList.get(i));
			dto.setClass_idx(class_idx);
			dto.setAttend_date(attend_date);
			dto.setAttend_note(attend_noteList.get(i));
			System.out.println(attend_noteList.get(i));
			int count=cc_AttendDAO.cc_countOneAttendWrite(dto);
			if(count>0){
				cc_AttendDAO.cc_submitOneAttendUpdate(dto);
			}else{
				cc_AttendDAO.cc_submitOneAttendWrite(dto);
			}
		}
		ModelAndView mav=cc_gotoDateAttendWrite(attend_date, session);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitOneAttendNoteUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_submitOneAttendNoteUpdate(
			@RequestParam(value="stu_idx",defaultValue="0")int stu_idx,
			@RequestParam(value="attend_date",defaultValue="20170627")int attend_date,
			@RequestParam(value="attend_note",defaultValue="")String attend_note,
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
		CC_AttendDTO dto=new CC_AttendDTO();
		dto.setClass_idx(class_idx);
		dto.setStu_idx(stu_idx);
		dto.setAttend_date(attend_date);
		dto.setAttend_note(attend_note);
		int a_a_idx=cc_AttendDAO.cc_countOneAttendNoteUpdate(dto);
		ModelAndView mav=new ModelAndView();
		if(a_a_idx>0){
			cc_AttendDAO.cc_submitOneAttendNoteUpdate(class_idx,stu_idx,attend_note,attend_date);
		}else{
			mav=cc_gotoDateAttendWrite(attend_date, session);
			mav.addObject("msg","입력되지 않았습니다.");
			return mav;
		}
		mav=cc_gotoDateAttendWrite(attend_date, session);
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoDateAttendWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_gotoDateAttendWrite(
			@RequestParam(value="attend_date",defaultValue="20170627")int attend_date,
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
		List<CC_AttendDTO> list=cc_AttendDAO.cc_gotoDateAttendWrite(class_idx, attend_date);
		StringBuffer dateTemp=new StringBuffer(String.valueOf(attend_date));
		dateTemp.insert(4, "-");
		dateTemp.insert(7, "-");
		String chooseDay=String.valueOf(dateTemp);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_03.attend/cc_teacher/cc_attendAll_write","list",list);
		mav.addObject("date", chooseDay);
		return mav;
	}
	@RequestMapping(value="/cc_submitSingleStudentScoreUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_submitSingleStudentScoreUpdate(
			@ModelAttribute("dto")CC_AttendDTO dto){
		String stu_name=cc_AttendDAO.cc_submitSingleStudentScoreUpdate(dto);
		ModelAndView mav=new ModelAndView("yongJson");
		mav.addObject("stu_name", stu_name);
		return mav;
	}
}
