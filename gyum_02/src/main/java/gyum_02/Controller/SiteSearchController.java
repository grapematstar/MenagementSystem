package gyum_02.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.main_Search.model.*;
import gyum_02.member.model.My_memberTeacherDTO;
import gyum_02.mypage.model.My_ClassDTO;
import gyum_02.mypage.model.My_QnaDTO;
import gyum_02.Freebbs.model.FreebbsDTO;
import gyum_02.cybercampus.Model.CC_EpilogueDTO;
import gyum_02.notice.model.NoticeDTO;
import gyum_02.study.model.createStudyDTO;


@Controller
public class SiteSearchController {
	
	@Autowired
	private SearchDAO searchDao;
	
	@RequestMapping("searchgo.do")
	public String siteSearchgo () {
		return "main/main_siteWholeSearch/main_siteSearch_index";
	}
	
	@RequestMapping(value="search.do", method=RequestMethod.POST)
	public ModelAndView siteSearch (@RequestParam(value="searchSelect", defaultValue="0") int ss, String word, @RequestParam(value="ls", defaultValue="5") int ls) {

		ModelAndView mav = new ModelAndView();
		word ="%"+word+"%";
		List<My_ClassDTO> classparam = searchDao.classSearch(ls, word, ss);
		List<My_memberTeacherDTO> teacherparam = searchDao.teacherSearch(word, ss);
		List<CC_EpilogueDTO> classreviewparam = searchDao.classReviewSearch(word, ss);
		List<FreebbsDTO> freebbsparam = searchDao.freebbsSearch(word, ss);
		List<NoticeDTO> noticeparam = searchDao.noticeSearch(word, ss);
		mav = searchresult (classparam, teacherparam, classreviewparam, freebbsparam, noticeparam, ls);
		return mav;
	}
	
	public ModelAndView searchresult (List<My_ClassDTO> mcdto, List<My_memberTeacherDTO> tdto , List<CC_EpilogueDTO> crdto, List<FreebbsDTO> fbdto, List<NoticeDTO> ndto, int ls) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mcdto", mcdto);
		mav.addObject("tdto", tdto);
		mav.addObject("crdto", crdto);
		mav.addObject("fbdto", fbdto);
		mav.addObject("ndto", ndto);
		if(ls!=5){
			mav.addObject("ls", ls);
		}
		mav.setViewName("main/main_siteWholeSearch/main_siteSearch_result");
		
		return mav;
	}

}
