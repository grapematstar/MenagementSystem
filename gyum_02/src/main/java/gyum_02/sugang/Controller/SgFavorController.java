package gyum_02.sugang.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.style.DefaultValueStyler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.member.model.My_memberStudentDAO;
import gyum_02.sugang.model.SgFavorDAO;
import gyum_02.sugang.model.SgFavorDTO;
import gyum_02.sugang.model.StudentInfoDTO;
import gyum_02.sugang.model.SugangDAO;
import gyum_02.sugang.model.SugangDTO;

@Controller
public class SgFavorController {

	@Autowired
	private SugangDAO sugangDao;
	
	@Autowired
	private SgFavorDAO sgFavorDao;

	
	@RequestMapping("/sg_favorcartview.do")
	public ModelAndView sgFavorView(HttpSession sgsession){
		ModelAndView mav = new ModelAndView();
		String id = (String)sgsession.getAttribute("id");
		if(!(id==null||id.equals(""))){
			String usergrade = (String)sgsession.getAttribute("usergrade");
			if(usergrade.equals("student")||usergrade.equals("master")){
				if(usergrade.equals("student")){
					int user_idx = sugangDao.userIdxSearch(id);
					List<SgFavorDTO> sgFavorList = sgFavorDao.sgFavorList(user_idx);
					List<StudentInfoDTO> stuList = sugangDao.stuList(id);
					mav.addObject("sgFavorList", sgFavorList);
					mav.addObject("stuList", stuList);
					mav.setViewName("sugang/sg_favorCart");
				} else {
					List<SgFavorDTO> sgFavorList = null;
					List<StudentInfoDTO> stuList = null;
					
					mav.addObject("sgFavorList", sgFavorList);
					mav.addObject("stuList", stuList);
					mav.setViewName("sugang/sg_favorCart");
				}
			} else {
				mav.addObject("msg", "학생 또는 관리자만 접근 가능합니다.");
				mav.addObject("locationOrder", "index.do");
				mav.setViewName("sugang/sgMsg");
			}
		} else {
			mav.addObject("msg", "로그인이 필요합니다.");
			mav.addObject("locationOrder", "index.do");
			mav.setViewName("sugang/sgMsg");
		}
		return mav;
	}
	
	@RequestMapping(value="/sg_favorcartIns.do", method=RequestMethod.GET)
	public ModelAndView sgFavorInsert(HttpSession sgsession,
			@RequestParam(value="checkArray[]", defaultValue="0")List<String> paramList){
		String id = (String)sgsession.getAttribute("id");
		int user_idx = sugangDao.userIdxSearch(id);
		sgFavorDao.sgFavorInsert(user_idx, paramList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sugang/sg_index");
		return mav;
	}
	
	@RequestMapping(value="/sg_favorcartDel.do", method=RequestMethod.GET)
	public ModelAndView sgFavorDelete(HttpSession sgsession,
			@RequestParam(value="checkArray[]", defaultValue="0")List<String> paramList){
		String id = (String)sgsession.getAttribute("id");
		int user_idx=sugangDao.userIdxSearch(id);
		sgFavorDao.sgFavorDelete(user_idx,paramList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sugang/sg_index");
		return mav;
	}
	
}
