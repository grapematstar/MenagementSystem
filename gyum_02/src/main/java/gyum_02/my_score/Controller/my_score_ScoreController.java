package gyum_02.my_score.Controller;

import gyum_02.my_score.model.*;
import gyum_02.my_student.model.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class my_score_ScoreController {

	@Autowired
	private my_score_SchoolScoreDAO my_score_schoolscoreDao;
	
	@Autowired
	private my_score_SchoolGoalDAO my_score_schoolgoalDao;
	
	@Autowired
	private my_stu_SubjectDAO my_stu_subjectDao;
	
	@Autowired
	private my_stu_StudentDAO my_stu_studentDao;
		
	@Autowired
	private my_stu_ClassStudentDAO my_stu_classstudentDao;
	
	@Autowired
	private my_stu_ClassDAO my_stu_classDao;
	
	@Autowired
	private my_score_TeacherDAO my_score_teacherDao;
	
	@Autowired
	private my_score_StudentScoreDAO my_score_studentscoreDao;
	
	@RequestMapping("my_student_score_school.do")
	public ModelAndView my_student_score_school(HttpSession session, 
			@RequestParam(value="year", defaultValue="0000")String year){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		
		Calendar now = Calendar.getInstance();
		if(year.equals("0000")){
			year = now.get(Calendar.YEAR)+"";
		}
		int yearInt = Integer.parseInt(year);
		
		List<my_score_SchoolScoreDTO> schlist = my_score_schoolscoreDao.getSchoolScore(stu_idx, yearInt);
		Map<String, Integer> springscore = new HashMap<String, Integer>();
		Map<String, Integer> fallscore = new HashMap<String, Integer>();
		for(int i = 0; i < schlist.size(); i++){
			String sub = "";
			switch(schlist.get(i).getSubject_num()){
			case 1: sub="kor"; break;
			case 2: sub="eng"; break;
			case 3: sub="math"; break;
			case 4: sub="ss"; break;
			case 5: sub="sci"; break;
			}
			if(schlist.get(i).getS_s_s_term()==1){
				springscore.put(sub, schlist.get(i).getS_s_s_result());
			}else{
				fallscore.put(sub, schlist.get(i).getS_s_s_result());
			}
		}
		
		
		int setyear = now.get(Calendar.YEAR);
		Map<String, Object> schAllMap = new HashMap<String, Object>();		
		for(int i = setyear; i > setyear-3; i--){		
			List<my_score_SchoolScoreDTO> schAllList = my_score_schoolscoreDao.getSchoolScore(stu_idx, i);
			schAllMap.put("s"+(setyear-i+1), i+"-1");
			schAllMap.put("f"+(setyear-i+1), i+"-2");
			
			for(int term = 0; term < schAllList.size(); term++){
				String sub = "";
				switch(schAllList.get(term).getSubject_num()){
				case 1: sub="kor"; break;
				case 2: sub="eng"; break;
				case 3: sub="math"; break;
				case 4: sub="ss"; break;
				case 5: sub="sci"; break;
				}
				if(schAllList.get(term).getS_s_s_term()==1){
					schAllMap.put("s"+(setyear-i+1)+sub, schAllList.get(term).getS_s_s_result());
				}else{
					schAllMap.put("f"+(setyear-i+1)+sub, schAllList.get(term).getS_s_s_result());
				}
			}
		}
		
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 0; i < 6; i++){
			yearList.add(setyear--);
		}
		
		List<my_stu_SubjectDTO> sublist = my_stu_subjectDao.getSubjectInfo();
		
		ModelAndView mav = new ModelAndView("mypage/my_student/my_score/my_score_school");
		mav.addObject("subjectList", sublist);
		mav.addObject("year", yearList);
		mav.addObject("springscore", springscore);
		mav.addObject("fallscore", fallscore);
		mav.addObject("selectyear", year);
		mav.addObject("schAllMap", schAllMap);
		
		return mav;
	}
	
	@RequestMapping("my_student_score_class.do")
	public ModelAndView my_student_score_class(HttpSession session,
								@RequestParam(value="cp",defaultValue="1")int cp,
								@RequestParam(value="childidx", defaultValue="0")int childidx){
		
		if(session.getAttribute("idx")==null||!(((String)session.getAttribute("usergrade")).equals("student")||((String)session.getAttribute("usergrade")).equals("parent"))){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		
		if(childidx!=0){
			stu_idx = childidx;
			if((Integer)session.getAttribute("idx")!=my_stu_studentDao.getParentIdxByStudent(stu_idx)){
				ModelAndView back = new ModelAndView("mypage/my_parent/my_parent_score_class");
				back.addObject("msg", "잘못된 접근입니다");
				back.addObject("gopage", "my_parent_classScore.do");
				return back;
			}
		}		
		
		List<Integer> cilistAll = my_stu_classstudentDao.getClassIdx(stu_idx);
		
		if(cilistAll==null||cilistAll.size()==0){
			int totalCnt = 1;
			
			ModelAndView mav = new ModelAndView("mypage/my_student/my_score/my_score_class");
			mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_student_score_class.do", totalCnt, 10, 5, cp));
			return mav;
		}
		
		List<my_stu_ClassDTO> classList = my_stu_classDao.getAllStudentClassInfo(cilistAll, cp);
		
		List<Map<String, Object>> msclist = new ArrayList<Map<String, Object>>();
		for(int i = 0; i < classList.size(); i++){
			Map<String, Object> classmap = new HashMap<String, Object>();
			my_stu_ClassDTO mscdto = classList.get(i);
			if(mscdto==null) continue;
			
			classmap.put("class_idx", mscdto.getClass_idx());
			classmap.put("classdate", mscdto.getClass_startdate()+" - "+mscdto.getClass_enddate());
			classmap.put("subject_name", my_stu_subjectDao.getSub(mscdto.getSubject_num()));
			classmap.put("class_subject", mscdto.getClass_subject());
			classmap.put("teacher", my_score_teacherDao.getTeacherName(mscdto.getTea_idx()));			
			
			msclist.add(classmap);
		}
		
		List<my_stu_SubjectDTO> subjectlist = my_stu_subjectDao.getSubjectInfo();
		
		Calendar now = Calendar.getInstance();
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 0; i < 6; i++){
			yearList.add(now.get(Calendar.YEAR) - i);
		}
		
		int totalCnt = cilistAll.size();
		
		ModelAndView mav = new ModelAndView("mypage/my_student/my_score/my_score_class");
		mav.addObject("my_classList", msclist);
		mav.addObject("subjectList", subjectlist);
		mav.addObject("stu_idx", stu_idx);
		mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_student_score_class.do", totalCnt, 10, 5, cp));
		return mav;
	}
	
	@RequestMapping("/my_student_score_school_goal.do")
	public ModelAndView my_student_score_school_goal(HttpSession session, 
			@RequestParam(value="year", defaultValue="0000")String year, 
			@RequestParam(value="term", defaultValue="1")String term, 
			@RequestParam(value="subject", defaultValue="국어")String subject){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		Calendar now = Calendar.getInstance();
		if(year.equals("0000")){
			year = now.get(Calendar.YEAR)+"";
		}
		int yearInt = Integer.parseInt(year);
		List<my_score_SchoolGoalDTO> mssgList = my_score_schoolgoalDao.getSchoolGoal(stu_idx, yearInt, Integer.parseInt(term));
		Map<String, Object> goalmap = new HashMap<String, Object>();
		for(int i = 0; i < mssgList.size(); i++){
			String sub = "";
			switch(mssgList.get(i).getSubject_num()){
			case 1: sub="kor"; break;
			case 2: sub="eng"; break;
			case 3: sub="math"; break;
			case 4: sub="ss"; break;
			case 5: sub="sci"; break;
			}
			goalmap.put(sub, mssgList.get(i).getS_s_g_goal());
		}
		
		int subjectInt = my_stu_subjectDao.getSubNum(subject);
		
		List<my_score_SchoolScoreDTO> msssList = my_score_schoolscoreDao.getSchoolScoreOneTerm(stu_idx, yearInt, Integer.parseInt(term));
		Map<String, Object> scoremap = new HashMap<String, Object>();
		for(int i = 0; i < msssList.size(); i++){
			String sub = "";
			switch(msssList.get(i).getSubject_num()){
			case 1: sub="kor"; break;
			case 2: sub="eng"; break;
			case 3: sub="math"; break;
			case 4: sub="ss"; break;
			case 5: sub="sci"; break;
			}
			scoremap.put(sub, msssList.get(i).getS_s_s_result());
		}
		
		List<Integer> yearList = new ArrayList<Integer>();
		int nowyear = now.get(Calendar.YEAR);
		for(int i = 0; i < 6; i++){
			yearList.add(nowyear-i);
		}
		
		List<String> subjectList = my_stu_subjectDao.getSubAll();
		
		Map<String, Object> schAllMap = new HashMap<String, Object>();
		List<my_score_SchoolGoalDTO> schAllList = my_score_schoolgoalDao.getSchoolGoalAll(stu_idx, nowyear, subjectInt);
		for(int i = 0; i < schAllList.size(); i++){
			if(schAllList.get(i).getS_s_g_term()==1){
				schAllMap.put("s"+(nowyear-schAllList.get(i).getS_s_g_year()+1)+"goal", schAllList.get(i).getS_s_g_goal());
			}else{
				schAllMap.put("f"+(nowyear-schAllList.get(i).getS_s_g_year()+1)+"goal", schAllList.get(i).getS_s_g_goal());
			}
		}
		
		List<my_score_SchoolScoreDTO> schAllList2 = my_score_schoolscoreDao.getSchoolSubjectScore(stu_idx, nowyear, subjectInt);
		for(int i = 0; i < schAllList2.size(); i++){
			if(schAllList2.get(i).getS_s_s_term()==1){
				schAllMap.put("s"+(nowyear-schAllList2.get(i).getS_s_s_year()+1)+"sub", schAllList2.get(i).getS_s_s_result());
			}else{
				schAllMap.put("f"+(nowyear-schAllList2.get(i).getS_s_s_year()+1)+"sub", schAllList2.get(i).getS_s_s_result());
			}
		}
		
		for(int i = 1; i < 4; i++){
			schAllMap.put("s"+i, (nowyear-i+1)+"-1");
			schAllMap.put("f"+i, (nowyear-i+1)+"-2");
		}
		
		List<my_stu_SubjectDTO> sublist = my_stu_subjectDao.getSubjectInfo();
		
		ModelAndView mav = new ModelAndView("mypage/my_student/my_score/my_score_school_goal");
		mav.addObject("subjectList", sublist);
		mav.addObject("yearList", yearList);
		mav.addObject("scoremap", scoremap);
		mav.addObject("goalmap", goalmap);
		mav.addObject("selectyearterm", year+"0"+term);
		mav.addObject("subject", subjectList);
		mav.addObject("subject_name", subject);
		mav.addObject("schAllMap", schAllMap);
		return mav;
	}
	
	@RequestMapping("/my_parent_score_schoolAll.do")
	public ModelAndView my_parent_score_schoolALL(HttpSession session){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("parent")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int par_idx = (Integer)session.getAttribute("idx");
		
		List<Integer> stuList = my_stu_studentDao.getParStudentIdx(par_idx);
		
		ModelAndView mav = new ModelAndView("mypage/my_parent/my_parent_score_schoolAll");
		
		if(stuList.size()==0){
			mav.addObject("msg", "자녀회원과 연결한 후 서비스를 이용할 수 있습니다.");
			mav.addObject("gopage", "index.do");
			return mav;
		}
		
		List<my_stu_StudentDTO> childList = new ArrayList<my_stu_StudentDTO>();
		for(int i = 0; i < stuList.size(); i++){
			String stuname = my_stu_studentDao.getStudentName(stuList.get(i));
			my_stu_StudentDTO dto = new my_stu_StudentDTO();
			dto.setStu_name(stuname);
			dto.setStu_idx(stuList.get(i));
			
			childList.add(dto);
		}
		
		mav.addObject("childList", childList);
		return mav;
		
	}
	
	@RequestMapping("/my_parent_classScore.do")
	public ModelAndView my_parent_score_class(HttpSession session){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("parent")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int par_idx = (Integer)session.getAttribute("idx");
		
		List<Integer> stuList = my_stu_studentDao.getParStudentIdx(par_idx);
		
		ModelAndView mav = new ModelAndView("mypage/my_parent/my_parent_score_class");
		
		if(stuList.size()==0){
			mav.addObject("msg", "자녀회원과 연결한 후 서비스를 이용할 수 있습니다.");
			mav.addObject("gopage", "index.do");
			return mav;
		}
		
		List<my_stu_StudentDTO> childList = new ArrayList<my_stu_StudentDTO>();
		for(int i = 0; i < stuList.size(); i++){
			String stuname = my_stu_studentDao.getStudentName(stuList.get(i));
			my_stu_StudentDTO dto = new my_stu_StudentDTO();
			dto.setStu_name(stuname);
			dto.setStu_idx(stuList.get(i));
			
			childList.add(dto);
		}
		
		mav.addObject("childList", childList);
		return mav;
		
	}
	
	@RequestMapping("/my_parent_score_school.do")
	public ModelAndView my_parent_score_school(HttpSession session, 
			@RequestParam(value="year", defaultValue="0000")String year,
			@RequestParam(value="stu_idx", defaultValue="0")int stu_idx){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("parent")||stu_idx==0){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		if(stu_idx!=0){
			if((Integer)session.getAttribute("idx")!=my_stu_studentDao.getParentIdxByStudent(stu_idx)){
				ModelAndView back = new ModelAndView("mypage/my_parent/my_parent_score_class");
				back.addObject("msg", "잘못된 접근입니다");
				back.addObject("gopage", "my_parent_score_schoolAll.do");
				return back;
			}
		}
		
		Calendar now = Calendar.getInstance();
		if(year.equals("0000")){
			year = now.get(Calendar.YEAR)+"";
		}
		int yearInt = Integer.parseInt(year);
		
		List<my_score_SchoolScoreDTO> schlist = my_score_schoolscoreDao.getSchoolScore(stu_idx, yearInt);
		Map<String, Integer> springscore = new HashMap<String, Integer>();
		Map<String, Integer> fallscore = new HashMap<String, Integer>();
		for(int i = 0; i < schlist.size(); i++){
			String sub = "";
			switch(schlist.get(i).getSubject_num()){
			case 1: sub="kor"; break;
			case 2: sub="eng"; break;
			case 3: sub="math"; break;
			case 4: sub="ss"; break;
			case 5: sub="sci"; break;
			}
			if(schlist.get(i).getS_s_s_term()==1){
				springscore.put(sub, schlist.get(i).getS_s_s_result());
			}else{
				fallscore.put(sub, schlist.get(i).getS_s_s_result());
			}
		}
		
		
		int setyear = now.get(Calendar.YEAR);
		Map<String, Object> schAllMap = new HashMap<String, Object>();		
		for(int i = setyear; i > setyear-3; i--){		
			List<my_score_SchoolScoreDTO> schAllList = my_score_schoolscoreDao.getSchoolScore(stu_idx, i);
			schAllMap.put("s"+(setyear-i+1), i+"-1");
			schAllMap.put("f"+(setyear-i+1), i+"-2");
			
			for(int term = 0; term < schAllList.size(); term++){
				String sub = "";
				switch(schAllList.get(term).getSubject_num()){
				case 1: sub="kor"; break;
				case 2: sub="eng"; break;
				case 3: sub="math"; break;
				case 4: sub="ss"; break;
				case 5: sub="sci"; break;
				}
				if(schAllList.get(term).getS_s_s_term()==1){
					schAllMap.put("s"+(setyear-i+1)+sub, schAllList.get(term).getS_s_s_result());
				}else{
					schAllMap.put("f"+(setyear-i+1)+sub, schAllList.get(term).getS_s_s_result());
				}
			}
		}
		
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 0; i < 6; i++){
			yearList.add(setyear--);
		}
		
		ModelAndView mav = new ModelAndView("mypage/my_student/my_score/my_score_school");
		mav.addObject("year", yearList);
		mav.addObject("springscore", springscore);
		mav.addObject("fallscore", fallscore);
		mav.addObject("selectyear", year);
		mav.addObject("schAllMap", schAllMap);
		mav.addObject("stu_idx", stu_idx);
		
		return mav;
	}

	@RequestMapping("/my_score_School_inputScore.do")
	public ModelAndView my_score_School_inputScore(HttpSession session, my_score_SchoolScoreDTO msssdto){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
						
		msssdto.setStu_idx(stu_idx);
		
		ModelAndView mav = new ModelAndView("yongJson");
		
		if(my_score_schoolscoreDao.checkSchoolScoreDB(msssdto)>0){
			mav.addObject("msg", "이미 성적을 입력하셨습니다");
			return mav;
		}
		my_score_schoolscoreDao.setSchoolScore(msssdto);
		
		mav.addObject("msg", "입력되었습니다");
		return mav;
	}
	
	@RequestMapping("/my_score_School_inputGoal.do")
	public ModelAndView my_score_School_inputGoal(HttpSession session, my_score_SchoolGoalDTO mssgdto){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		
		ModelAndView mav = new ModelAndView("yongJson");
		
		mssgdto.setStu_idx(stu_idx);
		if(my_score_schoolgoalDao.checkSchoolGoal(mssgdto)>0){
			mav.addObject("msg", "이미 목표성적을 입력하셨습니다");
			return mav;
		}
		
		my_score_schoolgoalDao.setSchoolGoal(mssgdto);
		
		mav.addObject("msg", "입력되었습니다.");
		return mav;
	}
	
	@RequestMapping("/my_score_School_inputGoalModi.do")
	public ModelAndView my_score_School_inputGoalModi(HttpSession session, 
										my_score_SchoolGoalDTO mssgdto){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		
		ModelAndView mav = new ModelAndView("yongJson");
		
		mssgdto.setStu_idx(stu_idx);

		my_score_schoolgoalDao.modiSchoolGoal(mssgdto);
		
		mav.addObject("msg", "수정되었습니다.");
		return mav;
	}

	@RequestMapping("/my_score_School_inputScoreModi.do")
	public ModelAndView my_score_School_inputScoreModi(HttpSession session, 
									my_score_SchoolScoreDTO msssdto){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		
		msssdto.setStu_idx(stu_idx);
		
		ModelAndView mav = new ModelAndView("yongJson");
		
		my_score_schoolscoreDao.modiSchoolScore(msssdto);
		
		mav.addObject("msg", "수정되었습니다");
		return mav;
	}
	
	@RequestMapping("/my_score_class_showScore.do")
	public ModelAndView my_score_class_showScore(HttpSession session, 
					@RequestParam(value="class_idx", defaultValue="0")int class_idx,
					@RequestParam(value="childidx", defaultValue="0")int childidx){
		
		if(session.getAttribute("idx")==null||!(((String)session.getAttribute("usergrade")).equals("student")||((String)session.getAttribute("usergrade")).equals("parent"))){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		
		ModelAndView mav = new ModelAndView("yongJson");

		if(((String)session.getAttribute("usergrade")).equals("parent")){
			if(childidx == 0){				
				mav.addObject("msg", "오류");
				return mav;
			}else{
				stu_idx = childidx;
			}
		}

		if(class_idx==0){
			mav.addObject("msg", "오류");
			return mav;
		}
		
		List<my_score_StudentScoreDTO> stuscoreList = my_score_studentscoreDao.getStudentScore(stu_idx, class_idx);
		
		mav.addObject("stuscoreList", stuscoreList);
		
		return mav;
	}
	
	@RequestMapping("/my_teacher_class_student_score_All.do")
	public ModelAndView my_teacher_class_student_score_All(HttpSession session,
						@RequestParam(value="cp",defaultValue="1")int cp){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int tea_idx = (Integer)session.getAttribute("idx");
		
		ModelAndView mav = new ModelAndView();
						
		List<my_stu_ClassDTO> classList = my_stu_classDao.getAllTeacherClassInfo(tea_idx, cp);
		
		int totalCnt = 1;
		if(!(classList==null||classList.size()==0)) totalCnt = classList.size();
		
		mav.setViewName("mypage/my_teacher/my_class_score/my_teacher_class_score_List");
		mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_teacher_class_student_score_All.do", totalCnt, 10, 5, cp));
		mav.addObject("classList", classList);
		return mav;
	}
	
	@RequestMapping("/my_teacher_student_score_list.do")
	public ModelAndView my_teacher_student_score_list(HttpSession session,
							@RequestParam(value="class_idx", defaultValue="0")int class_idx){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		if(class_idx==0){
			ModelAndView gotoindex = new ModelAndView("index");
			gotoindex.addObject("msg", "잘못된 접근입니다");
			return gotoindex;
		}
		
		ModelAndView mav = new ModelAndView("mypage/my_teacher/my_class_score/my_teacher_scoreList");
		
		List<Integer> stuidxlisttemp = my_stu_classstudentDao.getClassStudentIdxList(class_idx);
		if(stuidxlisttemp.size()==0){
			mav.addObject("msg", "수강생이 없습니다");
			return mav;
		}
		List<my_stu_StudentDTO> stuList = my_stu_studentDao.getStudentIdxListOrderByName(stuidxlisttemp);
		
		List<Integer> dateList = my_score_studentscoreDao.getStudentScoreDate(class_idx);
		
		List<my_score_StudentScoreDTO> synscoreList = my_score_studentscoreDao.getStudentScoreList(class_idx);
		
		List<Map<String, Object>> stuscoreList = new ArrayList<Map<String,Object>>();
		int dsTotal[] = new int[dateList.size()];
		int stuTotal[] = new int[dateList.size()];
		for(int i = 0; i < dsTotal.length; i++){
			dsTotal[i] = 0;
			stuTotal[i] = 0;
		}
		
		for(int i = 0; i < stuList.size(); i++){
			Map<String, Object> map = new HashMap<String, Object>();
			my_stu_StudentDTO studto = stuList.get(i);
			map.put("stu_idx", studto.getStu_idx());
			map.put("stu_name", studto.getStu_name());
			List<Integer> examList = new ArrayList<Integer>();
			
			for(int date = 0; date < dateList.size(); date++){
				if(synscoreList.size()==0) examList.add(0);
				for(int stu = 0; stu < synscoreList.size(); stu++){
					if(studto.getStu_idx()==synscoreList.get(stu).getStu_idx()&&dateList.get(date)==synscoreList.get(stu).getS_s_date()){
						examList.add(synscoreList.get(stu).getS_s_result());
						dsTotal[date] += synscoreList.get(stu).getS_s_result();
						stuTotal[date]++;
						break;
					}
					if(stu==(synscoreList.size()-1)) examList.add(0);
				}
			}
			map.put("examList", examList);
			stuscoreList.add(map);
		}
		
		List<Map<String, String>> dsTotalList = new ArrayList<Map<String, String>>();
		for(int i = 0; i < dateList.size(); i++){
			Map<String, String> map = new HashMap<String, String>();
			map.put("examDate", dateList.get(i)+"");
			if(dsTotal[i]==0){
				map.put("avg", "0");
			}else{
				map.put("avg", dsTotal[i]/stuTotal[i]+"."+(dsTotal[i]*10/stuTotal[i])%10);
			}
			dsTotalList.add(map);
		}
		
		mav.addObject("class_idx", class_idx);
		mav.addObject("stuScoreList", stuscoreList);
		mav.addObject("dsTotalList", dsTotalList);
		return mav;
	}
	
}
