package gyum_02.cybercampus.Controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.text.Normalizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.cybercampus.Model.CC_RepositoryDAO;
import gyum_02.cybercampus.Model.CC_RepositoryDTO;

@Controller
public class CC_RepositoryController {
	
	@Autowired
	public CC_RepositoryDAO cc_RepositoryDAO;

	/* Homework Repository */
	//go to Teacher&Master + Student Homework List Page
	@RequestMapping(value="/cc_gotoHomeworkList.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoHomeworkList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session)throws Exception{
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int class_idx=(Integer)session.getAttribute("class_idx");
		String usergrade=(String)session.getAttribute("usergrade");
		List<CC_RepositoryDTO> list=new ArrayList<CC_RepositoryDTO>();
		ModelAndView mav=new ModelAndView();
		int totalCnt=cc_RepositoryDAO.cc_totalCntHomeworkList(class_idx);
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=5;
		int pageSize=5;
		Map<String,Object> searchMap=new HashMap<String,Object>();
		String pageStr=gyum_02.cybercampus.Model.CC_SearchPaging.searchPaging("cc_gotoHomeworkList.do", totalCnt, listSize, pageSize, cp, searchMap);
		if(usergrade.equals("teacher")||usergrade.equals("master")){
			list=cc_RepositoryDAO.cc_gotoTeacherCCRepositoryList(class_idx,cp,listSize);
			mav.setViewName("/cybercampus/cc_class/cc_05.repository/cc_teacher/cc_homework_list");
		}else if(usergrade.equals("student")){
			list=cc_RepositoryDAO.cc_gotoTeacherCCRepositoryList(class_idx,cp,listSize);
			mav.setViewName("/cybercampus/cc_class/cc_05.repository/cc_student/cc_homework_list");
		}
		String startDay="",endDay="",deadDay="",writeDay="";
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			startDay=transFormat.format(list.get(i).getC_h_t_startdate());
			list.get(i).setsDate(startDay);
//			Date startDate = transFormat.parse(nextDay);
//			list.get(i).setC_h_t_startdate(startDate);
			endDay=transFormat.format(list.get(i).getC_h_t_enddate());
			list.get(i).seteDate(endDay);
//			Date endDate=transFormat.parse(nextDay);
//			list.get(i).setC_h_t_enddate(endDate);
			deadDay=transFormat.format(list.get(i).getC_h_t_deadline());
			list.get(i).setdDate(deadDay);
//			Date deadDate=transFormat.parse(nextDay);
//			list.get(i).setC_h_t_deadline(deadDate);
			writeDay=transFormat.format(list.get(i).getC_h_t_writedate());
			list.get(i).setwDate(writeDay);
		}
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		return mav;
	}
	//Teacher can submit his request homework with this method.
	//Later I have to make deadline process.
	@RequestMapping(value="cc_submitHomeworkWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitHomeworkWrite(
			@RequestParam(value="c_h_t_subject",defaultValue="")String c_h_t_subject,
			@RequestParam(value="c_h_t_startyear",defaultValue="0")int c_h_t_startyear,
			@RequestParam(value="c_h_t_startmonth",defaultValue="0")int c_h_t_startmonth,
			@RequestParam(value="c_h_t_startday",defaultValue="0")int c_h_t_startday,
			@RequestParam(value="c_h_t_starthour",defaultValue="0")String c_h_t_starthour,
			@RequestParam(value="c_h_t_startmin",defaultValue="0")String c_h_t_startmin,
			@RequestParam(value="c_h_t_startsec",defaultValue="0")String c_h_t_startsec,
			@RequestParam(value="c_h_t_endyear",defaultValue="0")int c_h_t_endyear,
			@RequestParam(value="c_h_t_endmonth",defaultValue="0")int c_h_t_endmonth,
			@RequestParam(value="c_h_t_endday",defaultValue="0")int c_h_t_endday,
			@RequestParam(value="c_h_t_endhour",defaultValue="0")String c_h_t_endhour,
			@RequestParam(value="c_h_t_endmin",defaultValue="0")String c_h_t_endmin,
			@RequestParam(value="c_h_t_endsec",defaultValue="0")String c_h_t_endsec,
			@RequestParam(value="c_h_t_deadyear",defaultValue="0")int c_h_t_deadyear,
			@RequestParam(value="c_h_t_deadmonth",defaultValue="0")int c_h_t_deadmonth,
			@RequestParam(value="c_h_t_deadday",defaultValue="0")int c_h_t_deadday,
			@RequestParam(value="c_h_t_deadhour",defaultValue="0")String c_h_t_deadhour,
			@RequestParam(value="c_h_t_deadmin",defaultValue="0")String c_h_t_deadmin,
			@RequestParam(value="c_h_t_deadsec",defaultValue="0")String c_h_t_deadsec,
			@RequestParam(value="c_h_t_notice",defaultValue="")String c_h_t_notice,
			HttpSession session) throws Exception{
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		
		int c_h_t_startdate=c_h_t_startyear*10000+c_h_t_startmonth*100+c_h_t_startday;
		int c_h_t_enddate=c_h_t_endyear*10000+c_h_t_endmonth*100+c_h_t_endday;
		int c_h_t_deadline=c_h_t_deadyear*10000+c_h_t_deadmonth*100+c_h_t_deadday;
		
		int class_idx=(Integer)session.getAttribute("class_idx");
		CC_RepositoryDTO dto=new CC_RepositoryDTO();
		dto.setC_h_t_subject(c_h_t_subject);
		dto.setC_h_t_notice(c_h_t_notice);
		dto.setClass_idx(class_idx);
		if(c_h_t_startdate!=0){
			StringBuffer dateTemp=new StringBuffer(String.valueOf(c_h_t_startdate));
			dateTemp.insert(4, "-");
			dateTemp.insert(7, "-");
			String setDay=String.valueOf(dateTemp);
			setDay=setDay+" "+c_h_t_starthour+":"+c_h_t_startmin+":"+c_h_t_startsec;
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date okDay = transFormat.parse(setDay);
			dto.setC_h_t_startdate(okDay);
		}
		if(c_h_t_enddate!=0){
			StringBuffer dateTemp=new StringBuffer(String.valueOf(c_h_t_enddate));
			dateTemp.insert(4, "-");
			dateTemp.insert(7, "-");
			String setDay=String.valueOf(dateTemp);
			setDay=setDay+" "+c_h_t_endhour+":"+c_h_t_endmin+":"+c_h_t_endsec;
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date okDay = transFormat.parse(setDay);
			dto.setC_h_t_enddate(okDay);
		}
		if(c_h_t_deadline!=0){
			StringBuffer dateTemp=new StringBuffer(String.valueOf(c_h_t_deadline));
			dateTemp.insert(4, "-");
			dateTemp.insert(7, "-");
			String setDay=String.valueOf(dateTemp);
			setDay=setDay+" "+c_h_t_deadhour+":"+c_h_t_deadmin+":"+c_h_t_deadsec;
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date okDay = transFormat.parse(setDay);
			dto.setC_h_t_deadline(okDay);
		}else{
			StringBuffer dateTemp=new StringBuffer(String.valueOf(99990101));
			dateTemp.insert(4, "-");
			dateTemp.insert(7, "-");
			String setDay=String.valueOf(dateTemp);
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date okDay = transFormat.parse(setDay);
			dto.setC_h_t_deadline(okDay);
		}
		int result=cc_RepositoryDAO.cc_submitHomeworkWrite(dto);
		String msg=result>0?"과제 제출이 등록되었습니다.":"과제 제출 등록에 실패했습니다.";
		String locationOrder="cc_gotoHomeworkList.do";
		ModelAndView mav = new ModelAndView("cybercampus/layover/msg","msg",msg);
		mav.addObject("locationOrder", locationOrder);
		return mav;
	}
	//It makes to move Homework Content page for Teacher&Master + Student
	@RequestMapping(value="/cc_gotoHomeworkContent.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoHomeworkContent(
			@RequestParam(value="c_h_t_idx",defaultValue="0")int c_h_t_idx,
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
		CC_RepositoryDTO dto=new CC_RepositoryDTO();
		ModelAndView mav=new ModelAndView();
		if(usergrade.equals("teacher")||usergrade.equals("master")){
			dto=cc_RepositoryDAO.cc_gotoHomeworkContent(c_h_t_idx);
			mav.setViewName("/cybercampus/cc_class/cc_05.repository/cc_teacher/cc_homework_content");
		}else if(usergrade.equals("student")){
			dto=cc_RepositoryDAO.cc_gotoHomeworkContent(c_h_t_idx);
			mav.setViewName("/cybercampus/cc_class/cc_05.repository/cc_student/cc_homework_content");
		}
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		dto.setsDate(transFormat.format(dto.getC_h_t_startdate()));
		dto.seteDate(transFormat.format(dto.getC_h_t_enddate()));
		dto.setdDate(transFormat.format(dto.getC_h_t_deadline()));
		dto.setwDate(transFormat.format(dto.getC_h_t_writedate()));
		mav.addObject("dto", dto);
		return mav;
	}
	//Just move to write page for Teacher
	@RequestMapping(value="/cc_gotoHomeworkWrite.do",method=RequestMethod.GET)
	public ModelAndView cc_gotoHomeworkWrite(){
		ModelAndView mav = new ModelAndView("/cybercampus/cc_class/cc_05.repository/cc_teacher/cc_homework_write");
		return mav;
	}
	
	//Sidebar List + Write for Student
	@RequestMapping(value="cc_callHomeworkSideWrite.do",method=RequestMethod.GET)
	public ModelAndView cc_callHomeworkSideWrite(
			@RequestParam(value="c_h_t_idx",defaultValue="0")int c_h_t_idx,
			HttpSession session){
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int idx=(Integer)session.getAttribute("idx");
		int class_idx=(Integer)session.getAttribute("class_idx");
		String studentName=(String)session.getAttribute("name");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", idx);
		map.put("c_h_t_idx", c_h_t_idx);
		List<CC_RepositoryDTO> list=cc_RepositoryDAO.cc_getStudentHomeworkList(map);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_chswritedate(transFormat.format(list.get(i).getC_h_s_writedate()));
		}
		List<List<CC_RepositoryDTO>> forFilelist=new ArrayList<List<CC_RepositoryDTO>>();
		for(int i=0;i<list.size();i++){
			int c_h_s_idx=list.get(i).getC_h_s_idx();
			Map<String,Object> filemap=new HashMap<String,Object>();
			filemap.put("class_idx", class_idx);
			filemap.put("c_h_s_idx", c_h_s_idx);
			List<CC_RepositoryDTO> filelist=cc_RepositoryDAO.cc_getStudentHomeworkFile(filemap);
			forFilelist.add(filelist);
		}
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_05.repository/cc_student/cc_homework_sideWrite","c_h_t_idx",c_h_t_idx);
		mav.addObject("list", list);
		mav.addObject("studentName", studentName);
		mav.addObject("forFilelist", forFilelist);
		return mav;
	}
	
	@RequestMapping(value="cc_callTeacherHomeworkSideWrite.do",method=RequestMethod.GET)
	public ModelAndView cc_callTeacherHomeworkSideDownload(
			@RequestParam(value="c_h_t_idx",defaultValue="0")int c_h_t_idx,
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
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("class_idx", class_idx);
		map.put("c_h_t_idx", c_h_t_idx);
		List<CC_RepositoryDTO> list=cc_RepositoryDAO.cc_getStudentHomeworkListDownload(map);
		for(int i=0;i<list.size();i++){
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_chswritedate(transFormat.format(list.get(i).getC_h_s_writedate()));
		}
		List<List<CC_RepositoryDTO>> forFilelist=new ArrayList<List<CC_RepositoryDTO>>();
		for(int i=0;i<list.size();i++){
			int c_h_s_idx=list.get(i).getC_h_s_idx();
			Map<String,Object> filemap=new HashMap<String,Object>();
			filemap.put("class_idx", class_idx);
			filemap.put("c_h_s_idx", c_h_s_idx);
			List<CC_RepositoryDTO> filelist=cc_RepositoryDAO.cc_getStudentHomeworkFileDownloadList(filemap);
			forFilelist.add(filelist);
		}
		ModelAndView mav=new ModelAndView("/cybercampus/cc_class/cc_05.repository/cc_teacher/cc_homework_sideWrite","c_h_t_idx",c_h_t_idx);
		mav.addObject("list", list);
		mav.addObject("forFilelist", forFilelist);
		return mav;
	}
	
	
	@RequestMapping(value = "cc_callHomeworkSideDownload.do", method = RequestMethod.GET)
	public ModelAndView cc_callHomeworkSideDownload(
			@RequestParam(value = "c_h_t_idx", defaultValue = "0") int c_h_t_idx, HttpSession session) {
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int class_idx = (Integer) session.getAttribute("class_idx");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("class_idx", class_idx);
		map.put("c_h_t_idx", c_h_t_idx);
		List<CC_RepositoryDTO> list = cc_RepositoryDAO.cc_getStudentHomeworkListDownload(map);
		for (int i = 0; i < list.size(); i++) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			list.get(i).setString_chswritedate(transFormat.format(list.get(i).getC_h_s_writedate()));
		}
		List<List<CC_RepositoryDTO>> forFilelist = new ArrayList<List<CC_RepositoryDTO>>();
		for (int i = 0; i < list.size(); i++) {
			int c_h_s_idx = list.get(i).getC_h_s_idx();
			Map<String, Object> filemap = new HashMap<String, Object>();
			filemap.put("class_idx", class_idx);
			filemap.put("c_h_s_idx", c_h_s_idx);
			List<CC_RepositoryDTO> filelist = cc_RepositoryDAO.cc_getStudentHomeworkFile(filemap);
			forFilelist.add(filelist);
		}
		ModelAndView mav = new ModelAndView("/cybercampus/cc_class/cc_05.repository/cc_student/cc_homework_sideWrite",
				"c_h_t_idx", c_h_t_idx);
		mav.addObject("list", list);
		mav.addObject("forFilelist", forFilelist);
		return mav;
	}
	
	//Upload his homework files & submit his some notes.
	@RequestMapping(value="/cc_submitStudentHomeworkWrite.do",method=RequestMethod.POST)
	public ModelAndView cc_submitStudentHomeworkWrite(
			HttpSession session,
			@RequestParam(value="c_h_s_content",defaultValue="")String c_h_s_content,
			@RequestParam(value="c_h_t_idx",defaultValue="0")int c_h_t_idx,
			@RequestParam("homeworkUpload[]")List<MultipartFile> mfiles)throws Exception{
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		int class_idx=(Integer)session.getAttribute("class_idx");
		int stu_idx=(Integer)session.getAttribute("idx");
		String useFolder="C:/uploads/";
		File dir = new File(useFolder);
	    if(!dir.isDirectory())dir.mkdirs();
	    String genID="",originalfileName="",saveFileName="",savePath="";
	    Map<String,Object> homeworkMap=new HashMap<String,Object>();
	    homeworkMap.put("c_h_t_idx", c_h_t_idx);
	    homeworkMap.put("stu_idx", stu_idx);
	    homeworkMap.put("class_idx", class_idx);
	    homeworkMap.put("c_h_s_content", c_h_s_content);
	    
	    int checkHomeworkUploadStatus=cc_RepositoryDAO.cc_checkStudentHomeworkStatus(homeworkMap);
	    if(checkHomeworkUploadStatus>0){
	    	ModelAndView backMav=new ModelAndView();
	    	backMav.addObject("msg", "한 과제 당 제출은 한번만 가능합니다. 이미 제출하신 과제가 있다면 삭제 후 진행해주시기 바랍니다.");
	    	backMav.setViewName("yongJson");
	    	return backMav;
	    }
	    int checkHomeworkTimeOver=cc_RepositoryDAO.cc_checkStudentHomeworkTimeOver(homeworkMap);
	    if(checkHomeworkTimeOver>0){
	    	ModelAndView backMav=new ModelAndView();
	    	backMav.addObject("msg", "제출 기간이 지난 과제로 제출하실 수 없습니다.");
	    	backMav.setViewName("yongJson");
	    	return backMav;
	    }
	    int result=cc_RepositoryDAO.cc_submitStudentHomeworkWrite(homeworkMap);
	    int c_h_s_idx=cc_RepositoryDAO.cc_getStudentHomeworkWriteIDX();
	    for(int i=0;i<mfiles.size();i++){
	       	genID=UUID.randomUUID().toString();
	        originalfileName=mfiles.get(i).getOriginalFilename();
	        saveFileName=class_idx+stu_idx+genID+"_%&%_"+ originalfileName;
	        savePath=useFolder + saveFileName;
	        saveFileName=Normalizer.normalize(saveFileName, Normalizer.Form.NFC);
	        originalfileName=Normalizer.normalize(originalfileName, Normalizer.Form.NFC);
	        savePath=Normalizer.normalize(savePath, Normalizer.Form.NFC);
	        mfiles.get(i).transferTo(new File(savePath));	    	
	        Map<String,Object> fileMap=new HashMap<String,Object>();
		   	fileMap.put("class_idx", class_idx);
		    fileMap.put("c_h_s_idx", c_h_s_idx);
	    	fileMap.put("c_s_filepath", savePath);
		    fileMap.put("c_s_filename", saveFileName);
		    fileMap.put("c_s_orifilename", originalfileName);
		    cc_RepositoryDAO.cc_submitStudentHomeworkFileWrite(fileMap);
			}
		    String msg="",locationOrder="";
		    if(result>0){
		    	msg="과제 제출에 성공했습니다.";
		    	locationOrder="cc_gotoHomeworkList.do";
		    }else{
		    	msg="과제 제출에 실패했습니다.";
		    	locationOrder="cc_gotoHomeworkContent.do?c_h_t_idx="+c_h_t_idx;
		    }
	    ModelAndView mav=new ModelAndView("/cybercampus/layover/msg","msg",msg);
		mav.addObject("locationOrder", locationOrder);
		return mav;
	}
	//Teacher & Student can download with this method.
	@RequestMapping(value="/cc_downloadHomeworkFile.do",method=RequestMethod.GET)
	public ModelAndView cc_downloadHomeworkFile(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="c_s_idx")int c_s_idx,
			HttpSession session) throws Exception{
		if((Integer)session.getAttribute("idx")==null){
			String message="세션정보가 만료되었거나, 잘못된 접근입니다.\\n로그인 페이지로 이동합니다.";
			String loOrder="login.do";
			ModelAndView seMav=new ModelAndView("/cybercampus/layover/msg");
			seMav.addObject("msg", message);
			seMav.addObject("locationOrder", loOrder);
			return seMav;
		}
		CC_RepositoryDTO dto=cc_RepositoryDAO.cc_getStudentHomeworkFileDownloadPath(c_s_idx);
		File file = new File(dto.getC_s_filepath());
		ModelAndView mav =new ModelAndView("cybercampusDownload");
		if(!file.canRead()){
	        throw new Exception("File can't read(파일을 찾을 수 없습니다)");
	    }
		mav.addObject("downloadFile", file);
		return mav;		 
	}
	
	
	@RequestMapping(value="/cc_deleteStudentHomeworkDB.do",method=RequestMethod.GET)
	public ModelAndView cc_deleteStudentHomeworkDB(
			@RequestParam(value="c_h_s_idx",defaultValue="0")int c_h_s_idx,
			HttpSession session){
		int result = cc_RepositoryDAO.cc_deleteStudentHomeworkDB(c_h_s_idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("yongJson");
		if(result>0){
			String msg="과제물 삭제에 성공했습니다.";
			mav.addObject("msg", msg);
		}else{
			String msg="과제물 삭제에 실패했습니다. 잠시 후 다시 시도해주시기 바랍니다.";
			mav.addObject("msg", msg);
		}
		return mav;
	}
	
	@RequestMapping(value="/cc_deleteTeacherHomeworkContent.do",method=RequestMethod.GET)
	public ModelAndView cc_deleteTeacherHomeworkContent(
			@RequestParam(value="c_h_t_idx",defaultValue="0")int c_h_t_idx,
			HttpSession session){
		int result=cc_RepositoryDAO.cc_deleteTeacherHomeworkContent(c_h_t_idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/cybercampus/layover/msg");
		if(result>0){
			String msg="과제물 삭제에 성공했습니다.";
			mav.addObject("msg", msg);
			mav.addObject("locationOrder", "cc_gotoHomeworkList.do");
		}else{
			String msg="과제물 삭제에 실패했습니다. 잠시 후 다시 시도해주시기 바랍니다.";
			mav.addObject("msg", msg);
			mav.addObject("locationOrder", "cc_gotoHomeworkContent.do?c_h_t_idx="+c_h_t_idx);
		}
		return mav;
	}
	
}
