
package gyum_02.my_student.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

import javax.servlet.http.HttpSession;

import gyum_02.my_score.model.my_score_TeacherDAO;
import gyum_02.my_student.model.*;

@Controller
public class my_stu_ClassController {

	@Autowired
	private my_stu_ClassDAO my_stu_classDao;
	
	@Autowired
	private my_stu_SubjectDAO my_stu_subjectDao;
	
	@Autowired
	private my_stu_ClassEvalDAO my_stu_classevalDao;
	
	@Autowired
	private my_stu_ClassEvalAnswerDAO my_stu_classevalanswerDao;
	
	@Autowired
	private my_stu_ClassStudentDAO my_stu_classstudentDao;
	
	@Autowired
	private my_stu_AttendDAO my_stu_attendDao;
	
	@Autowired
	private my_stu_TimetableDAO my_stu_timetableDao;
	
	@Autowired
	private my_stu_AttendAttendanceDAO my_stu_attendattendanceDao;
	
	@Autowired
	private my_stu_StudentDAO my_stu_studentDao;
	
	@Autowired
	private my_score_TeacherDAO my_score_teacherDao;
			
	@RequestMapping("/my_student_classList.do")
	public ModelAndView my_student_classList(HttpSession session,
						@RequestParam(value="cp", defaultValue="1")int cp){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");

		List<Integer> cilistAll = my_stu_classstudentDao.getClassIdx(stu_idx);
		
		if(cilistAll==null||cilistAll.size()==0){
			ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_classList");
			
			int totalCnt = 1;
			
			mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_student_classList.do", totalCnt, 10, 5, cp));
			mav.addObject("cp", cp);
			return mav;
		}
		
		List<my_stu_ClassDTO> classList = my_stu_classDao.getAllStudentClassInfo(cilistAll, cp);
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		for(int i = 0; i < classList.size(); i++){
			my_stu_ClassDTO mscdto = classList.get(i); 

			String subjectname = my_stu_subjectDao.getSub(mscdto.getSubject_num());
			
			String dayandtime = mscdto.getClass_day()+" "+mscdto.getClass_time();
			
			String state = "";
			Calendar now = Calendar.getInstance();
			int today = now.get(Calendar.YEAR)*10000+(now.get(Calendar.MONTH)+1)*100+now.get(Calendar.DATE);
			if(today>=mscdto.getClass_startdate()&&today<=mscdto.getClass_enddate()){
				state = "진행중";
			}else if(today>mscdto.getClass_enddate()){
				state = "종료";
			}else{
				state = "진행예정";
			}
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("subject_num", subjectname);
			map.put("class_subject", mscdto.getClass_subject());
			map.put("teacher", my_score_teacherDao.getTeacherName(mscdto.getTea_idx()));
			map.put("classroom", mscdto.getClassroom());
			map.put("dayandtime", dayandtime);
			map.put("state", state);
		
			list.add(map);		
		}
						
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_classList");
		
		int totalCnt = 1;
		if(cilistAll!=null) totalCnt = cilistAll.size();
		
		mav.addObject("my_classList", list);
		mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_student_classList.do", totalCnt, 10, 5, cp));
		mav.addObject("cp", cp);
		return mav;
	}
	
	@RequestMapping("/my_student_timetable_view.do")
	public ModelAndView my_student_timetable_view(HttpSession session){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		List<Integer> cilistAll = my_stu_classstudentDao.getClassIdx(stu_idx);
	    
		Calendar now = Calendar.getInstance();
		int today = now.get(Calendar.YEAR)*10000+(now.get(Calendar.MONTH)+1)*100+now.get(Calendar.DATE);
		
	    List<Integer> cilist = new ArrayList<Integer>();
	    for(int i = 0; i < cilistAll.size(); i++){
	    	my_stu_ClassDTO dto = my_stu_classDao.getClassPeriod(cilistAll.get(i));
	    	if(today<=dto.getClass_enddate() && today>=dto.getClass_startdate()){
	    		cilist.add(cilistAll.get(i));
	    	}
	    }
	    List<my_stu_ClassDTO> ttlist = my_stu_classDao.getClassDayandTime(cilist);
		
		String ttstr = "";
		for(int i = 0; i < ttlist.size(); i++){
			ttstr += ttlist.get(i).getClass_idx() + "/" + getClassDay(ttlist.get(i).getClass_day()) + "/" + ttlist.get(i).getClass_time() + "/" 
					+ ttlist.get(i).getClass_subject() + ",";
		}
				
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_timetable_view");
		mav.addObject("ttstr", ttstr);
		return mav;
	}
	
