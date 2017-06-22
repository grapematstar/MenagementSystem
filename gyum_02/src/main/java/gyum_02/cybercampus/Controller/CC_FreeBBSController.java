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

import gyum_02.cybercampus.Model.CC_FreeBBSDAO;
import gyum_02.cybercampus.Model.CC_FreeBBSDTO;
import gyum_02.cybercampus.Model.CC_NoticeDTO;

@Controller
public class CC_FreeBBSController {
	
	@Autowired
	private CC_FreeBBSDAO cc_FreeBBSDAO;
	
	@RequestMapping(value="/cc_gotoFreeBBSList.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoFreeBBSList(
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
		int totalCnt=cc_FreeBBSDAO.cc_totalCntFreeBBSList(class_idx);
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=5;
		int pageSize=5;
		List<CC_FreeBBSDTO> list=cc_FreeBBSDAO.cc_gotoFreeBBSList(class_idx,cp,listSize);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_writedate(transFormat.format(list.get(i).getC_f_b_writedate()));
		}
		Map<String,Object> searchMap=new HashMap<String,Object>();
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_searchFreeBBSForThisUser.do", totalCnt, listSize, pageSize, cp, searchMap);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_04.freebbs/cc_freebbs_list","list",list);
		mav.addObject("pageStr", pageStr);
		return mav;
	}
	@RequestMapping(value="/cc_gotoFreeBBSWrite.do",method=RequestMethod.GET)
	public String cc_gotoFreeBBSWrite(){
		return "/cybercampus/cc_class/cc_04.freebbs/cc_freebbs_write";
	}

	@RequestMapping(value="/cc_gotoFreeBBSContent.do",method=RequestMethod.POST)
	public ModelAndView cc_gotoFreeBBSContent(
			@RequestParam(value="c_f_b_idx",defaultValue="0")int c_f_b_idx,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		CC_FreeBBSDTO dto=cc_FreeBBSDAO.cc_gotoFreeBBSContent(c_f_b_idx);
		String id=(String)session.getAttribute("id");
		Map<String,Object> searchMap=new HashMap<String,Object>();
		searchMap.put("c_f_b_idx", c_f_b_idx);
		List<CC_FreeBBSDTO> list=cc_FreeBBSDAO.cc_getFreeBBSReplyList(searchMap);
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		dto.setString_writedate(transFormat.format(dto.getC_f_b_writedate()));
		for(int i=0;i<list.size();i++){
			list.get(i).setString_writedate(transFormat.format(list.get(i).getC_f_b_r_date()));
		}
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_04.freebbs/cc_freebbs_content","dto",dto);
		mav.addObject("replyList", list);
		if(dto.getC_f_b_writer().equals(id)){
		mav.addObject("forModify", "<input type=\"button\" class=\"btn btn-default\" value=\"수정\"onclick=\"ajaxupdate("+c_f_b_idx+")\">&nbsp;&nbsp;&nbsp;<input type=\"button\" class=\"btn btn-primary\" value=\"삭제\"onclick=\"freeBBSDelete("+c_f_b_idx+")\">");
		}		
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoFreeBBSUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_gotoFreeBBSUpdate(
			@RequestParam(value="c_f_b_idx",defaultValue="0")int c_f_b_idx,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		CC_FreeBBSDTO dto=cc_FreeBBSDAO.cc_gotoFreeBBSContent(c_f_b_idx);
		String id=(String)session.getAttribute("id");
		Map<String,Object> searchMap=new HashMap<String,Object>();
		searchMap.put("c_f_b_idx", c_f_b_idx);
		List<CC_FreeBBSDTO> list=cc_FreeBBSDAO.cc_getFreeBBSReplyList(searchMap);
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		dto.setString_writedate(transFormat.format(dto.getC_f_b_writedate()));
		for(int i=0;i<list.size();i++){
			list.get(i).setString_writedate(transFormat.format(list.get(i).getC_f_b_r_date()));
		}
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_04.freebbs/cc_freebbs_update","dto",dto);
		mav.addObject("replyList", list);
		if(dto.getC_f_b_writer().equals(id)){
		mav.addObject("forModify", "<input type=\"button\" class=\"btn btn-default\" value=\"수정\"onclick=\"location.href='/cc_gotoFreeBBSUpdate.do?'c_f_b_idx="+c_f_b_idx+"\">&nbsp;&nbsp;&nbsp;<input type=\"button\" class=\"btn btn-primary\" value=\"삭제\"onclick=\"freeBBSDelete("+c_f_b_idx+")\">");
		}		
		return mav;
	}

	@RequestMapping(value="/cc_gotoFreeBBSReply.do",method=RequestMethod.GET)
	public String cc_gotoFreeBBSReply(){
		return "/cybercampus/cc_class/cc_04.freebbs/cc_freebbs_reply";
	}
	@RequestMapping(value="/cc_submitFreeBBSWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitFreeBBSWrite(
			@ModelAttribute("dto")CC_FreeBBSDTO dto,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		dto.setClub_idx((Integer)session.getAttribute("class_idx"));
		dto.setC_f_b_writer((String)session.getAttribute("id"));
		int result=cc_FreeBBSDAO.cc_submitFreeBBSWrite(dto);
		String msg=result>0?"게시글이 등록되었습니다.":"게시글 등록에 실패했습니다.";
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
		mav.addObject("locationOrder", "cc_gotoFreeBBSList.do");
		return mav;
	}
	@RequestMapping(value="/cc_submitFreeBBSUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_submitFreeBBSUpdate(
			@ModelAttribute("dto")CC_FreeBBSDTO dto,
			HttpSession session){
		int result=cc_FreeBBSDAO.cc_submitFrreBBSUpdate(dto);
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg");
		if(result>0){
			mav.addObject("msg", "글 수정을 성공했습니다.");
			mav.addObject("locationOrder", "cc_gotoFreeBBSList.do");
		}else{
			mav.addObject("msg", "글 수정에 실패했습니다.");
			mav.addObject("locationOrder", "cc_gotoFreeBBSList.do");
		}
		return mav;
	}
	@RequestMapping(value="/cc_submitFreeBBSDelete.do",method=RequestMethod.GET)
	public ModelAndView cc_submitFreeBBSDelete(
			@RequestParam(value="c_f_b_idx",defaultValue="0")int c_f_b_idx){
		int count=cc_FreeBBSDAO.cc_submitFreeBBSDelete(c_f_b_idx);
		String msg="";
		if(count>0){
			msg="게시글이 삭제되었습니다.";
		}else{
			msg="게시글 삭제에 실패했습니다.";
		}
		ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
		mav.addObject("locationOrder", "cc_gotoFreeBBSList.do");
		return mav;
	}
	
	@RequestMapping(value="/cc_searchFreeBBSForThisUser.do",method=RequestMethod.GET)
	public ModelAndView cc_searchFreeBBSForThisUser(
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
		int totalCnt=cc_FreeBBSDAO.cc_totalCntSearchFreeBBSForThisUser(searchMap);
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=5;
		int pageSize=5;
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		searchMap.put("startnum", startnum);
		searchMap.put("endnum", endnum);
		List<CC_FreeBBSDTO> list=cc_FreeBBSDAO.cc_searchFreeBBSForThisUser(searchMap);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_writedate(transFormat.format(list.get(i).getC_f_b_writedate()));
		}
		searchMap.remove("startnum");
		searchMap.remove("endnum");
		searchMap.remove("class_idx");
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_searchFreeBBSForThisUser.do", totalCnt, listSize, pageSize, cp, searchMap);
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_04.freebbs/cc_freebbs_list","list",list);
		mav.addObject("pageStr", pageStr);
		return mav;
	}
	
	@RequestMapping(value="/cc_submitFreeBBSReply.do",method=RequestMethod.POST)
	public ModelAndView cc_submitFreeBBSReply(
			@RequestParam(value="c_f_b_idx",defaultValue="0")int c_f_b_idx,
			@RequestParam(value="c_f_b_r_content",defaultValue="N")String c_f_b_r_content,
			@RequestParam(value="c_f_b_r_towho",defaultValue="N")String c_f_b_r_towho,
			HttpSession session){
		Map<String,Object> searchMap=new HashMap<String,Object>();
		int class_idx=(Integer)session.getAttribute("class_idx");
		String c_f_b_r_writer=(String)session.getAttribute("id");
		searchMap.put("c_f_b_idx", c_f_b_idx);
		searchMap.put("c_f_b_r_content", c_f_b_r_content);
		searchMap.put("c_f_b_r_towho", c_f_b_r_towho);
		searchMap.put("c_f_b_r_writer", c_f_b_r_writer);
		int result=cc_FreeBBSDAO.cc_submitFreeBBSReply(searchMap);
		CC_FreeBBSDTO dto=cc_FreeBBSDAO.cc_gotoFreeBBSContent(c_f_b_idx);
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		dto.setString_writedate(transFormat.format(dto.getC_f_b_writedate()));
		List<CC_FreeBBSDTO> list=cc_FreeBBSDAO.cc_getFreeBBSReplyList(searchMap);
		for(int i=0;i<list.size();i++){
			list.get(i).setString_writedate(transFormat.format(list.get(i).getC_f_b_r_date()));
		}
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_04.freebbs/cc_freebbs_content","dto",dto);
		mav.addObject("replyList", list);
		return mav;
	}
	
}
