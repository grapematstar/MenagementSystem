
package gyum_02.masterpage.Controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.masterpage.model.*;
import oracle.sql.DATE;

@Controller
public class Mp_member_send_letterController {

	@Autowired
	private LetterDAO letterDao;
	@Autowired
	private ClassDAO classDao;
	@Autowired
	private Class_studentDAO class_studentDao;
	@Autowired
	private StudentDAO studentDao;
	@Autowired
	private TeacherDAO teacherDao;
	
	//쪽지보내기로 이동
	@RequestMapping("/mp_member_send_notice_letter.do")
	public ModelAndView mp_member_send_notice_letter(){
		List<ClassDTO> list = classDao.mp_c_allList();
		ModelAndView mav=new ModelAndView("masterpage/mp_member/mp_member_send_member_list","list",list);
		return mav;
	}
	
	

	/*****************보낸쪽지함****************************************************/	
	//ajax : 보낸쪽지 목록 불러오기
	@RequestMapping("/mp_letter_list_of_master_onload.do")
	public ModelAndView mp_letter_list_of_master_onload(@RequestParam(value="cp",defaultValue="1")int cp){
		int total = letterDao.mp_letter_totalCnt();
		int ls=10;
		int ps=5;
		List<LetterDTO> letterList = letterDao.mp_letter_allList(cp,ls);
/*		List<Integer> idxlist = letterDao.mp_letter_dateCheck(letterList.get(0).getLetter_senddate(),letterList.get(letterList.size()-1).getLetter_senddate());*/
		ModelAndView mav = new ModelAndView();
		String page=Seongyun_PageModule.pageMake(" letterList", total, ls, ps, cp);
		mav.addObject("page",page);
		/*mav.addObject("idxlist",idxlist);*/
		mav.addObject("letterList",letterList);
		mav.setViewName("yongJson");
		return mav;
	}
	//쪽지내용보기
	@RequestMapping("/mp_letter_content.do")
	public ModelAndView mp_letter_content(int letter_idx){
		LetterDTO content=letterDao.mp_letter_content(letter_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("content",content);
		mav.setViewName("yongJson");
		return mav;
	}
/*****************쪽지보내기****************************************************/	
	//회원리스트 뽑아내기
		/*회원 종류 별 메소드*/
		@RequestMapping("/mp_member_letter_list.do")
		public ModelAndView mp_member_letter_list(
				@RequestParam(value="key") String key,
				@RequestParam(value="cp", defaultValue="1")int cp,
				@RequestParam(value="functionName", defaultValue=" ")String functionName){
			ModelAndView mav = new ModelAndView();
			List<StudentDTO> slist=new ArrayList<StudentDTO>();
			List<TeacherDTO> tlist=new ArrayList<TeacherDTO>();
			List<Object> totalList=new ArrayList<Object>();
			List<Object> resultList=new ArrayList<Object>();
			int listSize = 10;
			int pageSize = 5;
			int totalCnt = 0;
			int startNum = (cp-1)*listSize+1;
			int endNum = cp*listSize;
			
			if(key.equals("all")){
				slist=studentDao.mp_student_allList();
				tlist=teacherDao.mp_teacher_allList();
				totalCnt = slist.size()+tlist.size();
				
				for(int i=0; i<slist.size(); i++){
					totalList.add((Object)slist.get(i));
				}
				for(int i=0; i<tlist.size(); i++){
					totalList.add((Object)tlist.get(i));
				}
				for (int i = startNum-1; i < endNum; i++) {
					if(i<totalList.size()) resultList.add(totalList.get(i));
				}
//				mav.addObject("slist",slist);
//				mav.addObject("tlist",tlist);
			}else if(key.equals("tea")){
				tlist=teacherDao.mp_teacher_allList();
				for (int i = startNum-1; i < endNum; i++) {
					if(i<tlist.size()) resultList.add(tlist.get(i));
				}
				totalCnt = tlist.size();
		//		mav.addObject("tlist",tlist);
			}else if(key.equals("stu")){
				slist=studentDao.mp_student_allList();
				for (int i = startNum-1; i < endNum; i++) {
					if(i<slist.size()) resultList.add(slist.get(i));
				}
				totalCnt = slist.size();
		//		mav.addObject("slist",slist);
			}else{
				mav.addObject("msg","잘못된 key가 인식됨!");
			}
			mav.addObject("resultList",resultList);
			
			String page = Seongyun_PageModule.mp_pageMakeCustom(functionName, totalCnt, 
					listSize, pageSize, cp);
			mav.addObject("page",page);
			mav.setViewName("yongJson");
			
			return mav;
		}
		/*과목 별 메소드*/
		@RequestMapping("/mp_member_letter_list_with_sub.do")
		public ModelAndView mp_member_letter_list_with_sub(
				@RequestParam(value="s_num", defaultValue="1")int s_num,
				@RequestParam(value="cp", defaultValue="1")int cp,
				@RequestParam(value="functionName", defaultValue=" ")String functionName){
			
			List<Object> totalList=new ArrayList<Object>();
			List<Object> resultList=new ArrayList<Object>();
			int listSize = 10;
			int pageSize = 5;
			int totalCnt = 0;
			int startNum = (cp-1)*listSize+1;
			int endNum = cp*listSize;
			
			ModelAndView mav = new ModelAndView();
			List<TeacherDTO> tlist = teacherDao.mp_teacher_subject(s_num);
			mav.addObject("tlist",tlist);
			List<StudentDTO> slist = new ArrayList<StudentDTO>();
			try{
				List<ClassDTO> classidx = classDao.mp_c_select_with_sn(s_num);
				if(classidx.size()>0){
					int class_idx = classidx.get(0).getClass_idx();
					List<Class_studentDTO> stuidx = class_studentDao.mp_cs_stu_idx(class_idx);
					if(stuidx.size()>0){
						for(int i=0; i<stuidx.size(); i++){
							int stu_idx = stuidx.get(i).getStu_idx();
							List<StudentDTO> slist2 = studentDao.mp_student_info(stu_idx);
							if(slist2.size()>0){
								StudentDTO sdto = new StudentDTO();
								String stu_id = slist2.get(0).getStu_id();
								String stu_name = slist2.get(0).getStu_name();
								sdto.setStu_id(stu_id);
								sdto.setStu_name(stu_name);
								slist.add(sdto);
							}
						}
					}
				}
			}catch(Exception e){}
			
			totalCnt = slist.size()+tlist.size();
			
			for(int i=0; i<slist.size(); i++){
				totalList.add((Object)slist.get(i));
			}
			for(int i=0; i<tlist.size(); i++){
				totalList.add((Object)tlist.get(i));
			}
			for (int i = startNum-1; i < endNum; i++) {
				if(i<totalList.size()) resultList.add(totalList.get(i));
			}
			
			mav.addObject("resultList",resultList);
			
			String page = Seongyun_PageModule.mp_pageMakeCustom(functionName, totalCnt, 
					listSize, pageSize, cp);
			mav.addObject("page",page);
			
			mav.addObject("slist",slist);//포문돌아가고 있는데 그냥 계속 초기화 한거 =10 , =9 이런식으로 아하,,,그래서 1개만 나오느거
			mav.setViewName("yongJson");
			return mav;
		}
		/*강의 별 메소드*/
		@RequestMapping("/mp_member_letter_list_with_class.do")
		public ModelAndView mp_member_letter_list_with_class(
				@RequestParam(value="c_idx", defaultValue="1")int c_idx,
				@RequestParam(value="cp", defaultValue="1")int cp,
				@RequestParam(value="functionName", defaultValue=" ")String functionName){
			ModelAndView mav = new ModelAndView();
			
			int listSize = 10;
			int pageSize = 5;
			int totalCnt = 0;
			int startNum = (cp-1)*listSize+1;
			int endNum = cp*listSize;
			List<Object> totalList=new ArrayList<Object>();
			List<Object> resultList=new ArrayList<Object>();
			
			
			List<TeacherDTO> tlist = new ArrayList<TeacherDTO>();
			List<TeacherDTO> tlist2 = new ArrayList<TeacherDTO>();
			List<ClassDTO> teaidx = classDao.mp_c_select(c_idx);
			if(teaidx.size()>0){
				int tea_idx = teaidx.get(0).getTea_idx();
				tlist2 = teacherDao.mp_teacher_info(tea_idx);
				if(tlist2.size()>0){
					String tea_id = tlist2.get(0).getTea_id();
					String tea_name = tlist2.get(0).getTea_name();
					TeacherDTO tdto = new TeacherDTO();
					tdto.setTea_id(tea_id);
					tdto.setTea_name(tea_name);
					tlist.add(tdto);
				}
			}
			mav.addObject("tlist",tlist);
			List<StudentDTO> slist2 = new ArrayList<StudentDTO>();
			List<StudentDTO> slist = new ArrayList<StudentDTO>();
			List<Class_studentDTO> stuidx = class_studentDao.mp_cs_stu_idx(c_idx);
			if(stuidx.size()>0){
				for(int i=0; i<stuidx.size(); i++){
					int stu_idx = stuidx.get(i).getStu_idx();
					slist2 = studentDao.mp_student_info(stu_idx);
					if(slist2.size()>0){
						String stu_id = slist2.get(0).getStu_id();
						String stu_name = slist2.get(0).getStu_name();
						StudentDTO sdto = new StudentDTO();
						sdto.setStu_id(stu_id);
						sdto.setStu_name(stu_name);
						slist.add(sdto);
					}
				}
			}
			
			for(int i=0; i<slist.size(); i++){
				totalList.add((Object)slist.get(i));
			}
			for(int i=0; i<tlist.size(); i++){
				totalList.add((Object)tlist.get(i));
			}
			for (int i = startNum-1; i < endNum; i++) {
				if(i<totalList.size()) resultList.add(totalList.get(i));
			}
			totalCnt = slist.size()+tlist.size();
			mav.addObject("resultList",resultList);
			String page = Seongyun_PageModule.mp_pageMakeCustom(functionName, totalCnt, 
					listSize, pageSize, cp);
			mav.addObject("page",page);
			
			mav.addObject("slist",slist);
			mav.setViewName("yongJson");
			return mav;
		}
	//쪽지 쓰는 폼, 쪽지 발송
	@RequestMapping("/mp_member_sending_notice_letter.do")
	public ModelAndView mp_member_sending_notice_letter(Letter_id_arrDTO arrdto){
		ModelAndView mav = new ModelAndView();
		int result = 0;
		int arrdtosize = 0;
		String noMember="";
		LetterDTO ldto = new LetterDTO();
		try{
			arrdtosize = arrdto.getLetterdto().size();
			if(arrdtosize > 0){
				for(int i=0; i<arrdtosize; i++){
					String letter_sendee = arrdto.getLetterdto().get(i).getLetter_sendee();
					if(letter_sendee==null || letter_sendee.equals("") || letter_sendee.equals("-")){
						noMember = letter_sendee+"님은 비회원 입니다.";
					}else{
						String letter_subject = arrdto.getLetterdto().get(0).getLetter_subject();
						String letter_content = arrdto.getLetterdto().get(0).getLetter_content();
						String letter_sender = arrdto.getLetterdto().get(0).getLetter_sender();
						ldto.setLetter_sendee(letter_sendee);
						ldto.setLetter_subject(letter_subject);
						ldto.setLetter_content(letter_content);
						ldto.setLetter_sender(letter_sender);					
						Date d=Date.valueOf("1000-01-01");
						ldto.setLetter_readdate(d);
						result += letterDao.mp_letter_insert(ldto);
					}
				}
			}
		}catch(NullPointerException e){}
		String msg=result==arrdtosize?"발송!":"발송실패";
		mav.addObject("msg",msg);
		mav.addObject("noMember",noMember);
		mav.setViewName("masterpage/mp_member/mp_member_msg(letter)");
		return mav;
	}
}