	public String getClassDay(String day){
		String daystr = "";
		
		if(day.equals("월요일")){
			daystr = "MON";
		}else if(day.equals("화요일")){
			daystr = "TUE";
		}else if(day.equals("수요일")){
			daystr = "WED";
		}else if(day.equals("목요일")){
			daystr = "THU";
		}else if(day.equals("금요일")){
			daystr = "FRI";
		}else if(day.equals("토요일")){
			daystr = "SAT";
		}else if(day.equals("일요일")){
			daystr = "SUN";
		}
		
		return daystr;
	}
	
	@RequestMapping("/my_student_timetable_write.do")
	public ModelAndView my_student_timetable_write(HttpSession session){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		List<my_stu_ClassDTO> list = my_stu_classDao.getAllClassInfo(null);
		
		//list of class_idx 
		int stu_idx = (Integer)session.getAttribute("idx");
		List<Integer> cilist = my_stu_timetableDao.getTimetable(stu_idx);
		
		List<my_stu_ClassDTO> ttlist = my_stu_classDao.getClassDayandTime(cilist);
		
		String ttstr = "";
		for(int i = 0; i < ttlist.size(); i++){
			ttstr += ttlist.get(i).getClass_idx() + "/" + getClassDay(ttlist.get(i).getClass_day()) + "/" + ttlist.get(i).getClass_time() + "/" 
					+ ttlist.get(i).getClass_subject() + ",";
		}
		
		//list of my class
		List<Integer> cilistAll = my_stu_classstudentDao.getClassIdx(stu_idx);
	    
		Calendar now = Calendar.getInstance();
		int today = now.get(Calendar.YEAR)*10000+(now.get(Calendar.MONTH)+1)*100+now.get(Calendar.DATE);
		
	    List<Integer> mycilist = new ArrayList<Integer>();
	    for(int i = 0; i < cilistAll.size(); i++){
	    	my_stu_ClassDTO dto = my_stu_classDao.getClassPeriod(cilistAll.get(i));
	    	if(today<=dto.getClass_enddate() && today>=dto.getClass_startdate()){
	    		mycilist.add(cilistAll.get(i));
	    	}
	    }
	    List<my_stu_ClassDTO> classlist = my_stu_classDao.getClassDayandTime(mycilist);
		
		String classstr = "";
		for(int i = 0; i < classlist.size(); i++){
			classstr += classlist.get(i).getClass_idx() + "/" + getClassDay(classlist.get(i).getClass_day()) + "/" + classlist.get(i).getClass_time() + "/" 
					+ classlist.get(i).getClass_subject() + ",";
		}
		
		
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_timetable_write");
		mav.addObject("list", list);
		mav.addObject("ttstr", ttstr);
		mav.addObject("classstr", classstr);
		return mav;
	}
	
