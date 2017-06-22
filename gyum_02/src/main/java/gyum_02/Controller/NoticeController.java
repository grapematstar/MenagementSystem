package gyum_02.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.notice.model.*;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO noticeDao;


	@RequestMapping("notice.do")
	public ModelAndView noticeView(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int total = noticeDao.getTotal("notice_");
		total = total == 0 ? 1 : total;
		int listSize = 10;
		int pageSize = 5;
		List<NoticeDTO> list = noticeDao.notice_List(cp, listSize);
		String pageStr = gyum_02.paging.Paging_PageModule.pageMake_sh("notice.do", total, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView("main/main_notice/main_notice_List");
		mav.addObject("list", list);
		mav.addObject("page", pageStr);
		return mav;
	}
	
	@RequestMapping("notice_go.do")
	public ModelAndView noticeGo(@RequestParam(value = "cp", defaultValue = "1") int cp, @RequestParam(value = "sel", defaultValue="notice_") String sel) {
		int total = noticeDao.getTotal(sel);
		total = total == 0 ? 1 : total;
		int listSize = 10;
		int pageSize = 5;
		List<NoticeDTO> list = noticeDao.notice_List(cp, listSize);
		String pageStr = gyum_02.paging.Paging_PageModule.pageMake_sh("notice_go.do", total, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView("masterpage/mp_notice/mp_notice_List");
		mav.addObject("list", list);
		mav.addObject("page", pageStr);
		mav.addObject("sel", sel);
		return mav;
	}

	@RequestMapping("t_n_go.do")
	public ModelAndView t_noticeGo(@RequestParam(value = "cp", defaultValue = "1") int cp, @RequestParam(value = "sel", defaultValue="t_n_") String sel) {
		int total = noticeDao.getTotal(sel);
		total = total == 0 ? 1 : total;
		int listSize = 10;
		int pageSize = 5;
		List<Teacher_NoticeDTO> list = noticeDao.t_n_List(cp, listSize);
		String pageStr = gyum_02.paging.Paging_PageModule.pageMake_sh("t_n_go.do", total, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView("masterpage/mp_notice/mp_t_n_List");
		mav.addObject("list", list);
		mav.addObject("page", pageStr);
		mav.addObject("sel", sel);
		return mav;
	}
	
	@RequestMapping(value = "noticeWrite.do", method = RequestMethod.GET)
	public ModelAndView noticeWritego(String sel) {
		ModelAndView mav = new ModelAndView("masterpage/mp_notice/mp_"+sel+"Write", "sel", sel);
		return mav;
	}
	
	@RequestMapping(value = "notice_Write.do", method = RequestMethod.POST)
	public ModelAndView notice_Write(NoticeDTO dto) {
		int result = noticeDao.notice_Write(dto);
		String msg = "";
		msg = result > 0 ? "등록되었습니다" : "등록실패";
		ModelAndView mav = new ModelAndView("masterpage/mp_notice/mp_noticeMsg", "msg", msg);
		
		return mav;
	}
	
	@RequestMapping(value = "t_n_Write.do", method = RequestMethod.POST)
	public ModelAndView t_n_Write(Teacher_NoticeDTO tdto) {
		int result = noticeDao.t_n_Write(tdto);
		String msg = "";
		msg = result > 0 ? "등록되었습니다" : "등록실패";
		ModelAndView mav = new ModelAndView("masterpage/mp_notice/mp_noticeMsg", "msg", msg);

		return mav;
	}
	
	@RequestMapping(value = "notice_UpdateGo.do", method = RequestMethod.GET)
	public ModelAndView notice_Updatego(@RequestParam(value="idx", defaultValue="0")int idx) {
		NoticeDTO con = noticeDao.notice_Content(idx);
		ModelAndView mav = new ModelAndView();
		if(con==null) {
			mav.addObject("msg", "삭제됐거나 잘못된 경로입니다.");
			mav.setViewName("masterpage/mp_notice/mp_noticeMsg");
		} else {
			mav.addObject("dto", con);
			mav.setViewName("masterpage/mp_notice/mp_notice_Write");
		}
		return mav;
	}
	
	@RequestMapping(value = "t_n_UpdateGo.do", method = RequestMethod.GET)
	public ModelAndView t_n_Updatego(@RequestParam(value="idx", defaultValue="0")int idx) {
		Teacher_NoticeDTO con = noticeDao.t_n_Content(idx);
		ModelAndView mav = new ModelAndView();
		if(con==null) {
			mav.addObject("msg", "삭제됐거나 잘못된 경로입니다.");
			mav.setViewName("masterpage/mp_notice/mp_noticeMsg");
		} else {
			mav.addObject("dto", con);
			mav.setViewName("masterpage/mp_notice/mp_t_n_Write");
		}
		return mav;
	}

	@RequestMapping(value = "notice_Update.do", method = RequestMethod.POST)
	public ModelAndView notice_Update(NoticeDTO dto) {
		int result = noticeDao.notice_Update(dto);
		String msg = result > 0 ? "수정되었습니다." : "수정실패";
		ModelAndView mav = new ModelAndView("masterpage/mp_notice/mp_noticeMsg", "msg", msg);
		return mav;
	}

	@RequestMapping(value = "t_n_Update.do", method = RequestMethod.POST)
	public ModelAndView t_n_Update(Teacher_NoticeDTO dto) {
		int result = noticeDao.t_n_Update(dto);
		String msg = result > 0 ? "수정되었습니다." : "수정실패";
		ModelAndView mav = new ModelAndView("masterpage/mp_notice/mp_noticeMsg", "msg", msg);
		return mav;
	}
	
	@RequestMapping("notice_Content.do")
	public ModelAndView notice_Content(@RequestParam(value="idx", defaultValue="0")int idx) {
		NoticeDTO con = noticeDao.notice_Content(idx);
		ModelAndView mav = new ModelAndView();
		if(con==null) {
			mav.addObject("msg", "삭제됐거나 잘못된 경로입니다.");
			mav.setViewName("masterpage/mp_notice/mp_noticeMsg");
		} else {
			mav.addObject("dto", con);
			mav.setViewName("main/main_notice/main_notice_Content");
		}
		return mav;
	}

	@RequestMapping("t_n_Content.do")
	public ModelAndView t_n_Content(@RequestParam(value="idx", defaultValue="0")int idx) {
		Teacher_NoticeDTO con = noticeDao.t_n_Content(idx);
		ModelAndView mav = new ModelAndView();
		if(con==null) {
			mav.addObject("msg", "삭제됐거나 잘못된 경로입니다.");
			mav.setViewName("masterpage/mp_notice/mp_noticeMsg");
		} else {
			mav.addObject("dto", con);
			mav.setViewName("main/main_notice/main_noticeContent");
		}
		return mav;
	}
	
	@RequestMapping("noticeDel.do")
	public ModelAndView noticeDel(int idx, String sel) {
		int result = noticeDao.noticeDel(idx, sel);
		String msg = result > 0? "삭제되었습니다." : "삭제실패";
		ModelAndView mav = new ModelAndView("masterpage/mp_notice/mp_noticeMsg", "msg", msg);
		return mav;
	}
}
