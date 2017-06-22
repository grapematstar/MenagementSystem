package gyum_02.my_student.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.my_student.model.*;
import java.util.*;

@Controller
public class my_stu_LetterController {
	
	@Autowired
	my_stu_LetterDAO my_stu_letterDao;
	
	@RequestMapping("/open_letter_box.do")
	public ModelAndView open_letter_box(HttpSession session,
					@RequestParam(value="cp",defaultValue="1")int cp){
		
		ModelAndView mav = new ModelAndView("mypage/my_letter/my_letter_box");
		
		String mem_id = (String)session.getAttribute("id");
		if(mem_id==null||mem_id.equals("")){
			mav.addObject("msg","로그인을 해주세요");
			return mav;
		}
		
		int totalLetter = my_stu_letterDao.getTotalLetter(mem_id);
		List<my_stu_LetterDTO> letterList = my_stu_letterDao.getMyLetter(mem_id, cp);
		List<Integer> noreadlist = my_stu_letterDao.getNoReadLetterList(mem_id, cp);
		
		int totalCnt = 1;
		if(totalLetter!=0) totalCnt = totalLetter;
		
		mav.addObject("letterList", letterList);
		mav.addObject("noreadlist", noreadlist);
		mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("open_letter_box.do", totalCnt, 5, 5, cp));
		
		return mav;
	}
	
	@RequestMapping("/my_letter_show_content.do")
	public ModelAndView my_letter_show_content(@RequestParam(value="letter_idx", defaultValue="0")int letter_idx,
							@RequestParam(value="noread", defaultValue="read")String noread){
		ModelAndView mav = new ModelAndView();
		
		if(letter_idx==0){
			mav.setViewName("mypage/my_letter/my_letter_box");
			mav.addObject("msg", "존재하지 않는 페이지입니다");
			return mav;
		}
		
		if(noread.equals("noread")){
			my_stu_letterDao.readLetter(letter_idx);
		}
		
		my_stu_LetterDTO letterdto = my_stu_letterDao.getOneLetter(letter_idx);
		
		mav.setViewName("mypage/my_letter/my_letter_show");
		mav.addObject("letter", letterdto);
		return mav;
	}
	
	@RequestMapping("/my_send_letter_show_content.do")
	public ModelAndView my_send_letter_show_content(@RequestParam(value="letter_idx", defaultValue="0")int letter_idx){
		ModelAndView mav = new ModelAndView();
		
		if(letter_idx==0){
			mav.setViewName("mypage/my_letter/my_letter_box");
			mav.addObject("msg", "존재하지 않는 페이지입니다");
			return mav;
		}
				
		my_stu_LetterDTO letterdto = my_stu_letterDao.getOneLetter(letter_idx);
		
		mav.setViewName("mypage/my_letter/my_send_letter_show");
		mav.addObject("letter", letterdto);
		return mav;
	}
	
	@RequestMapping("/get_my_noread_letter_num.do")
	public ModelAndView get_my_noread_letter_num(HttpSession session){

		ModelAndView mav = new ModelAndView("yongJson");
		String id = (String)session.getAttribute("id");
		if(id==null||id.equals("")){
			mav.addObject("msg", "로그인을 해주세요");
			return mav;
		}
		
		int letternum = my_stu_letterDao.noReadLetterNumber(id);
		mav.addObject("letternum", letternum);
		return mav;
	}
	
	@RequestMapping("/write_letter_back.do")
	public ModelAndView my_letter_write_back(HttpSession session,
							@RequestParam(value="letter_sender",defaultValue="noletter_sender")String letter_sender){
		
		ModelAndView mav = new ModelAndView("mypage/my_letter/my_letter_write");
		
		if(session.getAttribute("idx")==null||letter_sender.equals("noletter_sender")){
			mav.addObject("msg", "잘못된 접근입니다");
			return mav;
		}
				
		mav.addObject("sendee", letter_sender);
		return mav;
	}
	
	@RequestMapping("/my_letter_send.do")
	public ModelAndView my_letter_send_back(HttpSession session,
						my_stu_LetterDTO letterdto){
		ModelAndView mav = new ModelAndView("mypage/my_letter/my_letter_box");
		
		if(session.getAttribute("idx")==null){
			mav.addObject("msg", "잘못된 접근입니다");
			return mav;
		}
		
		String sender = (String)session.getAttribute("id");
		letterdto.setLetter_sender(sender);
		
		my_stu_letterDao.sendLetter(letterdto);
		mav.addObject("success", "쪽지를 보냈습니다");
		mav.addObject("noreadlist", 0);
		return mav;
	}
	
	@RequestMapping("/my_send_letterList.do")
	public ModelAndView my_send_letterList(HttpSession session,
						@RequestParam(value="cp",defaultValue="1")int cp){
		
		ModelAndView mav = new ModelAndView("mypage/my_letter/my_letter_box_send");
		
		String mem_id = (String)session.getAttribute("id");
		if(mem_id==null||mem_id.equals("")){
			mav.addObject("msg","로그인을 해주세요");
			return mav;
		}
		
		int totalLetter = my_stu_letterDao.getTotalSendLetter(mem_id);
		List<my_stu_LetterDTO> letterList = my_stu_letterDao.getMySendLetter(mem_id, cp);
		
		int totalCnt = 1;
		if(totalLetter!=0) totalCnt = totalLetter;
		
		mav.addObject("letterList", letterList);
		mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_send_letterList.do", totalCnt, 5, 5, cp));
		
		return mav;
	}
}
