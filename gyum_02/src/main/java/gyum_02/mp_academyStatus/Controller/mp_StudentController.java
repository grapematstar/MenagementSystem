package gyum_02.mp_academyStatus.Controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.paging.Paging_PageModule;
import gyum_02.commons.ControllerSurpport;
import gyum_02.mp_academyStatus.model.mp_ClassDTO;
import gyum_02.mp_academyStatus.model.mp_StudentDAO;
import gyum_02.mp_academyStatus.model.mp_StudentDTO;


@Controller
//@RequestMapping("/masterpage/mp_academy_status")
public class mp_StudentController{
	
	@Autowired
	public mp_StudentDAO dao;

	public ControllerSurpport cs = new ControllerSurpport();

	String folderName = "masterpage/mp_academy_status/";
	
	@RequestMapping(value="mp_academy_index.do", method=RequestMethod.GET)
	public String mp_AcademyIndex(){
		return folderName+"mp_academy_index";
	}
	
	@RequestMapping(value="/mp_student.do", method=RequestMethod.GET)
	public String mp_Student(){
		return folderName+"mp_student";
	}
	
	/* ajax */
	@RequestMapping(value="/mp_student_all_list.do", method=RequestMethod.GET)
	public ResponseEntity<String> mp_StudentAllList(
			@RequestParam(value="cp", defaultValue="1")int cp){
		int listSize = 10;
		int pageSize = 5;
		int totalCnt = dao.mpStudentTotalCnt();
		totalCnt=totalCnt==0?1:totalCnt;
		
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("cp", cp);
		pageMap.put("listSize", listSize);
		List<mp_StudentDTO> list = dao.mpStudentAllList(cp, listSize);
		
		String page = Paging_PageModule.mp_pageMakeAcademy("showAll(",
				totalCnt, listSize, pageSize, cp);
		
		HashMap map = new HashMap();
		
		map.put("page", page);
		map.put("list", list);
		
	/*	for(int i=0; i<list.size(); i++){
			System.out.println("lllll : "+list.get(i).getClass_idx_s());
		}
		*/
		return cs.getJsonResponse(map);
	}
	
	/* ajax */
	@RequestMapping(value="/mp_student_class_list.do", method=RequestMethod.GET)
	public ResponseEntity<String> mp_StudentClassList(
			@RequestParam(value="cp", defaultValue="1")int cp,
			@RequestParam(value="class_idx", defaultValue="1")int class_idx){
		int listSize = 5;
		int pageSize = 5;
		int totalCnt = dao.mpStudentClassTotalCnt(class_idx);
		totalCnt=totalCnt==0?1:totalCnt;
		
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("cp", cp);
		pageMap.put("listSize", listSize);
		List<mp_StudentDTO> list = dao.mpStudentClassList(cp, listSize, class_idx);
		List<String> classList = dao.mpStudentClassNameList();
		
		String page = Paging_PageModule.mp_pageMakeAcademy("showClass(",class_idx+"",
				totalCnt, listSize, pageSize, cp);
		
		HashMap map = new HashMap();
		
		map.put("page", page);
		map.put("list", list);
		map.put("classList", classList);
		
		return cs.getJsonResponse(map);
	}
	
	/* ajax */
	@RequestMapping(value="/mp_class_info.do", method=RequestMethod.GET)
	public ResponseEntity<String> mpClassInfo(
			@RequestParam(value="splits_class_idx",
				defaultValue="1")int splits_class_idx){
	//	System.out.println("mpClassInfo()는 테스트 중입니다. idx 41로 고정됩니다.");
	//	splits_class_idx = 41;
//		System.out.println("sp c idx : " + splits_class_idx);
		mp_ClassDTO dto = dao.mpClassInfo(splits_class_idx);
		
		HashMap map = new HashMap();
		
		map.put("dto", dto);
		return cs.getJsonResponse(map);
	}
	
	
	
	
//	@RequestMapping(value="/mp_student_all_list.do",method=RequestMethod.GET)
//	public ModelAndView mp_StudentAllList(
//			@RequestParam(value="cp", defaultValue="1")int cp){
//		int listSize = 5;
//		int pageSize = 5;
//		int totalCnt = dao.mp_studentTotalCnt();
//		totalCnt=totalCnt==0?1:totalCnt;
//		
//		ModelAndView mav = new ModelAndView();
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("cp", cp);
//		map.put("listSize", listSize);
//		List<mp_StudentDTO> list = dao.mpStudentAllList(cp, listSize);
//		
//		String page = mp_PageModule.pageMake("mp_student_all_list.do",
//				totalCnt, listSize, pageSize, cp);
//		
//		mav.addObject("page",page);
//		mav.addObject("list", list);
//		mav.setViewName(folderName+"mp_student");
//		return mav;
//	}
	
	
//	@RequestMapping(value="/mp_student_class_list.do",method=RequestMethod.GET)
//	public ModelAndView mp_StudentClassList(
//			@RequestParam(value="cp", defaultValue="1")int cp,
//			@RequestParam(value="class_subject", defaultValue="A")String class_subject){
//		int listSize = 5;
//		int pageSize = 5;
//		int totalCnt = dao.mp_studentTotalCnt();
//		totalCnt=totalCnt==0?1:totalCnt;
//		
//		ModelAndView mav = new ModelAndView();
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("cp", cp);
//		map.put("listSize", listSize);
//		List<mp_StudentDTO> list = dao.mpStudentClassList(cp, listSize, class_subject);
//		
//		String page = mp_PageModule.pageMake("mp_student_class_list.do",
//				totalCnt, listSize, pageSize, cp);
//		
//		mav.addObject("page",page);
//		mav.addObject("list", list);
//		
//		mav.setViewName(folderName+"mp_student");
//		return mav;
//	}
	
	
}
