package gyum_02.masterpage.Controller.____;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import gyum_02.masterpage.model._____.SSSSStudyroomDAO;

@Controller
@RequestMapping(value="/study/studyroom")
public class SSSSSSSSStudyroomController {
	
	@Autowired
	public SSSSStudyroomDAO dao;
	
	String folderName = "study/studyroom/";
	
	@RequestMapping("/SSSSStudyroom.do")
	public String scheduler(ModelMap model, HttpServletRequest request) throws Exception {
		
		
		return folderName+"ssstest";
	}
   
}
