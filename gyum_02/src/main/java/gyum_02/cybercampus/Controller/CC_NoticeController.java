package gyum_02.cybercampus.Controller;


import java.text.SimpleDateFormat;
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

import gyum_02.cybercampus.Model.CC_ClassDTO;
import gyum_02.cybercampus.Model.CC_FreeBBSDTO;
import gyum_02.cybercampus.Model.CC_NoticeDAO;
import gyum_02.cybercampus.Model.CC_NoticeDTO;
import gyum_02.cybercampus.Model.CC_RepositoryDTO;
import gyum_02.cybercampus.Model.CC_TeacherNoticeDTO;

@Controller
public class CC_NoticeController {
	
	@Autowired
	private CC_NoticeDAO cc_NoticeDAO;
	
	@RequestMapping(value="/cc_gotoNoticeList.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoClass(
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
		int club_idx=(Integer)session.getAttribute("class_idx");
		String usergrade=(String)session.getAttribute("usergrade");
		int totalCnt=cc_NoticeDAO.cc_totalCntNoticeList(club_idx);
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=5;
		int pageSize=5;
		List<CC_NoticeDTO> list=cc_NoticeDAO.cc_gotoNoticeList(club_idx,cp,listSize);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_writedate(transFormat.format(list.get(i).getC_n_writedate()));
		}
		Map<String,Object> searchMap=new HashMap<String,Object>();
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_gotoNoticeList.do", totalCnt, listSize, pageSize, cp, searchMap);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_01.notice/cc_notice_list","list",list);
		mav.addObject("pageStr", pageStr);
		if(!(usergrade==null||usergrade.equals(""))){
			if(usergrade.equals("teacher")){
				mav.addObject("writeButton","<input type=\"button\" class=\"btn btn-default\" value=\"글쓰기\" onclick=\"location.href='cc_gotoNoticeWrite.do'\">");
			}
		}
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoNoticeWrite.do",method=RequestMethod.GET)
	public String cc_gotoNoticeWrite(){
		return "/cybercampus/cc_class/cc_01.notice/cc_notice_write";
	}
	
	@RequestMapping(value="/cc_submitNoticeWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitNoticeWrite(
			@ModelAttribute("dto")CC_NoticeDTO dto,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int club_idx=(Integer)session.getAttribute("class_idx");
		dto.setClub_idx(club_idx);
		dto.setC_n_writer((String)session.getAttribute("id"));
		int result=cc_NoticeDAO.cc_submitNoticeWrite(dto);
		String msg=result>0?"공지사항이 등록되었습니다.":"공지사항 등록에 실패했습니다.";
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg", msg);
		mav.addObject("locationOrder","cc_gotoNoticeList.do");
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoNoticeContent.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoNoticeContent(
			@RequestParam(value="c_n_idx",defaultValue="0")int c_n_idx,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		String usergrade=(String)session.getAttribute("usergrade");
		CC_NoticeDTO dto=cc_NoticeDAO.cc_gotoNoticeContent(c_n_idx);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_01.notice/cc_notice_content","dto",dto);
		if(!(usergrade==null||usergrade.equals(""))){
			if(usergrade.equals("teacher")){
				mav.addObject("teacherModify", "<input type=\"button\" class=\"btn btn-default\" value=\"수정\" onclick=\"location.href='cc_gotoNoticeUpdate.do?c_n_idx="+c_n_idx+"'\">");
				mav.addObject("teacherDelete", "<input type=\"button\" class=\"btn btn-default\" value=\"삭제\" onclick=\"location.href='cc_submitNoticeDelte.do?c_n_idx="+c_n_idx+"'\">");
			}
		}
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoNoticeUpdate.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoNoticeUpdate(
			@RequestParam(value="c_n_idx",defaultValue="0")int c_n_idx){
		CC_NoticeDTO dto=cc_NoticeDAO.cc_gotoNoticeContent(c_n_idx);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_01.notice/cc_notice_update","dto",dto);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitNoticeUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_submitNoticeUpdate(@ModelAttribute("dto")CC_NoticeDTO dto){
		int result=cc_NoticeDAO.cc_submitNoticeUpdate(dto);
		String msg=result>0?"공지사항이 수정되었습니다.":"공지사항 수정에 실패했습니다.";
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg", msg);
		mav.addObject("locationOrder","cc_gotoNoticeList.do");
		return mav;
	}
	
	@RequestMapping(value="/cc_submitNoticeDelete.do",method=RequestMethod.GET)
	public ModelAndView cc_submitNoticeDelete(
			@RequestParam(value="c_n_idx",defaultValue="0")int c_n_idx){
		int result=cc_NoticeDAO.cc_submitNoticeDelete(c_n_idx);
		String msg=result>0?"공지사항이 삭제되었습니다.":"공지사항 삭제에 실패했습니다.";
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg", msg);
		mav.addObject("locationOrder","cc_gotoNoticeList.do");
		return mav;
		}
	
	@RequestMapping(value="/cc_searchNoticeForThisUser.do",method=RequestMethod.GET)
	public ModelAndView cc_searchNoticeForThisUser(
			@RequestParam(value="searchHow",defaultValue="")String searchHow,
			@RequestParam(value="searchWhat",defaultValue="")String searchWhat,
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
		Map<String,Object> searchMap=new HashMap<String,Object>();
		searchMap.put("class_idx", class_idx);
		searchMap.put("searchHow", searchHow);
		searchMap.put("searchWhat", searchWhat);
		int totalCnt=cc_NoticeDAO.cc_totalSearchNoticeForThisUser(searchMap);
		int listSize=5;
		int pageSize=5;
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		searchMap.put("startnum", startnum);
		searchMap.put("endnum", endnum);
		List<CC_NoticeDTO> list=cc_NoticeDAO.cc_searchNoticeForThisUser(searchMap);
		searchMap.remove("startnum");
		searchMap.remove("endnum");
		searchMap.remove("class_idx");
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_searchNoticeForThisUser.do", totalCnt, listSize, pageSize, cp, searchMap);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_01.notice/cc_notice_list","list",list);
		mav.addObject("pageStr", pageStr);
		String usergrade=(String)session.getAttribute("usergrade");
		if(!(usergrade==null||usergrade.equals(""))){
			if(usergrade.equals("teacher")){
				mav.addObject("writeButton","<input type=\"button\" class=\"btn btn-default\" value=\"글쓰기\" onclick=\"location.href='cc_gotoNoticeWrite.do'\">");
			}
		}
		mav.addObject("map", searchMap);
		return mav;
	}

}
