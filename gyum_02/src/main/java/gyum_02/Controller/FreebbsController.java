package gyum_02.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.Freebbs.model.*;

@Controller
public class FreebbsController {

	@Autowired
	private FreebbsDAO freebbsDao;
	
	@RequestMapping("freebbsList.do")
	public ModelAndView freebbsList(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int total = freebbsDao.getTotal();
		total = total == 0 ? 1 : total;
		int listsize = 10;
		int pageSize = 5;

		List<FreebbsDTO> list = freebbsDao.freebbsList(cp, listsize);
		
		String pageStr = gyum_02.paging.Paging_PageModule.pageMake_sh("freebbsList.do", total, listsize, pageSize, cp);
		ModelAndView mav = new ModelAndView("main/main_freebbs/freebbsList");
		mav.addObject("list", list);
		mav.addObject("page", pageStr);
		return mav;
	}

	@RequestMapping(value = "freebbsWrite.do", method = RequestMethod.GET)
	public String bbsWritego(@RequestParam(value="idx", defaultValue="0") int idx) {
		return "main/main_freebbs/freebbsWrite";
	}

	@RequestMapping(value = "freebbsWrite.do", method = RequestMethod.POST)
	public ModelAndView bbsWrite(FreebbsDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		if(dto.getF_b_reply()>0) {
			result = freebbsDao.freebbsWrite(dto);
			mav = bbscontent(dto.getF_b_idx(), 1);
		} else if (dto.getF_b_reply()==0) {
			if(dto.getF_b_idx()>0){
				result = freebbsDao.freebbsUpdate(dto);
			} else {
				result = freebbsDao.freebbsWrite(dto);
			}
			String msg = result > 0 ? "등록성공" : "등록실패";
			mav.addObject("msg", msg);
			mav.setViewName("main/main_freebbs/freebbsMsg");
		}
		return mav;
	}

	@RequestMapping("freebbsContent.do")
	public ModelAndView bbscontent(@RequestParam(value="idx", defaultValue="0")int idx, @RequestParam(value="cp", defaultValue="1")int cp) {
		FreebbsDTO con = freebbsDao.freebbsContent(idx);
		ModelAndView mav = new ModelAndView();
		if(con==null) {
			mav.addObject("msg", "잘못된경로");
			mav.setViewName("main/main_freebbs/freebbsMsg");
		} else {
			int total = freebbsDao.getTotalRep(idx);
			total = total == 0 ? 1 : total;
			int listsize = 10;
			int pageSize = 5;
			List<FreebbsDTO> list = freebbsDao.freebbsReply(cp, listsize, idx);
			List<FreebbsDTO> pagemove = freebbsDao.pageMove(idx);
			String pageStr = gyum_02.paging.Paging_PageModule.replyPageMake_sh("freebbsContent.do", total, listsize, pageSize, cp, "idx", idx);
			mav.addObject("list", list);
			mav.addObject("page", pageStr);
			mav.addObject("dto", con);
			mav.addObject("pageMove", pagemove);
			mav.setViewName("main/main_freebbs/freebbsContent");
			freebbsDao.read(idx);
		}
		return mav;
	}

	@RequestMapping(value="freebbsUpdate.do", method= RequestMethod.GET)
	public ModelAndView bbsUpdateGo(int idx) {
		FreebbsDTO con = freebbsDao.freebbsContent(idx);
		
		ModelAndView mav = new ModelAndView();
		if(con==null) {
			mav.addObject("msg", "삭제됐거나 잘못 된 경로입니다.");
			mav.setViewName("main/main_freebbs/freebbsMsg");
		} else {
			mav.addObject("dto", con);
			mav.setViewName("main/main_freebbs/freebbsUpdate");
		}
		return mav;
	}
	
	@RequestMapping("freebbsDel.do")
	public ModelAndView bbsdel(int idx) {
		int count = freebbsDao.freebbsDel(idx);
		String msg = "";
		msg = count > 0 ? "삭제성공" : "삭제실패";
		ModelAndView mav = new ModelAndView("main/main_freebbs/freebbsMsg", "msg", msg);
		return mav;
	}
	
	@RequestMapping("freebbsRepDel.do")
	public ModelAndView bbsRepdel(int idx, int cidx) {
		freebbsDao.freebbsDel(idx);
		ModelAndView mav = new ModelAndView("freebbsContent.do");
		mav = bbscontent(cidx, 1);
		return mav;
	}
}
