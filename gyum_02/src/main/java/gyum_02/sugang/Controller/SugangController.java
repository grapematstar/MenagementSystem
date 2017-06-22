package gyum_02.sugang.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import gyum_02.sugang.model.SgFavorDAO;
import gyum_02.sugang.model.SgFavorDTO;
import gyum_02.sugang.model.StudentInfoDTO;
import gyum_02.sugang.model.SugangDAO;
import gyum_02.sugang.model.SugangDTO;

@Controller
public class SugangController {

	@Autowired
	private SugangDAO sugangDao;

	@Autowired
	private SgFavorDAO sgFavorDao;
	
	
	@RequestMapping(value="/sg_index.do", method=RequestMethod.GET)
	public ModelAndView sgIndex(HttpSession sgsession,
			@RequestParam(value="cp",defaultValue="1")int cp){
		ModelAndView mav = new ModelAndView();
		String id = (String)sgsession.getAttribute("id");
		if(!(id==null||id.equals(""))){
			String usergrade = (String)sgsession.getAttribute("usergrade");
			int totalCnt = sugangDao.classTotalCnt();
			int listSize = 5;
			int pageSize = 5;
			if(usergrade.equals("student")||usergrade.equals("master")){
				//class List	
				List<SugangDTO> sgClassList = sugangDao.sugangList(cp, listSize);
				Map<String, Object> searchMap = new HashMap<String, Object>();
				String pageStr = gyum_02.paging.Paging_PageModule.searchPaging("../gyum_02/sg_index.do", totalCnt, listSize, pageSize, cp, searchMap);
				
				//cart List
				System.out.println("받아온id : "+id);
				if(usergrade.equals("student")){
					int user_idx = sugangDao.userIdxSearch(id);
					System.out.println("user_idx : "+user_idx);
					List<SgFavorDTO> sgFavorList = sgFavorDao.sgFavorList(user_idx);
					List<StudentInfoDTO> stuList = sugangDao.stuList(id);
					
					mav.addObject("sgClassList", sgClassList);
					mav.addObject("sgFavorList", sgFavorList);
					mav.addObject("stuList", stuList);
					mav.addObject("pageStr", pageStr);
					mav.setViewName("sugang/sg_index");
				} else {
					List<SgFavorDTO> sgFavorList = null;
					List<StudentInfoDTO> stuList = null;
					
					mav.addObject("sgClassList", sgClassList);
					mav.addObject("sgFavorList", sgFavorList);
					mav.addObject("stuList", stuList);
					mav.addObject("pageStr", pageStr);
					mav.setViewName("sugang/sg_index");
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
	
	@RequestMapping(value="sg_searchkeyword.do", method=RequestMethod.GET)
	public ModelAndView sgSearchbar(
			@RequestParam(defaultValue="searchop")String searchHow,
			@RequestParam(defaultValue="")String searchWhat,
			@RequestParam(value="cp", defaultValue="1")int cp){
		Map<String, Object> searchmap = new HashMap<String, Object>();
		searchmap.put("searchHow", searchHow);
		searchmap.put("searchWhat", searchWhat);
		int totalCnt = sugangDao.searchTotalCnt(searchmap);
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize = 5;
		int pageSize = 5;
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		searchmap.put("startnum", startnum);
		searchmap.put("endnum", endnum);
		List<SugangDTO> sgClasslist = sugangDao.searchKeyword(searchmap);
		searchmap.remove("startnum");
		searchmap.remove("endnum");
		String pageStr = gyum_02.paging.Paging_PageModule.searchPaging("../gyum_02/searchkeyword.do", totalCnt, listSize, pageSize, cp, searchmap);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", searchmap);
		mav.addObject("sgClassList", sgClasslist);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("sugang/sg_index");
		return mav;
	}
	
	@RequestMapping(value="/sg_favorcartIndexIns.do", method=RequestMethod.GET)
	public ModelAndView sgFavorInsert(HttpSession sgsession,
			@RequestParam(value="checkArray[]", defaultValue="0")List<String> paramList,
			@RequestParam(value="cp",defaultValue="1")int cp){
		String id = (String)sgsession.getAttribute("id");
		int user_idx = sugangDao.userIdxSearch(id);
		int count = 0;
		count = sgFavorDao.sgFavorInsert(user_idx, paramList);
		System.out.println("카운트:"+count);
		ModelAndView mav = sgIndex(sgsession,cp);
		return mav;
	}
	
	@RequestMapping(value="/sg_favorcartIndexDel.do", method=RequestMethod.GET)
	public ModelAndView sgFavorDelete(HttpSession sgsession,
			@RequestParam(value="checkArray[]", defaultValue="0")List<String> paramList,
			@RequestParam(value="cp",defaultValue="1")int cp){
		String id = (String)sgsession.getAttribute("id");
		int user_idx=sugangDao.userIdxSearch(id);
		sgFavorDao.sgFavorDelete(user_idx,paramList);
		ModelAndView mav = sgIndex(sgsession,cp);
		return mav;
	}
}
