package gyum_02.mp_academyStatus.Controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.commons.ControllerSurpport;
import gyum_02.paging.Paging_PageModule;
import gyum_02.mp_academyStatus.model.mp_SalesDAO;
import gyum_02.mp_academyStatus.model.mp_SalesDTO;
import gyum_02.mp_academyStatus.model.mp_StudentDTO;

@Controller
//@RequestMapping("/masterpage/mp_academy_status")
public class mp_SalesController {
	
//	mp_Sales_all_list.do
	
	@Autowired
	public mp_SalesDAO dao;

	public ControllerSurpport cs = new ControllerSurpport();

	String folderName = "masterpage/mp_academy_status/";

	@RequestMapping(value="/mp_sales.do", method=RequestMethod.GET)
	public String mp_Student(){
		return folderName+"mp_sales";
	}
	
	/* ajax */
	@RequestMapping(value="/mp_sales_all_list.do", method=RequestMethod.GET)
	public ResponseEntity<String> mpSalesAllList(
			@RequestParam(value="cp", defaultValue="1")int cp){
		int listSize = 10;
		int pageSize = 5;
		int totalCnt = dao.mpSalesTotalCnt();
		totalCnt=totalCnt==0?1:totalCnt;
		
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("cp", cp);
		pageMap.put("listSize", listSize);
		List<mp_StudentDTO> list = dao.mpSalesAllList(cp, listSize);
		
		String page = Paging_PageModule.mp_pageMakeAcademy("showAll(",
				totalCnt, listSize, pageSize, cp);
		
		HashMap map = new HashMap();
		
		map.put("page", page);
		map.put("list", list);
		
		return cs.getJsonResponse(map);
	}
	
	/* ajax */
	@RequestMapping(value="/mp_sales_in_list.do", method=RequestMethod.GET)
	public ResponseEntity<String> mpSalesInList(
			@RequestParam(value="cp", defaultValue="1")int cp){
		int listSize = 10;
		int pageSize = 5;
		int totalCnt = dao.mpSalesInTotalCnt();
		totalCnt=totalCnt==0?1:totalCnt;
		
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("cp", cp);
		pageMap.put("listSize", listSize);
		List<mp_StudentDTO> list = dao.mpSalesInList(cp, listSize);
		
		String page = Paging_PageModule.mp_pageMakeAcademy("showIn(",
				totalCnt, listSize, pageSize, cp);
		
		HashMap map = new HashMap();
		
		map.put("page", page);
		map.put("list", list);
		
		return cs.getJsonResponse(map);
	}
	
	
	/* ajax */
	@RequestMapping(value="/mp_sales_out_list.do", method=RequestMethod.GET)
	public ResponseEntity<String> mpSalesOutList(
			@RequestParam(value="cp", defaultValue="1")int cp){
		int listSize = 10;
		int pageSize = 5;
		int totalCnt = dao.mpSalesOutTotalCnt();
		totalCnt=totalCnt==0?1:totalCnt;
		
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("cp", cp);
		pageMap.put("listSize", listSize);
		List<mp_StudentDTO> list = dao.mpSalesOutList(cp, listSize);
		
		String page = Paging_PageModule.mp_pageMakeAcademy("showOut(",
				totalCnt, listSize, pageSize, cp);
		
		HashMap map = new HashMap();
		
		map.put("page", page);
		map.put("list", list);
		
		return cs.getJsonResponse(map);
	}
}
