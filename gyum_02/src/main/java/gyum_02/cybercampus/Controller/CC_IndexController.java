package gyum_02.cybercampus.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import gyum_02.cybercampus.Model.CC_ClassDAO;
import gyum_02.cybercampus.Model.CC_ClassDTO;
import gyum_02.cybercampus.Model.CC_FreeBBSDAO;
import gyum_02.cybercampus.Model.CC_FreeBBSDTO;
import gyum_02.cybercampus.Model.CC_NoticeDAO;
import gyum_02.cybercampus.Model.CC_NoticeDTO;
import gyum_02.cybercampus.Model.CC_RepositoryDAO;
import gyum_02.cybercampus.Model.CC_RepositoryDTO;
import gyum_02.cybercampus.Model.CC_TeacherNoticeDTO;

@Controller
public class CC_IndexController {

	@Autowired
	private CC_ClassDAO cc_ClassDAO;
	
//	//페이지 결합으로 주석처리
//	@RequestMapping(value = "/cc_gotoIndex.do", method = RequestMethod.GET)
//	public ModelAndView cc_gotoIndex(HttpSession session) {
//		String usergrade = "";
//		ModelAndView mav = new ModelAndView();
//		usergrade = (String) session.getAttribute("usergrade");
//		if (!(usergrade == null || usergrade.equals(""))) {
//			if (usergrade.equals("teacher") || usergrade.equals("student") || usergrade.equals("master")) {
//				mav.setViewName("/cybercampus/cc_index");
//			}
//		} else {
//			mav.setViewName("/cybercampus/layover/msg");
//			mav.addObject("msg", "접속권한이 없습니다.");
//			mav.addObject("locationOrder", "index.do");
//		}
//		return mav;
//	}
	
