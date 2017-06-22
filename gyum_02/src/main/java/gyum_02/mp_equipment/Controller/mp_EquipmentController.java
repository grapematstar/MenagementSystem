package gyum_02.mp_equipment.Controller;


import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.commons.ControllerSurpport;
import gyum_02.paging.Paging_PageModule;
import gyum_02.mp_equipment.model.mp_EquipmentDAO;
import gyum_02.mp_equipment.model.mp_EquipmentDTO;
import net.sf.json.JSONArray;

@Controller
//@RequestMapping("/masterpage/mp_equipment")
public class mp_EquipmentController {
	
	@Autowired
	public mp_EquipmentDAO dao;
	
	public ControllerSurpport cs = new ControllerSurpport();
	
	String folderName = "masterpage/mp_equipment/";
	
	@RequestMapping(value="mp_equipment_index.do", method=RequestMethod.GET)
	public String mp_EquipmentIndex(){
		return folderName+"mp_equipment_index";
	}
	
	@RequestMapping(value="/mp_equipment_status.do", method=RequestMethod.GET)
	public ModelAndView mp_EquipmentAllList(
			@RequestParam(value = "cp", defaultValue = "1") int cp){
		ModelAndView mav = new ModelAndView();
		int listSize = 10;
		int pageSize = 5;
		int totalCnt = dao.mpEquipmentTotalCnt();
		totalCnt = totalCnt == 0 ? 1 : totalCnt;
		
		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("cp", cp);
		pageMap.put("listSize", listSize);
		List<mp_EquipmentDTO> list = dao.mpEquipmentAllList(cp, listSize);
		
		
		String page = Paging_PageModule.mp_pageMakeCustomDo("mp_equipment_status.do",
				totalCnt, listSize, pageSize, cp);

		String pageName = folderName+"mp_equipment_status";
		mav.setViewName(pageName);
		
		mav.addObject("page", page);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/mp_equipment_IO.do", method=RequestMethod.GET)
	public ModelAndView mp_Equipment_IO(){
		String pageName = folderName+"mp_equipment_IO";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(pageName);
		List<mp_EquipmentDTO> nameList = dao.mpEquipmentNameList();
		mav.addObject("nameList",nameList);
		return mav;
	}
	
	@RequestMapping(value="/mp_equipment_management.do", method=RequestMethod.GET)
	public String mp_EquipmentManagement(){
		String pageName = folderName+"mp_equipment_management";
		return pageName;
	}
	
	@RequestMapping(value="/mp_equipment_monthly.do", method=RequestMethod.GET)
	public ModelAndView mp_EquipmentMonthly(){
		ModelAndView mav = new ModelAndView();
		String pageName = folderName+"mp_equipment_monthly";
		List<String> yearList = dao.mpEquipmentYearList();

		mav.setViewName(pageName);
		mav.addObject("yearList", yearList);
		return mav;
	}
	
	@RequestMapping(value="/mp_equipment_yearly.do", method=RequestMethod.GET)
	public String mp_EquipmentYearly(){
		return "redirect:mp_equipment_yearly_list.do";
	}
	
	@RequestMapping(value="/mp_equipment_insert_list.do",
			method={RequestMethod.GET,RequestMethod.POST} )
	public ResponseEntity<String> mp_EquipmentInsertList(
			@RequestBody String paramData){

//		System.out.println(paramData);
		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(paramData);

		ArrayList<mp_EquipmentDTO> arr = new ArrayList<mp_EquipmentDTO>();
		for (Map<String, Object> map : resultMap) {
			String equip_code = map.get("equip_code").toString();
			String equip_name = map.get("equip_name").toString();
			String equip_s_size = map.get("equip_s_size").toString();
			Date date = new Date((String) map.get("equip_lastdate"));
			int equip_lastdate =
					((date.getYear()+1900)*10000)+(date.getMonth()*100)+(date.getDate());
			Date e_s_modi_date = new Date((String)map.get("e_s_modi_date"));
			String e_s_in_out = map.get("e_s_in_out").toString();
			int e_s_in_out_num = Integer.parseInt(map.get("e_s_in_out_num").toString());
			
			mp_EquipmentDTO dto = new mp_EquipmentDTO(equip_code, equip_name,
					equip_s_size, equip_lastdate, e_s_in_out, e_s_in_out_num,
					e_s_modi_date);
			arr.add(dto);
		}
		
		HashMap map = new HashMap();
		int result = dao.mpEquipmentInsertList(arr);
		String msg = "";
		int errorCode = 0;
		if(result >0){
			msg = "등록 성공";
			errorCode = 1;
		}else{
			msg = "등록 실패";
			errorCode = -1;
		}
		map.put("msg", msg);
		
		return cs.getJsonResponse(map);
	}

	@RequestMapping(value="/mp_equipment_day_list.do",
			method={RequestMethod.GET,RequestMethod.POST} )
	public ModelAndView mp_EquipmentDayList(
			@RequestParam(value="year", defaultValue="-1")int year,
			@RequestParam(value="month", defaultValue="-1")int month,
			@RequestParam(value="day", defaultValue="-1")int day){
		ModelAndView mav = new ModelAndView();
		String modiDate = (year+"")+(month>=10?month:"0"+month)+(day>=10?day:"0"+day);
		List<mp_EquipmentDTO> list = dao.mpEquipmentDayList(modiDate);
		
		int listSize = list.size();
		mav.setViewName(folderName+"mp_equipment_management");
		mav.addObject("listSize",listSize);
		mav.addObject("list",list);
		
		return mav;
	}
	
	
	@RequestMapping(value="/mp_equipment_monthly_list.do",
			method={RequestMethod.GET,RequestMethod.POST} )
	public ResponseEntity<String> mp_EquipmentMonthlyList(
			@RequestParam(value="year", defaultValue="-1")int year){
		List<mp_EquipmentDTO> list = dao.mpEquipmentMonthlyList(year);
		List<mp_EquipmentDTO> nameList = dao.mpEquipmentNameList();
		ArrayList<Integer> modiMonthList = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++){
			modiMonthList.add(list.get(i).getE_s_modi_date().getMonth()+1);
		}
		/*
		System.out.println("yyyyyyyyyy : " + year);
		for(int i=0; i<modiMonthList.size(); i++){
			System.out.println("mmmmmm : "+modiMonthList.get(i));
		}
		*/
		HashMap map = new HashMap();
		map.put("nameList", nameList);
		map.put("list", list);
		map.put("modiMonthList", modiMonthList);
		
		return cs.getJsonResponse(map);
	}
	
	@RequestMapping(value="/mp_equipment_yearly_list.do",
			method={RequestMethod.GET,RequestMethod.POST} )
	public ModelAndView mp_EquipmentYearlyList(){
		ModelAndView mav = new ModelAndView();
		List<mp_EquipmentDTO> list =
				dao.mpEquipmentYearlyList();
		List<mp_EquipmentDTO> nameList = dao.mpEquipmentNameList();
		List<String> yearList = dao.mpEquipmentYearList();
		
		ArrayList<Integer> modiYearList = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++){
			modiYearList.add(list.get(i).getE_s_modi_date().getYear());
		}
		
		HashMap map = new HashMap();
		map.put("list", list);
		map.put("nameList", nameList);
		map.put("yearList", yearList);
		map.put("modiYearList", modiYearList);
		mav.addObject("map",cs.getJsonResult(map));
		mav.addObject("yearList",yearList);
		
		mav.setViewName(folderName+"mp_equipment_yearly");
	//	mav.addObject("nameList",nameList);
	//	mav.addObject("list",cs.getJsonResponse(list));
	//	mav.addObject("firstYear",firstYear);
		
		return mav;
	}
	
	
}