	@RequestMapping("/my_student_timetable_search.do")
	public ModelAndView my_student_timetable_search(@RequestParam(value="search",defaultValue="nosearch")String search){
		
		if(!search.equals("nosearch")){
			search = "%"+search+"%";
		}else{
			search = null;
		}
		List<my_stu_ClassDTO> list = my_stu_classDao.getAllClassInfo(search);
			
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_timetable_classList");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/my_student_attendance.do")
	public ModelAndView my_student_attendance(HttpSession session,
							@RequestParam(value="childidx",defaultValue="0")int childidx){

		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_attendance");

		if(childidx==0){
			if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
				ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
				return gologin;
			}
		}else{
			if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("parent")){
				ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
				return gologin;
			}
			mav.addObject("childidx", childidx);
		}
				
		return mav;
	}
	
	@RequestMapping("/my_student_class_eval.do")
	public ModelAndView my_student_class_eval(HttpSession session,
						@RequestParam(value="cp", defaultValue="1")int cp){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		
		List<Integer> cilistAll = my_stu_classstudentDao.getClassIdx(stu_idx);

		if(cilistAll==null||cilistAll.size()==0){
			int totalCnt = 1;
			
			ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_class_eval");
			mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_student_class_eval.do", totalCnt, 10, 5, cp));
			return mav;
		}
		
		
		Calendar now = Calendar.getInstance();
		int today = now.get(Calendar.YEAR)*10000+(now.get(Calendar.MONTH)+1)*100+now.get(Calendar.DATE);
		
		List<my_stu_ClassDTO> msclist = my_stu_classDao.getAllStudentClassInfoEval(cilistAll, cp, today);

		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		for(int i = 0; i < msclist.size(); i++){
			my_stu_ClassDTO mscdto = msclist.get(i);
			String subjectname = my_stu_subjectDao.getSub(mscdto.getSubject_num());
			
			String evalstate = "";

			if(my_stu_classevalanswerDao.existEvalAnswer(mscdto.getClass_idx(), stu_idx)>0){
				if(my_stu_classevalanswerDao.fixEvalAnswer(mscdto.getClass_idx(), stu_idx)==0){
					evalstate = "set";
				}else{
					evalstate = "done";
				}
			}
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("class_idx", mscdto.getClass_idx());
			map.put("subject_num", subjectname);
			map.put("class_subject", mscdto.getClass_subject());
			map.put("teacher", mscdto.getTea_name());
			map.put("evalstate", evalstate);
		
			list.add(map);		
		}
		
		int totalCnt = 1;
		if(list!=null) totalCnt = list.size();
		
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_class_eval");
		mav.addObject("my_evalList", list);
		mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_student_class_eval.do", totalCnt, 10, 5, cp));
		return mav;
	}
	
	@RequestMapping("/my_class_eval_question.do")
	public ModelAndView my_class_eval_question(HttpSession session, String class_idx, @RequestParam(value="fix", defaultValue="none")String fix){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		my_stu_ClassDTO mscdto = my_stu_classDao.getClassInfo(Integer.parseInt(class_idx));
		String student_name = my_stu_studentDao.getStudentName(stu_idx);
		String class_name = mscdto.getClass_subject();
		
		List<my_stu_ClassEvalDTO> list = my_stu_classevalDao.getEvalQuestion();
		String note = list.get(5).getC_e_q_question();
		list.remove(5);

		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_class_eval_question");
		
		my_stu_ClassEvalAnswerDTO mscedto;
		if(fix.equals("fix")){
			mscedto = my_stu_classevalanswerDao.getEvalAnswer(Integer.parseInt(class_idx), stu_idx);
			mav.addObject("eval_content", mscedto);
		}
		
		mav.addObject("eval_question", list);
		mav.addObject("note", note);
		mav.addObject("class_name", class_name);
		mav.addObject("class_idx", class_idx);
		mav.addObject("student_name", student_name);
		mav.addObject("fix", fix);
//		HashMap map = new HashMap();
//		map.put("kk", "kkk");
//		ControllerSurpport cs = new ControllerSurpport();
//		cs.getJsonResult(map);
		
		return mav;
	}
	
	@RequestMapping("/my_class_eval_submit.do")
	public ModelAndView my_class_eval_submit(HttpSession session, my_stu_ClassEvalAnswerDTO msceadto){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		msceadto.setTea_idx(my_stu_classDao.getClassInfo(msceadto.getClass_idx()).getTea_idx());

		int result = my_stu_classevalanswerDao.setEvalAnswer(msceadto);
		String msg = "fail";
		if(result>0){
			msg = "success";
		}
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_class_eval");
		mav.addObject("msg", msg);
		return mav;
	}
	
	@RequestMapping("/my_class_eval_modi.do")
	public ModelAndView my_class_eval_modi(HttpSession session, my_stu_ClassEvalAnswerDTO msceadto){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		msceadto.setStu_idx(stu_idx);
		int result = my_stu_classevalanswerDao.updateEvalAnswer(msceadto);
		
		String msg = "no";
		if(result>0){
			msg = "yes";
		}
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_class_eval");
		mav.addObject("msg", msg);
		return mav;
	}
	
	@RequestMapping("/my_class_eval_set.do")
	public ModelAndView my_class_eval_set(HttpSession session, String class_idx){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		int result = my_stu_classevalanswerDao.doneEvalAnswer(Integer.parseInt(class_idx), stu_idx);
		String msg = "fail";
		if(result>0) msg = "success";
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_class_eval");
		mav.addObject("msg", msg);
		return mav;		
	}

	@RequestMapping("/my_class_eval_done.do")
	public ModelAndView my_class_eval_done(HttpSession session, String class_idx){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		my_stu_ClassDTO mscdto = my_stu_classDao.getClassInfo(Integer.parseInt(class_idx));
		String class_name = mscdto.getClass_subject();
		
		List<my_stu_ClassEvalDTO> list = my_stu_classevalDao.getEvalQuestion();
		String note = list.get(5).getC_e_q_question();
		list.remove(5);

		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_class_eval_done");
		
		my_stu_ClassEvalAnswerDTO mscedto = my_stu_classevalanswerDao.getEvalAnswer(Integer.parseInt(class_idx), stu_idx);

		mav.addObject("eval_content", mscedto);
		mav.addObject("eval_question", list);
		mav.addObject("note", note);
		mav.addObject("class_name", class_name);
		mav.addObject("class_idx", class_idx);
		return mav;
	}
	
	@RequestMapping("/my_student_attendance_check.do")
	public ModelAndView my_student_attendance_check(HttpSession session, String startdate,
						@RequestParam(value="childidx",defaultValue="0")int childidx){

		int stu_idx = 0;
		if(childidx==0){			
			if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
				ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
				return gologin;
			}
			stu_idx = (Integer)session.getAttribute("idx");
		}else{
			if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("parent")){
				ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
				return gologin;
			}
			stu_idx = childidx;
		}
				
		int firstdate, lastdate = 0;
		
		//set dateList
		List<String> dateList = new ArrayList<String>();
		List<Integer> dateIntList = new ArrayList<Integer>();
		int startyear, startmonth, startday;
		
		if(startdate.equals("today")){
			Calendar now = Calendar.getInstance();
		    startyear = now.get(Calendar.YEAR);
		    startmonth = now.get(Calendar.MONTH)+1;
		    startday = now.get(Calendar.DATE);
		}else{
		    startyear = Integer.parseInt(startdate.substring(0,4));
		    startmonth = Integer.parseInt(startdate.substring(5,7));
		    startday = Integer.parseInt(startdate.substring(8));
		}
		
		firstdate = startyear*10000+startmonth*100+startday;
		
	    Date start = new Date(startyear-1900, startmonth-1, startday);
	    
	    for(int i = 0; i < 7; i++){
	    	dateList.add((start.getYear()+1900)+"-"+(start.getMonth()+1)+"-"+start.getDate());
	    	dateIntList.add((start.getYear()+1900)*10000 + (start.getMonth()+1)*100 + start.getDate());
	    	if(i==5){
	    		lastdate = (start.getYear()+1900)*10000 + (start.getMonth()+1)*100 + start.getDate();
	    	}
	    	start = new Date(start.getTime()+1000*60*60*24);
	    }
	    //get class_idx
	    List<Integer> cilistAll = my_stu_classstudentDao.getClassIdx(stu_idx);
	    
	    List<Integer> cilist = new ArrayList<Integer>();
	    for(int i = 0; i < cilistAll.size(); i++){
	    	my_stu_ClassDTO dto = my_stu_classDao.getClassPeriod(cilistAll.get(i));
	    	if(firstdate<=dto.getClass_enddate() && lastdate>=dto.getClass_startdate()){
	    		cilist.add(cilistAll.get(i));
	    	}
	    }
	    
	    //get attendance list
	    List<String> classsubList = my_stu_classDao.getClassSubject(cilist);
	    
	    List<Map<String, Object>> attendlist = new ArrayList<Map<String,Object>>();
	    
	    for(int i = 0; i < cilist.size(); i++){
	    	Map<String,Object> map = new HashMap<String, Object>();
	    	my_stu_AttendDTO al = my_stu_attendDao.getAttendList(cilist.get(i), stu_idx, firstdate, lastdate);
	    	if(al!=null){
	    		for(int j = 0; j < dateIntList.size(); j++){
	    			if(dateIntList.get(j) == al.getAttend_date()){
	    				map.put("attend_date", j+1);
	    			}
	    		}
	    		
	    		map.put("attend", "X");
	    		if(my_stu_attendattendanceDao.getAttendance(al.getA_a_idx()).equals("출석")){
	    			map.put("attend", "O");
	    		}else if(my_stu_attendattendanceDao.getAttendance(al.getA_a_idx()).equals("지각")){
	    			map.put("attend", "△");
	    		}else if(my_stu_attendattendanceDao.getAttendance(al.getA_a_idx()).equals("조퇴")){
	    			map.put("attend", "□");
	    		}
	    	}
    		map.put("class_subject", classsubList.get(i));
	    	attendlist.add(map);
	    }
	    
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_attendance_show");
		mav.addObject("dateList",dateList);
		mav.addObject("attendList",attendlist);
		return mav;
	}

	@RequestMapping("/my_student_timetable_save.do")
	public ModelAndView my_student_timetable_save(String timetable, HttpSession session){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("student")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int stu_idx = (Integer)session.getAttribute("idx");
		my_stu_timetableDao.deleteTimetable(stu_idx);
		
		String[] tt = timetable.split(",");
		List<my_stu_TimetableDTO> ttlist = new ArrayList<my_stu_TimetableDTO>();
		for(int i = 0; i < tt.length; i++){
			if(tt[i].equals("")) continue;
			my_stu_TimetableDTO ttdto = new my_stu_TimetableDTO(stu_idx, Integer.parseInt(tt[i]));
			ttlist.add(ttdto);
		}
		
		my_stu_timetableDao.setTimetable(ttlist);
		
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_timetable_write");
		return mav;
	}

	@RequestMapping("/my_teacher_class_eval_check.do")
	public ModelAndView my_teacher_class_eval_check(HttpSession session,
						@RequestParam(value="cp", defaultValue="1")int cp){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int tea_idx = (Integer)session.getAttribute("idx");
		
		List<my_stu_ClassDTO> classList = my_stu_classDao.getAllTeacherClassInfo(tea_idx, cp);
		
		List<Map<String,Object>> myClassList = new ArrayList<Map<String,Object>>();
		for(int i = 0; i < classList.size(); i++){
			Map<String, Object> map = new HashMap<String, Object>();
			my_stu_ClassDTO dto = classList.get(i);
			map.put("period", dto.getClass_startdate()+" - "+dto.getClass_enddate());
			map.put("class_idx", dto.getClass_idx());
			map.put("subject", dto.getClass_subject());
			map.put("day", dto.getClass_day());
			map.put("time", dto.getClass_time()+"교시");
			map.put("studentNum", my_stu_classstudentDao.getClassStudentNum(dto.getClass_idx()));
			
			myClassList.add(map);
		}
		
		int totalCnt = 1;
		if(myClassList==null||myClassList.size()==0) totalCnt = myClassList.size();
		
		ModelAndView mav = new ModelAndView("mypage/my_teacher/my_class_eval/my_class_eval_check");
		mav.addObject("myClassList", myClassList);
		mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_teacher_class_eval_check.do", totalCnt, 10, 5, cp));
		return mav;
		
		
	}
	
	@RequestMapping("/my_tea_class_eval_list.do")
	public ModelAndView my_tea_class_eval_list(HttpSession session,
			@RequestParam(value="class_idx", defaultValue="0")int class_idx){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")||class_idx==0){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		ModelAndView mav = new ModelAndView("yongJson");
		
		List<my_stu_ClassEvalAnswerDTO> cealist = my_stu_classevalanswerDao.getTeacherEvalList(class_idx);
		List<Map<String, Object>> evalList = new ArrayList<Map<String,Object>>();
		
		int allAvg = 0;
		for(int i = 0; i < cealist.size(); i++){
			Map<String, Object> map = new HashMap<String, Object>();
			my_stu_ClassEvalAnswerDTO dto = cealist.get(i);
			map.put("class_idx", dto.getClass_idx());
			map.put("stu_idx", dto.getStu_idx());
			int avg = (dto.getC_e_a1()+dto.getC_e_a2()+dto.getC_e_a3()+dto.getC_e_a4()+dto.getC_e_a5())*10/5;
			allAvg += avg;
			map.put("avg", avg/10+"."+avg%10);
			
			evalList.add(map);
		}
		
		if(cealist.size()!=0){			
			allAvg /= cealist.size();
		}
		
		mav.addObject("allAvg", allAvg/10+"."+allAvg%10);
		mav.addObject("evalList", evalList);
		return mav;
	}
	
	@RequestMapping("/my_tea_class_eval_content.do")
	public ModelAndView my_teacher_show_class_eval_content(HttpSession session,
											@RequestParam(value="class_idx",defaultValue="0")int class_idx,
											@RequestParam(value="stu_idx",defaultValue="0")int stu_idx){


		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")||class_idx==0||stu_idx==0){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		ModelAndView mav = new ModelAndView("mypage/my_student/my_class/my_class_eval_done");

		my_stu_ClassDTO mscdto = my_stu_classDao.getClassInfo(class_idx);
		String class_name = mscdto.getClass_subject();
		
		List<my_stu_ClassEvalDTO> list = my_stu_classevalDao.getEvalQuestion();
		String note = list.get(5).getC_e_q_question();
		list.remove(5);

		my_stu_ClassEvalAnswerDTO mscedto = my_stu_classevalanswerDao.getEvalAnswer(class_idx, stu_idx);

		mav.addObject("eval_content", mscedto);
		mav.addObject("eval_question", list);
		mav.addObject("note", note);
		mav.addObject("class_name", class_name);
		mav.addObject("class_idx", class_idx);
		return mav;
	}

	@RequestMapping("/my_teacher_class_timetable.do")
	public ModelAndView my_teacher_class_timetable(HttpSession session){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int tea_idx = (Integer)session.getAttribute("idx");
		
		
		Calendar now = Calendar.getInstance();
		int today = now.get(Calendar.YEAR)*10000+(now.get(Calendar.MONTH)+1)*100+now.get(Calendar.DATE);
		
		List<my_stu_ClassDTO> teaclasslist = my_stu_classDao.getAllTeacherClassTimetable(tea_idx, today);
		
		String classList = "";
		
		for(int i = 0; i < teaclasslist.size(); i++){
			my_stu_ClassDTO dto = teaclasslist.get(i);
			classList += dto.getClass_idx() + "/" + getClassDay(dto.getClass_day()) + dto.getClass_time() + "/" + dto.getClass_subject() + ",";
		}
		
		ModelAndView mav = new ModelAndView("mypage/my_teacher/my_class/my_class_timetable_view");
		mav.addObject("classList", classList);
		return mav;
	}

	@RequestMapping("/my_teacher_class_student_attend_All.do")
	public ModelAndView my_teacher_class_student_attend_All(HttpSession session,
						@RequestParam(value="cp", defaultValue="1")int cp){
		ModelAndView mav = new ModelAndView();

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int tea_idx = (Integer)session.getAttribute("idx");
				
		String usergrade = (String)session.getAttribute("usergrade");
		if(usergrade==null||!(usergrade.equals("teacher"))){
			mav.setViewName("index");
			mav.addObject("msg", "잘못된 접근입니다.");
			return mav;
		}
		
		List<my_stu_ClassDTO> classList = my_stu_classDao.getAllTeacherClassInfo(tea_idx, cp);
		
		int totalCnt = 1;
		if(!(classList==null||classList.size()==0)){
			totalCnt = classList.size();
		}
		
		mav.setViewName("mypage/my_teacher/my_class_attend/my_teacher_class_attend_List");
		mav.addObject("classList", classList);
		mav.addObject("page", gyum_02.paging.Paging_PageModule.my_pageMake_lnh("my_teacher_class_student_attend_All.do", totalCnt, 10, 5, cp));
		return mav;
	}
	
	@RequestMapping("/my_teacher_student_attend_list.do")
	public ModelAndView my_teacher_student_attend_list(HttpSession session,
						@RequestParam(value="class_idx",defaultValue="0")int class_idx,
						@RequestParam(value="year",defaultValue="0")int year,
						@RequestParam(value="month",defaultValue="0")int month){
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
				
		//yearList
		List<Integer> yearList = new ArrayList<Integer>();
		Calendar now = Calendar.getInstance();
		for(int i = 0; i < 3; i++){
			yearList.add(now.get(Calendar.YEAR)-i);
		}
		
		if(year==0){
			year = now.get(Calendar.YEAR);
		}
		if(month==0){
			month = now.get(Calendar.MONTH)+1;
		}

		//studentList
		List<Integer> stuidxlisttemp = my_stu_classstudentDao.getClassStudentIdxList(class_idx);
		if(stuidxlisttemp.size()==0){
			mav.setViewName("mypage/my_teacher/my_class_attend/my_teacher_attendList");
			mav.addObject("msg", "수강생이 없습니다");
			return mav;
		}
		//stu_idx, stu_name
		List<my_stu_StudentDTO> stuList = my_stu_studentDao.getStudentIdxListOrderByName(stuidxlisttemp);
		
		List<Integer> dateList = my_stu_attendDao.getTeacherAttendDateList(class_idx, year, month);
		List<my_stu_AttendDTO> stuattend = my_stu_attendDao.getTeacherClassAttendList(class_idx, year, month);
		

		List<Map<String, Object>> studentList = new ArrayList<Map<String,Object>>();
		for(int i = 0; i < stuList.size(); i++){
			Map<String, Object> map = new HashMap<String, Object>();
			my_stu_StudentDTO dto = stuList.get(i);
			map.put("stu_idx", dto.getStu_idx());
			map.put("stu_name", dto.getStu_name());
			List<String> attendList = new ArrayList<String>();
			for(int date = 0; date < dateList.size(); date++){
				if(stuattend.size()==0) attendList.add("-");
				for(int stu = 0; stu < stuattend.size(); stu++){
					if(dto.getStu_idx()==stuattend.get(stu).getStu_idx()&&dateList.get(date)==stuattend.get(stu).getAttend_date()){
						String attend = "X";
						switch(stuattend.get(stu).getA_a_idx()){
						case 1: attend = "O"; break;
						case 2: attend = "△"; break;
						case 3: attend = "□"; break;
						}
						attendList.add(attend);
						break;
					}
					if(stu==(stuattend.size()-1)) attendList.add("-");
				}
			}
			map.put("attendList", attendList);
			studentList.add(map);
		}
		
		mav.setViewName("mypage/my_teacher/my_class_attend/my_teacher_attendList");
		mav.addObject("yearList", yearList);
		mav.addObject("dateList", dateList);
		mav.addObject("studentList", studentList);
		mav.addObject("class_idx", class_idx);
		mav.addObject("year", year);
		mav.addObject("month", month);
		return mav;
	}
	
	@RequestMapping("/my_teacher_attend_individual.do")
	public ModelAndView my_teacher_attend_individual(HttpSession session,
						@RequestParam(value="class_idx", defaultValue="0")int class_idx,
						@RequestParam(value="stu_idx", defaultValue="0")int stu_idx,
						@RequestParam(value="yearandmonth", defaultValue="0")int yearandmonth){
		
		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("teacher")||class_idx==0||stu_idx==0){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		ModelAndView mav = new ModelAndView("yongJson");
		
		Calendar now = Calendar.getInstance();
		if(yearandmonth==0){
			yearandmonth = now.get(Calendar.YEAR)*10000+(now.get(Calendar.MONTH)+1)*100;
		}
		
		List<my_stu_AttendDTO> attendList = my_stu_attendDao.getIndividualAttendList(class_idx, stu_idx, yearandmonth);
		
		mav.addObject("attendList", attendList);
		return mav;
	}

	@RequestMapping("/my_parent_attendCheck.do")
	public ModelAndView my_parent_attend_class_check(HttpSession session){

		if(session.getAttribute("idx")==null||!((String)session.getAttribute("usergrade")).equals("parent")){
			ModelAndView gologin = new ModelAndView("mypage/my_member/my_memberLogin");
			return gologin;
		}
		
		int par_idx = (Integer)session.getAttribute("idx");
		
		List<Integer> stuList = my_stu_studentDao.getParStudentIdx(par_idx);
		
		ModelAndView mav = new ModelAndView("mypage/my_parent/my_parent_attend_class");
		
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

	@RequestMapping("/my_parent_cctv.do")
	public ModelAndView my_parent_cctv_view(){
		ModelAndView mav = new ModelAndView("mypage/my_parent/my_parent_cctv");
		
		return mav;
	}
}




