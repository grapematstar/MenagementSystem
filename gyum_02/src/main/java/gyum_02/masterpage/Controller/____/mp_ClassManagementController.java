package gyum_02.masterpage.Controller.____;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.commons.ControllerSurpport;
import gyum_02.masterpage.model._____.mp_ClassManagementDAO;
import gyum_02.masterpage.model._____.mp_ClassManagementDTO;
import gyum_02.masterpage.model._____.mp_EvalDTO;
import gyum_02.mp_equipment.model.mp_EquipmentDTO;
import net.sf.json.JSONArray;

@Controller
//@RequestMapping(value="/masterpage/mp_class")
public class mp_ClassManagementController {
	
	@Autowired
	public mp_ClassManagementDAO dao;
	
	public ControllerSurpport cs = new ControllerSurpport();

	String folderName = "masterpage/mp_class/";
	
	@RequestMapping(value="/mp_class_management.do", method=RequestMethod.GET)
	public ModelAndView mpClassManagement(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName(folderName+"mp_class_management");
		
		return mav;
	}
	
	@RequestMapping(value="/class_management_form.do", method=RequestMethod.GET)
	public ModelAndView mpClassManagementForm(
			mp_ClassManagementDTO dto){
//		HashMap map = new HashMap();
//		map.put("checkbox_class_check_0", class_check_0);
//		map.put("checkbox_class_check_1", class_check_1);
//		map.put("checkbox_class_check_2", class_check_2);
//		map.put("checkbox_class_idx", class_idx);
//		map.put("checkbox_subject_name", subject_name);
//		map.put("checkbox_class_subject", class_subject);
//		map.put("checkbox_tea_name", checkbox_tea_name);
//		map.put("checkbox_class_startdate", class_startdate);
//		map.put("checkbox_class_enddate", class_enddate);
//		map.put("checkbox_class_day_0", class_day_0);
//		map.put("checkbox_class_day_1", class_day_1);
//		map.put("checkbox_class_day_2", class_day_2);
//		map.put("checkbox_class_day_3", class_day_3);
//		map.put("checkbox_class_day_4", class_day_4);
		
		List<mp_ClassManagementDAO> list =  dao.mpClassSearchList(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("jsonList",cs.getJsonResult(list));
		mav.addObject("list",list);
		mav.setViewName(folderName+"mp_class_management");
		return mav;
	}
	
	@RequestMapping(value="mp_classCheckUpdate.do", method=RequestMethod.POST)
	public ResponseEntity<String> mpClassCheckUpdate(
			@RequestBody String paramData,
			@RequestParam(value="class_check")int class_check){
		
		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(paramData);
		List<Integer> list = new ArrayList<Integer>();
		
		for (Map<String, Object> map : resultMap) {
			int class_idx = Integer.parseInt(map.get("class_idx").toString());
			
			list.add(class_idx);
		}
		HashMap lmap = new HashMap();
		lmap.put("list", list);
		lmap.put("class_check", class_check);
		
		int count = dao.mpClassCheckUpdate(lmap);
		String msg = count>0?"수정 성공":"수정 실패";
		HashMap map = new HashMap();
		map.put("msg", msg);
		map.put("count", count);
		
		return cs.getJsonResponse(map);
	}
	
	@RequestMapping(value="mp_ClassUpdate.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<String> mpClassUpdate(
			@RequestBody String paramData){
		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(paramData);
		
		mp_ClassManagementDTO dto = null;
		for (Map<String, Object> map : resultMap) {
			int class_idx = Integer.parseInt(map.get("class_idx").toString());
			int subject_num = Integer.parseInt(map.get("subject_num").toString());
			int class_startdate = Integer.parseInt(map.get("class_startdate").toString());
			int class_enddate = Integer.parseInt(map.get("class_enddate").toString());
			int class_time = Integer.parseInt(map.get("class_time").toString());
			int classroom = Integer.parseInt(map.get("classroom").toString());
			String class_day = map.get("class_day").toString();
			String class_subject = map.get("class_subject").toString();
			int tea_idx = Integer.parseInt(map.get("tea_idx").toString());
			int class_price = Integer.parseInt(map.get("class_price").toString());
			int class_max_student = Integer.parseInt(map.get("class_max_student").toString());
			dto = new mp_ClassManagementDTO(class_idx, class_subject,
					class_day, class_startdate, class_enddate, 
					classroom, class_time, tea_idx, class_price, 
					class_max_student, subject_num);
		}
		int count = dao.mpClassUpdate(dto);
		
		String msg = count>0?"수정 성공":"수정 실패";
		HashMap map = new HashMap();
		map.put("msg", msg);
		map.put("count", count);
		
		return cs.getJsonResponse(map);
	}
	
	
}
