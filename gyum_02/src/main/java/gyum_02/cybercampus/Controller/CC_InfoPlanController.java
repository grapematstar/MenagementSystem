package gyum_02.cybercampus.Controller;

import java.util.ArrayList;
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

import gyum_02.cybercampus.Model.CC_InfoPlanDAO;
import gyum_02.cybercampus.Model.CC_InfoPlanDTO;
import gyum_02.cybercampus.Model.CC_PlanDTO;

@Controller
public class CC_InfoPlanController {
	
	@Autowired
	private CC_InfoPlanDAO cc_InfoPlanDAO;
	
	@RequestMapping(value="/cc_gotoInfoPlanClass.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoInfoClass(HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		String usergrade=(String)session.getAttribute("usergrade");
		int club_idx=(Integer)session.getAttribute("class_idx");
		Map<String,Object> dataMap=cc_InfoPlanDAO.cc_gotoInfoPlanContent(club_idx);
		ModelAndView mav=new ModelAndView("","dataMap",dataMap);
		if(usergrade.equals("teacher")||usergrade.equals("master")){
			mav.setViewName("/cybercampus/cc_class/cc_02.infoPlan/cc_teacher/cc_infoPlan_content");
		}else if(usergrade.equals("student")){
			mav.setViewName("/cybercampus/cc_class/cc_02.infoPlan/cc_student/cc_infoPlan_content");
		}
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoInfoPlanWrite.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoInfoPlanWrite(){
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_02.infoPlan/cc_teacher/cc_infoPlan_write");
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoInfoPlanUpdate.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoInfoPlanUpdate(HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		ModelAndView mav=cc_gotoInfoClass(session);
		mav.setViewName("/cybercampus/cc_class/cc_02.infoPlan/cc_teacher/cc_infoPlan_update");
		return mav;
	}
	
	@RequestMapping(value="/cc_submitInfoPlanUpdate.do",method=RequestMethod.POST)
	public ModelAndView cc_submitInfoPlanUpdate(
			@ModelAttribute("dto")CC_InfoPlanDTO dto,
			@RequestParam(value="c_plan_unit[]",defaultValue="")List<Integer> c_plan_unit,
			@RequestParam(value="c_plan_content[]",defaultValue="")List<String> c_plan_content,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		List<CC_PlanDTO> planList=new ArrayList<CC_PlanDTO>();
		for(int i=1;i<c_plan_unit.size();i++){
			CC_PlanDTO planDTO=new CC_PlanDTO();
			planDTO.setC_plan_unit(c_plan_unit.get(i));
			planDTO.setC_plan_content(c_plan_content.get(i));
			planList.add(planDTO);
		}
		cc_InfoPlanDAO.cc_submitInfoPlanUpdate(dto, planList);
		ModelAndView mav=cc_gotoInfoClass(session);
		return mav;
	}
	
	
	@RequestMapping(value="/cc_submitInfoPlanWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitInfoWrite(
			@ModelAttribute("dto")CC_InfoPlanDTO dto,
			@RequestParam(value="c_plan_unit[]",defaultValue="")List<Integer> c_plan_unit,
			@RequestParam(value="c_plan_content[]",defaultValue="")List<String> c_plan_content,
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
		List<CC_PlanDTO> planList=new ArrayList<CC_PlanDTO>();
		for(int i=1;i<c_plan_unit.size();i++){
			CC_PlanDTO planDTO=new CC_PlanDTO();
			planDTO.setC_plan_unit(c_plan_unit.get(i));
			planDTO.setC_plan_content(c_plan_content.get(i));
			planDTO.setC_i_p_idx(club_idx);
			planList.add(planDTO);
		}
		cc_InfoPlanDAO.cc_submitInfoPlanWrite(dto, planList);
		ModelAndView mav=cc_gotoInfoClass(session);
		return mav;
	}
	
	
}