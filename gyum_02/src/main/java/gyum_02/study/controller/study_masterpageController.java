package gyum_02.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.study.model.createStudyDAO;
import gyum_02.study.model.study_bbsDAO;

@Controller
public class study_masterpageController {

	@Autowired
	private createStudyDAO createStudyDao;
	
	@RequestMapping("/study_masterpagego.do")
	public String study_masterpagego(){
		return "study/masterpage/study_masterpage";
	}
	@RequestMapping("/studyroom_masterpagego.do")
	public String studyroom_masterpagego(){
		return "study/masterpage/studyroom_masterpage";
	}
   @RequestMapping("/study_CloseOrStart.do")
   public ModelAndView study_CloseOrStart(int study_idx,int study_situ){
      ModelAndView mav = new ModelAndView();
      int situ=0;
      if(study_situ==0){
         situ=1;
      }else{
         situ=0; 
      }
      int result = createStudyDao.study_CloseOrStart(study_idx,situ);
      String msg=result>0?"변경됨":"변경안됨";
      mav.addObject("msg",msg);
      mav.setViewName("yongJson");
      return mav; 
   }
}
