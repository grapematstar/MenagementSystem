package gyum_02.mypage.Controller;

import java.util.HashMap;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.member.model.*;
import gyum_02.mypage.model.*;

@Controller
public class My_QnaController {

	@Autowired
	private My_QnaDAO My_qnaDao;
	@Autowired
	private My_memberStudentDAO My_memberDao1;
	@Autowired
	private My_memberParentDAO My_memberDao2;
	@Autowired
	private My_memberTeacherDAO My_memberDao3;
	
	@RequestMapping("/qna_Write.do")
	public ModelAndView qna_Write(My_QnaDTO dto){
		int result = My_qnaDao.qna_Write(dto);
		String msg = result>0?"게시글 작성 성공":"게시글 작성 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("mypage/my_qna/my_qnaMsg");
		return mav;
	}
	
	@RequestMapping("/qna.do")
	public ModelAndView qna_List(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
		String ids = (String)session.getAttribute("id");
		String usergrades = (String)session.getAttribute("usergrade");
		int qna_totalCnt;
		if(usergrades.equals("student")){
			qna_totalCnt = My_qnaDao.stu_qna_TotalCnt(ids);
		}else if(usergrades.equals("parent")){
			qna_totalCnt = My_qnaDao.par_qna_TotalCnt(ids);
		}else{
			qna_totalCnt = My_qnaDao.tea_qna_TotalCnt(ids);
		}
		qna_totalCnt = qna_totalCnt == 0? 1 : qna_totalCnt;
		int listSize = 5;
		int pageSize = 5;
		ModelAndView mav = new ModelAndView();
		if(usergrades.equals("student")){
			System.out.println(ids);
			List<My_QnaDTO> qna_list = My_qnaDao.stu_qna_List(ids, cp, listSize);
			String qna_pageStr = gyum_02.paging.Paging_PageModule.pageMake("qna.do", qna_totalCnt, listSize, pageSize, cp);
			mav.addObject("qna_list",qna_list);
			mav.addObject("qna_pageStr",qna_pageStr);
			mav.setViewName("mypage/my_qna/my_qna");
			return mav;
		}else if(usergrades.equals("parent")){
			List<My_QnaDTO> qna_list = My_qnaDao.par_qna_List(ids,cp, listSize);
			String qna_pageStr = gyum_02.paging.Paging_PageModule.pageMake("qna.do", qna_totalCnt, listSize, pageSize, cp);
			mav.addObject("qna_list",qna_list);
			mav.addObject("qna_pageStr",qna_pageStr);
			mav.setViewName("mypage/my_qna/my_qna");
			return mav;
		}else{
			List<My_QnaDTO> qna_list = My_qnaDao.tea_qna_List(ids,cp, listSize);
			String qna_pageStr = gyum_02.paging.Paging_PageModule.pageMake("qna.do", qna_totalCnt, listSize, pageSize, cp);
			mav.addObject("qna_list",qna_list);
			mav.addObject("qna_pageStr",qna_pageStr);
			mav.setViewName("mypage/my_qna/my_qna");
			return mav;
		}
	}
	
	@RequestMapping("/qna_WriteForm.do")
	public ModelAndView stu_qnaWriteForm(String id,String usergrade,HttpSession session){
		String ids = (String)session.getAttribute("id");
		String usergrades = (String)session.getAttribute("usergrade");
		
		ModelAndView mav = new ModelAndView();
		if(usergrades.equals("student")){
			List<My_memberStudentDTO> list = My_memberDao1.stu_QnaWriteForm(ids, usergrades);
			mav.addObject("list", list);
			mav.setViewName("mypage/my_qna/my_qnawrite");
		}else if(usergrades.equals("parent")){
			List<My_memberParentDTO> list = My_memberDao2.par_QnaWriteForm(ids, usergrades);
			mav.addObject("list", list);
			mav.setViewName("mypage/my_qna/my_qnawrite");
		}else{
			List<My_memberTeacherDTO> list = My_memberDao3.tea_QnaWriteForm(ids, usergrades);
			mav.addObject("list", list);
			mav.setViewName("mypage/my_qna/my_qnawrite");
		}
		return mav;
	}
	
	@RequestMapping("/qna_Content.do")
	public ModelAndView qna_Content(@RequestParam(value="cp",defaultValue="1")int cp,int idx){
		int qna_retotalCnt = My_qnaDao.qna_reTotalCnt(idx);
		qna_retotalCnt = qna_retotalCnt == 0? 1 : qna_retotalCnt;
		int listSize = 5;
		int pageSize = 5;
		
		My_QnaDTO list = My_qnaDao.qna_Content(idx);
		List<My_QnaDTO> re_list = My_qnaDao.qna_reList(cp, listSize, idx);
		String qna_repageStr = gyum_02.paging.Paging_PageModule.pageMake("qna_Content.do", qna_retotalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("re_list", re_list);
		mav.addObject("qna_repageStr",qna_repageStr);
		mav.setViewName("mypage/my_qna/my_qna_content");
		return mav;
	}
	
	@RequestMapping("/qna_Update.do")
	public ModelAndView stu_qna_Update(My_QnaDTO dto){
		int result = My_qnaDao.qna_Update(dto);
		String msg = result>0?"湲��닔�젙�꽦怨�":"湲��닔�젙�떎�뙣";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("mypage/my_qna/my_qnaMsg");
		return mav;
	}
	
	@RequestMapping("/qna_reWrire.do")
	public ModelAndView qna_reWrite(My_QnaDTO dto){
		int result = My_qnaDao.qna_reWrite(dto);
		String msg = result>0?"댓글 작성 성공":"댓글 작성 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("mypage/my_qna/my_qnaMsg");
		return mav;
	}
	
}
