package gyum_02.masterpage.Controller.____;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.commons.ControllerSurpport;
import gyum_02.masterpage.model._____.evalDAO;
import gyum_02.masterpage.model._____.mp_EvalDTO;
import gyum_02.mp_academyStatus.model.mp_StudentDAO;

@Controller
//@RequestMapping("/masterpage/mp_member")
public class mp____Controller {
	@Autowired
	public mp_StudentDAO dao;
	
	@Autowired
	public evalDAO evDao;
	
	
	public ControllerSurpport cs = new ControllerSurpport();

	String folderName = "masterpage/mp_member/";
	
	@RequestMapping(value="/mp_student_eval.do", method=RequestMethod.GET)
	public ModelAndView mp_StudentEval(){
		ModelAndView mav = new ModelAndView();
		
		List<String> classList = dao.mpStudentClassNameList();
		List<mp_EvalDTO> question = evDao.mpQuestionList();
	//	System.out.println( question.get(0).getC_e_q_question());
		
		HashMap map = new HashMap();
		map.put("classList", classList);
		mav.addObject("map",cs.getJsonResult(map));
		mav.addObject("classList",classList);
		mav.addObject("question",question);

		mav.setViewName(folderName+"mp_student_eval");
		
		return mav;
	}
	
	@RequestMapping(value="/mp_teacher_eval.do", method=RequestMethod.GET)
	public ModelAndView mp_TeacherEval(){
		ModelAndView mav = new ModelAndView();
		List<mp_EvalDTO> question = evDao.mpQuestionList();
		
		mav.addObject("question",question);
		mav.setViewName(folderName+"mp_teacher_eval");
		
		return mav;
	}
	
	@RequestMapping(value="/mp_student_eval_list.do", method=RequestMethod.GET)
	public ResponseEntity<String> mpStudentEvalInfo(
			@RequestParam(value = "class_idx", defaultValue="1")int class_idx,
		@RequestParam(value = "stu_name", defaultValue="")String stu_name){
		List<mp_EvalDTO> evalList = evDao.mpStudentEvalInfo(class_idx, stu_name);
		
		HashMap map = new HashMap();
		map.put("evalList", evalList);
		
		return cs.getJsonResponse(map);
	}
	
	@RequestMapping(value = "/mp_evalInfo.do",
			method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<String> mpEvalInfo(
		@RequestParam(value = "stu_idx", defaultValue="1")int stu_idx,
		@RequestParam(value = "class_idx", defaultValue="1")int class_idx){
		
		HashMap map = new HashMap();
		mp_EvalDTO evalInfo = evDao.mpEvalInfo(stu_idx, class_idx);
		
		map.put("evalInfo", evalInfo);
		return cs.getJsonResponse(map);
	}
	
	@RequestMapping(value="/mp_teacher_eval_list.do", method=RequestMethod.GET)
	public ResponseEntity<String> mpTeacherEvalList(
			@RequestParam(value="searchText", defaultValue="")String searchText){
		
		List<mp_EvalDTO> evalList = evDao.mpTeacherEvalList(searchText);
		
		HashMap map = new HashMap();
		map.put("evalList", evalList);
		
		return cs.getJsonResponse(map);
	}
	
	@RequestMapping(value = "/mp_evalAvgInfo.do",
			method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<String> mpEvalAvgInfo(
		@RequestParam(value = "class_idx", defaultValue="1")int class_idx){
		
		HashMap map = new HashMap();
		mp_EvalDTO evalInfo = evDao.mpEvalAvgInfo(class_idx);
		
		map.put("evalInfo", evalInfo);
		
		return cs.getJsonResponse(map);
	}
	
}
