package gyum_02.mp_qnaManagement.Controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.commons.ControllerSurpport;
import gyum_02.paging.Paging_PageModule;
import gyum_02.mp_academyStatus.model.mp_TeacherDTO;
import gyum_02.mp_qnaManagement.model.mp_QnaDAO;
import gyum_02.mp_qnaManagement.model.mp_QnaDTO;

@Controller
//@RequestMapping("/masterpage/mp_qna_management")
public class mp_QnaManagementController {

	@Autowired
	public mp_QnaDAO dao;
	
	public ControllerSurpport cs = new ControllerSurpport();

	String folderName = "masterpage/mp_qna_management/";
	
	@RequestMapping(value="/mp_qna.do", method=RequestMethod.GET)
	public String mp_Teacher(){
		return folderName+"mp_qna";
	}

	@RequestMapping(value = "/mp_qna_all_list.do", method = RequestMethod.GET)
	public ResponseEntity<String> mp_QnaAllList(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int listSize = 10;
		int pageSize = 5;
		int totalCnt = dao.mpQnaTotalCnt();
		totalCnt = totalCnt == 0 ? 1 : totalCnt;

		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("cp", cp);
		pageMap.put("listSize", listSize);
		List<mp_TeacherDTO> list = dao.mpQnaAllList(cp, listSize);

		String page = Paging_PageModule.mp_pageMakeAcademy("showAll(",
				totalCnt, listSize, pageSize, cp);

		HashMap map = new HashMap();

		map.put("page", page);
		map.put("list", list);
		return cs.getJsonResponse(map);
	}
	
	@RequestMapping(value="/mp_qna_content.do",method=RequestMethod.GET)
	public ModelAndView mp_QnaContent(
			@RequestParam(value="qna_idx", defaultValue="0")int qna_idx){
		ModelAndView mav = new ModelAndView();
		List<mp_QnaDTO> list = new ArrayList<mp_QnaDTO>();
		list = dao.mpQnaContent(qna_idx);
		
		mav.addObject("list", list);
		
		mav.setViewName(folderName+"mp_qna_content");
		return mav;
	}
	
	//	mp_qna_reWrite_form.do
	@RequestMapping(value="/mp_qna_reWrite_form.do",method=RequestMethod.GET)
	public ModelAndView mp_reWriteForm(mp_QnaDTO dto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName(folderName+"mp_qna_reWriteForm");
		return mav;
	}
		
//		mp_qna_delete.do
	@RequestMapping(value="/mp_qna_delete.do",method=RequestMethod.GET)
	public ModelAndView mp_QnaDelete(
			@RequestParam(value="qna_idx", defaultValue="0")int qna_idx,
			@RequestParam(value="qna_row", defaultValue="0")int qna_row){
		ModelAndView mav = new ModelAndView();
		int result = dao.mpQnaDelete(qna_idx,qna_row);
		boolean flag = false;
		String msg = "";
		String pageName = "";
		if(result>0){
			flag = true;
			msg = "삭제되었습니다.";
			pageName = "mp_qna.do";
		}else{
			msg = "삭제 실패함.";
			pageName = "mp_qna_content.do?qna_idx="+qna_idx;
		}
		mav.addObject("flag",flag);
		mav.addObject("msg",msg);
		mav.addObject("pageName",pageName);
		
		mav.setViewName(folderName+"mp_msg");
		return mav;
	}
	
//		mp_qna_reWrite.do
	@RequestMapping(value="/mp_qna_reWrite.do",method=RequestMethod.GET)
	public ModelAndView mp_QnaReWrite(mp_QnaDTO dto){
		ModelAndView mav = new ModelAndView();
		int result = dao.mpQnaReWrite(dto);
		String msg = "";
		
		boolean flag = false;
		String pageName = "";
		if(result>0){
			flag = true;
			msg = "작성되었습니다.";
			pageName = "mp_qna.do";
		}else{
			msg = "작성 실패함.";
			pageName = "mp_qna_reWriteForm.do?qna_idx="+dto.getQna_idx();
		}
		mav.addObject("flag",flag);
		mav.addObject("msg",msg);
		mav.addObject("pageName",pageName);
		
		mav.setViewName(folderName+"mp_msg");
		
		
		return mav;
	}

	
	
		
}