	@RequestMapping(value="/cc_gotoOldClass.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoOldClass(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		ModelAndView mav=new ModelAndView();
		if((Integer)session.getAttribute("idx")==null){
			mav.setViewName("/cybercampus/layover/msg");
			mav.addObject("msg", "접속권한이 없습니다.");
			mav.addObject("locationOrder", "index.do");
			return mav;
		}
		String usergrade=(String)session.getAttribute("usergrade");
		int idx=(Integer)session.getAttribute("idx");
		if (!(usergrade == null || usergrade.equals(""))) {
			if (usergrade.equals("teacher") || usergrade.equals("student") || usergrade.equals("master")) {
				mav.setViewName("/cybercampus/cc_index");
			}
		} else {
			mav.setViewName("/cybercampus/layover/msg");
			mav.addObject("msg", "접속권한이 없습니다.");
			mav.addObject("locationOrder", "index.do");
			return mav;
		}
		int totalCnt=0; //TotalCnt will be checked in next IF paragraph.
		int listSize=5;
		int pageSize=5;
		List<CC_ClassDTO> list=new ArrayList<CC_ClassDTO>();
		if(usergrade.equals("teacher")){
			totalCnt=cc_ClassDAO.CC_totalCntTeacherOldClassList(idx);
			list=cc_ClassDAO.CC_gotoTeacherOldClassList(cp,listSize,idx);
			mav.setViewName("/cybercampus/cc_01.oldClass/cc_teacher/cc_oldClass_main");
		}else if(usergrade.equals("student")){
			totalCnt=cc_ClassDAO.CC_totalCntStudentOldClassList(idx);
			list=cc_ClassDAO.CC_gotoStudentOldClassList(cp, listSize, idx);
			mav.setViewName("/cybercampus/cc_01.oldClass/cc_student/cc_oldClass_main");
		}else if(usergrade.equals("master")){
			totalCnt=cc_ClassDAO.CC_totalCntMasterOldClassList();
			list=cc_ClassDAO.CC_gotoMasterOldClassList(cp,listSize,idx);
			mav.setViewName("/cybercampus/cc_01.oldClass/cc_teacher/cc_oldClass_main");
		}
		totalCnt=totalCnt==0?1:totalCnt;
		Map<String,Object> searchMap=new HashMap<String,Object>();
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_gotoOldClass.do", totalCnt, listSize, pageSize, cp, searchMap);
		mav.addObject("list", list);
		
		mav.addObject("pageStr", pageStr);
		session.setAttribute("classStatus","<a href='cc_gotoOldClass.do'>이전 강의실</a>");
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoCurrentClass.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoCurrentClass(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		ModelAndView mav=new ModelAndView();
		if((Integer)session.getAttribute("idx")==null){
			mav.setViewName("/cybercampus/layover/msg");
			mav.addObject("msg", "접속권한이 없습니다.");
			mav.addObject("locationOrder", "index.do");
			return mav;
		}
			
		String usergrade=(String)session.getAttribute("usergrade");
		int idx=(Integer)session.getAttribute("idx");
		if (!(usergrade == null || usergrade.equals(""))) {
			if (usergrade.equals("teacher") || usergrade.equals("student") || usergrade.equals("master")) {
				
			}
		} else {
			mav.setViewName("/cybercampus/layover/msg");
			mav.addObject("msg", "접속권한이 없습니다.");
			mav.addObject("locationOrder", "index.do");
			return mav;
		}
		int totalCnt=0; //TotalCnt will be checked in next IF paragraph.
		int listSize=5;
		int pageSize=5;
		List<CC_ClassDTO> list=new ArrayList<CC_ClassDTO>();
		if(usergrade.equals("teacher")){
			totalCnt=cc_ClassDAO.CC_totalCntTeacherCurrentClassList(idx);
			list=cc_ClassDAO.CC_gotoTeacherCurrentClassList(cp, listSize, idx);
			mav.setViewName("/cybercampus/cc_02.currentClass/cc_teacher/cc_currentClass_main");
		}else if(usergrade.equals("student")){
			totalCnt=cc_ClassDAO.CC_totalCntStudentCurrentClassList(idx);
			list=cc_ClassDAO.CC_gotoStudentCurrentClassList(cp, listSize, idx);
			mav.setViewName("/cybercampus/cc_02.currentClass/cc_student/cc_currentClass_main");
		}else if(usergrade.equals("master")){
			totalCnt=cc_ClassDAO.CC_totalCntMasterCurrentClassList();
			list=cc_ClassDAO.CC_gotoMasterCurrentClassList(cp,listSize,idx);
			mav.setViewName("/cybercampus/cc_02.currentClass/cc_teacher/cc_currentClass_main");
		}
		totalCnt=totalCnt==0?1:totalCnt;
		Map<String,Object> searchMap=new HashMap<String,Object>();
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_gotoCurrentClass.do", totalCnt, listSize, pageSize, cp, searchMap);
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		session.setAttribute("classStatus","<a href=\"cc_gotoCurrentClass.do\">현재 강의실</a>");
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoPlannedClass.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoPlannedClass(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		ModelAndView mav=new ModelAndView();
		if((Integer)session.getAttribute("idx")==null){
			mav.setViewName("/cybercampus/layover/msg");
			mav.addObject("msg", "접속권한이 없습니다.");
			mav.addObject("locationOrder", "index.do");
			return mav;
		}
		String usergrade=(String)session.getAttribute("usergrade");
		int idx=(Integer)session.getAttribute("idx");
		if (!(usergrade == null || usergrade.equals(""))) {
			if (usergrade.equals("teacher") || usergrade.equals("student") || usergrade.equals("master")) {
				
			}
		} else {
			mav.setViewName("/cybercampus/layover/msg");
			mav.addObject("msg", "접속권한이 없습니다.");
			mav.addObject("locationOrder", "index.do");
			return mav;
		}
		int totalCnt=0; //TotalCnt will be checked in next IF paragraph.
		int listSize=5;
		int pageSize=5;
		List<CC_ClassDTO> list=new ArrayList<CC_ClassDTO>();
		if(usergrade.equals("teacher")){
			totalCnt=cc_ClassDAO.CC_totalCntTeacherPlannedClassList(idx);
			list=cc_ClassDAO.CC_gotoTeacherPlannedClassList(cp,listSize,idx);
			mav.setViewName("/cybercampus/cc_00.plannedClass/cc_teacher/cc_plannedClass_main");
		}else if(usergrade.equals("student")){
			totalCnt=cc_ClassDAO.CC_totalCntStudentPlannedClassList(idx);
			list=cc_ClassDAO.CC_gotoStudentPlannedClassList(cp, listSize, idx);
			mav.setViewName("/cybercampus/cc_00.plannedClass/cc_student/cc_plannedClass_main");
		}else if(usergrade.equals("master")){
			totalCnt=cc_ClassDAO.CC_totalCntMasterPlannedClassList();
			list=cc_ClassDAO.CC_gotoMasterPlannedClassList(cp,listSize,idx);
			mav.setViewName("/cybercampus/cc_00.plannedClass/cc_teacher/cc_plannedClass_main");
		}
		totalCnt=totalCnt==0?1:totalCnt;
		Map<String,Object> searchMap=new HashMap<String,Object>();
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_gotoPlannedClass.do", totalCnt, listSize, pageSize, cp, searchMap);
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		session.setAttribute("classStatus","<a href='cc_gotoPlannedClass.do'><span>개설예정강의<span></a>");
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoClassMain.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoClassMain(
			@RequestParam(value="class_idx")int class_idx,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		String usergrade=(String)session.getAttribute("usergrade");
		String class_subject=cc_ClassDAO.CC_getClassSubjectName(class_idx);
		session.setAttribute("class_idx", class_idx);
		session.setAttribute("class_subject", class_subject);
		CC_ClassDTO classInfo=cc_ClassDAO.CC_sessionClassInfo(class_idx);
		session.setAttribute("classInfo", classInfo);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("class_subject", class_subject);
		if(usergrade.equals("teacher")||usergrade.equals("master")){
			mav.setViewName("/cybercampus/cc_class/cc_class_index_tea");
			List<CC_RepositoryDTO> repoList=cc_ClassDAO.CC_indexRepositoryList(class_idx);
			List<CC_FreeBBSDTO> freeList=cc_ClassDAO.CC_indexFreeBBSList(class_idx);
			List<CC_TeacherNoticeDTO> teanoList=cc_ClassDAO.CC_indexTeacherNoticeList();
			List<CC_NoticeDTO> noList=cc_ClassDAO.CC_indexNoticeList(class_idx);
			for(int i=0;i<repoList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				repoList.get(i).setwDate(transFormat.format(repoList.get(i).getC_h_t_writedate()));
			}
			for(int i=0;i<freeList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				freeList.get(i).setString_writedate(transFormat.format(freeList.get(i).getC_f_b_writedate()));
			}
			for(int i=0;i<teanoList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				teanoList.get(i).setString_writedate(transFormat.format(teanoList.get(i).getT_n_writedate()));
			}
			for(int i=0;i<noList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				noList.get(i).setString_writedate(transFormat.format(noList.get(i).getC_n_writedate()));
			}
			mav.addObject("repoList", repoList);
			mav.addObject("freeList", freeList);
			mav.addObject("teanoList", teanoList);
			mav.addObject("noList", noList);
			return mav;
		}else if(usergrade.equals("student")){
			mav.setViewName("/cybercampus/cc_class/cc_class_index");
			List<CC_RepositoryDTO> repoList=cc_ClassDAO.CC_indexRepositoryList(class_idx);
			List<CC_FreeBBSDTO> freeList=cc_ClassDAO.CC_indexFreeBBSList(class_idx);
			List<CC_TeacherNoticeDTO> teanoList=cc_ClassDAO.CC_indexTeacherNoticeList();
			List<CC_NoticeDTO> noList=cc_ClassDAO.CC_indexNoticeList(class_idx);
			for(int i=0;i<repoList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				repoList.get(i).setwDate(transFormat.format(repoList.get(i).getC_h_t_writedate()));
			}
			for(int i=0;i<freeList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				freeList.get(i).setString_writedate(transFormat.format(freeList.get(i).getC_f_b_writedate()));
			}
			for(int i=0;i<teanoList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				teanoList.get(i).setString_writedate(transFormat.format(teanoList.get(i).getT_n_writedate()));
			}
			for(int i=0;i<noList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				noList.get(i).setString_writedate(transFormat.format(noList.get(i).getC_n_writedate()));
			}
			mav.addObject("repoList", repoList);
			mav.addObject("freeList", freeList);
			mav.addObject("teanoList", teanoList);
			mav.addObject("noList", noList);			
			return mav;
		}else{
			mav.setViewName("/cybercampus/layover/msg");
			mav.addObject("msg","허락되지 않은 접근입니다.");
			mav.addObject("locationOrder", "index.do");
			return mav;
		}

	}
	
	@RequestMapping(value="/cc_gotoClassMainRe.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoClassMain(
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int class_idx=(Integer)session.getAttribute("class_idx");
		String class_subject=cc_ClassDAO.CC_getClassSubjectName(class_idx);
		String usergrade=(String)session.getAttribute("usergrade");
		ModelAndView mav=new ModelAndView();
		mav.addObject("class_subject", class_subject);
		if(usergrade.equals("teacher")||usergrade.equals("master")){
			mav.setViewName("/cybercampus/cc_class/cc_class_index_tea");
			List<CC_RepositoryDTO> repoList=cc_ClassDAO.CC_indexRepositoryList(class_idx);
			List<CC_FreeBBSDTO> freeList=cc_ClassDAO.CC_indexFreeBBSList(class_idx);
			List<CC_TeacherNoticeDTO> teanoList=cc_ClassDAO.CC_indexTeacherNoticeList();
			List<CC_NoticeDTO> noList=cc_ClassDAO.CC_indexNoticeList(class_idx);
			for(int i=0;i<repoList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				repoList.get(i).setwDate(transFormat.format(repoList.get(i).getC_h_t_writedate()));
			}
			for(int i=0;i<freeList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				freeList.get(i).setString_writedate(transFormat.format(freeList.get(i).getC_f_b_writedate()));
			}
			for(int i=0;i<teanoList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				teanoList.get(i).setString_writedate(transFormat.format(teanoList.get(i).getT_n_writedate()));
			}
			for(int i=0;i<noList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				noList.get(i).setString_writedate(transFormat.format(noList.get(i).getC_n_writedate()));
			}
			mav.addObject("repoList", repoList);
			mav.addObject("freeList", freeList);
			mav.addObject("teanoList", teanoList);
			mav.addObject("noList", noList);
			return mav;
		}else if(usergrade.equals("student")){
			mav.setViewName("/cybercampus/cc_class/cc_class_index");
			List<CC_RepositoryDTO> repoList=cc_ClassDAO.CC_indexRepositoryList(class_idx);
			List<CC_FreeBBSDTO> freeList=cc_ClassDAO.CC_indexFreeBBSList(class_idx);
			List<CC_TeacherNoticeDTO> teanoList=cc_ClassDAO.CC_indexTeacherNoticeList();
			List<CC_NoticeDTO> noList=cc_ClassDAO.CC_indexNoticeList(class_idx);
			for(int i=0;i<repoList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				repoList.get(i).setwDate(transFormat.format(repoList.get(i).getC_h_t_writedate()));
			}
			for(int i=0;i<freeList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				freeList.get(i).setString_writedate(transFormat.format(freeList.get(i).getC_f_b_writedate()));
			}
			for(int i=0;i<teanoList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				teanoList.get(i).setString_writedate(transFormat.format(teanoList.get(i).getT_n_writedate()));
			}
			for(int i=0;i<noList.size();i++){
				SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
				noList.get(i).setString_writedate(transFormat.format(noList.get(i).getC_n_writedate()));
			}
			mav.addObject("repoList", repoList);
			mav.addObject("freeList", freeList);
			mav.addObject("teanoList", teanoList);
			mav.addObject("noList", noList);			
			return mav;
		}else{
			mav.setViewName("/cybercampus/layover/msg");
			mav.addObject("msg","허락되지 않은 접근입니다.");
			mav.addObject("locationOrder", "index.do");
			return mav;
		}
	}
	
	public String cc_gotoOnlineQuizMain(){
		return "/cybercampus/cc_03.onlineQuiz/cc_onlineQuiz_main";
	}
	
	@RequestMapping(value="/cc_gotoTeacherNoticeList.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoTeacherNoticeList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/cybercampus/cc_class/cc_01.notice/cc_teacherNotice_list");
		List<CC_TeacherNoticeDTO> teanoList=cc_ClassDAO.CC_indexTeacherNoticeList();
		for(int i=0;i<teanoList.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			teanoList.get(i).setString_writedate(transFormat.format(teanoList.get(i).getT_n_writedate()));
		}
		mav.addObject("teanoList", teanoList);
		return mav;
	}
	
	@RequestMapping(value="/cc_gotoTeacherNoticeContent.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoTeacherNoticeContent(
			@RequestParam(value="t_n_idx")int t_n_idx,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		CC_TeacherNoticeDTO dto=cc_ClassDAO.CC_TeacherNoticeContent(t_n_idx);
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		dto.setString_writedate(transFormat.format(dto.getT_n_writedate()));
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_01.notice/cc_teacherNotice_content");
		mav.addObject("dto", dto);
		return mav;
	}
}
