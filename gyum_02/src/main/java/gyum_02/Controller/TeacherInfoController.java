package gyum_02.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.cybercampus.Model.CC_EpilogueDTO;
import gyum_02.main_TeacherInfo.Model.TeacherInfoDAO;
import gyum_02.member.model.My_memberTeacherDTO;
import gyum_02.mypage.model.My_ClassDTO;

@Controller
public class TeacherInfoController {

	@Autowired
	private TeacherInfoDAO teacherInfoDao;
	
	@RequestMapping("teacherInfoListGo.do")
	public ModelAndView teacherInfoList(@RequestParam(value = "cp", defaultValue = "1") int cp, @RequestParam(value="sub", defaultValue="1") int sub) {
		int total = teacherInfoDao.teacherGetTotal(sub);
		total = total == 0 ? 1 : total;
		int ls = 9;
		int ps = 5;
		List<My_memberTeacherDTO> list = teacherInfoDao.teacherInfoList(cp, ls, sub);
		
		String pageStr = gyum_02.paging.Paging_PageModule.replyPageMake("freebbsList.do", total, ls, ps, cp, "sub", sub);
		ModelAndView mav = new ModelAndView("main/main_teacherInfo/main_teacherInfo_list");
		mav.addObject("list", list);
		mav.addObject("page", pageStr);
		mav.addObject("sub", sub);
		return mav;
	}
	
	@RequestMapping("teacherInfoContentGo.do")
	public ModelAndView teacherInfoContent(@RequestParam(value="idx", defaultValue = "0")int idx, 
										   @RequestParam(value="sub", defaultValue="0") int sub,
										   @RequestParam(value="cp", defaultValue="1") int cp) {
		
		ModelAndView mav = new ModelAndView("main/main_teacherInfo/main_teacherInfo_content");
				
		My_memberTeacherDTO teacherdto = teacherInfoDao.teacherInfoContent(idx);
		List<My_ClassDTO> nowclass = teacherInfoDao.nowClassContentList(idx);
		List<My_ClassDTO> lastclass=teacherInfoDao.lastClassContent(idx);
		
		List<CC_EpilogueDTO> lastepil = null;
		
		if(lastclass.size()!=0){
			int listSize = 5;
			lastepil = teacherInfoDao.epilContent(cp, listSize, lastclass);
			int totalCnt = teacherInfoDao.totalLastEpil(lastclass);
			int pageSize = 5;
			String key = "idx";
			String value = idx+"&sub="+sub;
			String pageStr = gyum_02.paging.Paging_PageModule.shPageMake("teacherInfoContentGo.do", totalCnt, listSize, pageSize, cp, key, value);
			mav.addObject("pageStr", pageStr);
		}

		mav.addObject("lastepil", lastepil);
		mav.addObject("nowclass", nowclass);
		mav.addObject("teacherdto", teacherdto);
		mav.addObject("lastclass", lastclass);
		
		return mav;
	}
	
	@RequestMapping("teacherClassContentGo.do")
	public ModelAndView classInfoContent(@RequestParam(value="cp", defaultValue="1") int cp, int class_idx) {
		int total = teacherInfoDao.nowepilGetTotal(class_idx);
		total = total == 0 ? 1 : total;
		int ls = 9;
		int ps = 5;
		My_ClassDTO cdto = teacherInfoDao.nowClassContent(class_idx);
		My_memberTeacherDTO teadto = teacherInfoDao.teacherInfoContent(cdto.getTea_idx());
		
		List<CC_EpilogueDTO> elist = teacherInfoDao.nowepilContent(cp, ls, class_idx);
		ModelAndView mav=new ModelAndView("main/main_teacherInfo/main_classInfo_content");
		String pageStr = gyum_02.paging.Paging_PageModule.replyPageMake("teacherClassContentGo.do", total, ls, ps, cp, "class_idx", class_idx);
		mav.addObject("cdto", cdto);
		mav.addObject("elist", elist);
		mav.addObject("pageStr", pageStr);
		mav.addObject("teadto", teadto);
		return mav;
	}
	
}
