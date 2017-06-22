package gyum_02.cybercampus.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import gyum_02.cybercampus.Model.CC_QnADAO;
import gyum_02.cybercampus.Model.CC_QnADTO;

@Controller
public class CC_QnAController {
	
	@Autowired
	private CC_QnADAO cc_QnADAO;
	
	//QnA Contents
	@RequestMapping(value="/cc_gotoQnAList.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoQnAList(
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
		int totalCnt=cc_QnADAO.cc_totalCntQnAList(club_idx);
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=5;
		int pageSize=5;
		List<CC_QnADTO> list = cc_QnADAO.cc_gotoQnAList(cp, listSize, club_idx);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_Qwritedate(transFormat.format(list.get(i).getC_q_q_writedate()));
		}
		Map<String,Object> searchMap=new HashMap<String,Object>();
		String pageStr = gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_gotoQnAList.do", totalCnt, listSize, pageSize, cp, searchMap);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_06.qna/cc_qna_list");
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoQnAContent",method=RequestMethod.GET)
	public ModelAndView cc_gotoQnAContent(
			@RequestParam(value="c_q_q_idx",defaultValue="0")int c_q_q_idx,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		CC_QnADTO dto=cc_QnADAO.cc_gotoQnAContent(c_q_q_idx);
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		dto.setString_Qwritedate(transFormat.format(dto.getC_q_q_writedate()));
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_06.qna/cc_qna_content","dto",dto);
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoQnAWrite.do",method=RequestMethod.GET)
	public String cc_gotoQnAWrite(){
		return "/cybercampus/cc_class/cc_06.qna/cc_qna_write";
	}
	
	@RequestMapping(value="/cc_gotoQnAUpdate.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoQnAUpdate(
			@RequestParam(value="c_q_q_idx",defaultValue="0")int c_q_q_idx){
		CC_QnADTO dto=cc_QnADAO.cc_gotoQnAContent(c_q_q_idx);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_06.qna/cc_qna_update","dto",dto);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitQnAWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitQnAWrite(
			@ModelAttribute("dto")CC_QnADTO dto,
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
		String userid=(String)session.getAttribute("id");
		dto.setClub_idx(club_idx);
		dto.setC_q_q_writer(userid);
		int result=cc_QnADAO.cc_submitQnAWrite(dto);
		String locationOrder="",msg="";
		if(result>0){
			msg="질문이 등록되었습니다. \\n질문응답 리스트 페이지로 이동합니다.";
			locationOrder="cc_gotoQnAList.do";
		}else{
			msg="질문 등록에 실패했습니다. \\n질문응답 작성하기 페이지로 이동합니다.";
			locationOrder="cc_gotoQnAWrite.do";
		}
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
		mav.addObject("locationOrder", locationOrder);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitQnAUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_submitQnAUpdate(
			@ModelAttribute("dto")CC_QnADTO dto,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int result=cc_QnADAO.cc_submitQnAUpdate(dto);
		String locationOrder="",msg="";
		if(result>0){
			msg="질문이 수정되었습니다.\\n질문응답 본문으로 이동합니다.";
			locationOrder="cc_gotoQnAContent.do?c_q_q_idx="+dto.getC_q_q_idx();
		}else{
			msg="질문 수정에 실패했습니다.\\n질문응답 리스트 페이지로 이동합니다.";
			locationOrder="cc_gotoQnAList.do";
		}
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
		mav.addObject("locationOrder", locationOrder);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitQnADelete.do",method=RequestMethod.POST)
	public ModelAndView cc_submitQnADelete(
			@RequestParam(value="c_q_q_idx",defaultValue="0")int c_q_q_idx){
		int result=cc_QnADAO.cc_submitQnADelete(c_q_q_idx);
		String locationOrder="",msg="";
		if(result>0){
			msg="질문이 삭제되었습니다.\\n질문응답 리스트 페이지로 이동합니다.";
			locationOrder="cc_gotoQnAList.do";
		}else{
			msg="질문 삭제에 실패했습니다.\\n질문응답 본문으로 이동합니다.";
			locationOrder="cc_gotoQnAContent.do?c_q_q_idx="+c_q_q_idx;
		}
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
		mav.addObject("locationOrder", locationOrder);
		return mav;
	}
	
	//QnA Reply Contents
	@RequestMapping(value="/cc_gotoQnAReply.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoQnAReply(
			@RequestParam(value="c_q_q_idx",defaultValue="0")int c_q_q_idx,
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
		int totalCnt=cc_QnADAO.cc_totalCntQnAReplyList(c_q_q_idx);
		totalCnt=0==totalCnt?1:totalCnt;
		int pageSize=5;
		int listSize=5;
		List<CC_QnADTO> list=cc_QnADAO.cc_gotoQnAReplyContentList(cp, listSize, c_q_q_idx);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_Awritedate(transFormat.format(list.get(i).getC_q_a_writedate()));
		}
		List<String> pagingList=new ArrayList<String>();
		Map<String,Object> pagingMap=new HashMap<String,Object>();
		pagingList.add("c_q_q_idx");
		pagingMap.put("c_q_q_idx", c_q_q_idx);
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPagingMapAjaxforRightSideBar("forPaging", totalCnt, listSize, pageSize, cp, pagingList, pagingMap);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_06.qna/cc_qna_reply","list",list);
		if(!(list==null||list.size()==0))mav.addObject("subject", list.get(0).getC_q_q_subject());
		mav.addObject("c_q_q_idx", c_q_q_idx);
		mav.addObject("cp", cp);
		mav.addObject("pageStr", pageStr);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitQnAReplyUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_submitQnAReplyUpdate(
			@ModelAttribute("dto")CC_QnADTO dto,
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
		int result=cc_QnADAO.cc_submitQnAReplyUpdate(dto);
		String locationOrder="",msg="";
//		if(result>0){
//			msg="답변이 수정되었습니다.";
//			locationOrder="cc_gotoQnAReply.do?c_q_q_idx="+dto.getC_q_q_idx()+"&cp="+cp;
//		}else{
//			msg="답변 수정에 실패했습니다.";
//			locationOrder="cc_gotoQnAReply.do?c_q_q_idx="+dto.getC_q_q_idx()+"&cp="+cp;
//		}
//		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
//		mav.addObject("locationOrder", locationOrder);
		ModelAndView mav=cc_gotoQnAReply(dto.getC_q_q_idx(), cp, session);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitQnAReplyDelete.do",method=RequestMethod.POST)
	public ModelAndView cc_submitQnAReplyDelete(
			@RequestParam(value="c_q_a_idx",defaultValue="0")int c_q_a_idx,
			@RequestParam(value="c_q_q_idx",defaultValue="0")int c_q_q_idx,
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session){
		int result=cc_QnADAO.cc_submitQnAReplyDelete(c_q_a_idx);
//		String locationOrder="",msg="";
//		if(result>0){
//			msg="답변이 삭제되었습니다.";
//			locationOrder="cc_gotoQnAReply.do?c_q_q_idx="+c_q_q_idx+"&cp="+cp;
//		}else{
//			msg="답변 삭제에 실패했습니다.";
//			locationOrder="cc_gotoQnAReply.do?c_q_q_idx="+c_q_q_idx+"&cp="+cp;
//		}
//		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
//		mav.addObject("locationOrder", locationOrder);
		ModelAndView mav=cc_gotoQnAReply(c_q_q_idx, cp, session);
		return mav;
		
	}
	
	@RequestMapping(value="/cc_submitQnAReplyWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitQnAReplyWrite(
			@ModelAttribute(value="dto")CC_QnADTO dto,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		String id=(String)session.getAttribute("id");
		dto.setC_q_a_writer(id);
		System.out.println(dto.getC_q_q_idx());
		cc_QnADAO.cc_submitQnAReplyWrite(dto);
		ModelAndView mav=cc_gotoQnAReply(dto.getC_q_q_idx(), 1, session);
		return mav;
	}
}
