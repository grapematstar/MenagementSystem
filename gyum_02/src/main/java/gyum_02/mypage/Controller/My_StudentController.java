package gyum_02.mypage.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.mypage.model.*;
@Controller
public class My_StudentController {
	
	@Autowired
	private My_StuClassDAO My_stuClassDao;
	@Autowired
	private My_ClassTestDAO My_classTestDao;
	
	@RequestMapping("/my_classhistory.do")
	public ModelAndView stu_Check_List(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
		int idxs = (Integer)session.getAttribute("idx");
		int check_totalCnt = My_stuClassDao.stu_checkhisroty_TotalCnt(idxs);
		check_totalCnt = check_totalCnt == 0? 1 : check_totalCnt;
		int listSize = 5;
		int pageSize = 5;
		
		List<My_StuClassDTO> check_List = My_stuClassDao.class_check_History(cp, listSize, idxs);
		String check_pageStr = gyum_02.paging.Paging_PageModule.pageMake("my_classhistory.do", check_totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("check_List",check_List);
		mav.addObject("check_pageStr",check_pageStr);
		mav.setViewName("mypage/my_student/my_classhistory");
		return mav;
	}
	
	@RequestMapping("/my_stuclass_test_List.do")
	public ModelAndView stuclass_Test_List(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
		int idxs = (Integer)session.getAttribute("idx");
		int stuclass_Test_totalCnt = My_stuClassDao.stuclass_test_TotalCnt(idxs);
		stuclass_Test_totalCnt = stuclass_Test_totalCnt == 0? 1 : stuclass_Test_totalCnt;
		int listSize = 5;
		int pageSize = 5;
		List<My_StuClassDTO> stuclass_test_List = My_stuClassDao.stuclass_Test_List(cp, listSize, idxs);
		String stuclass_test_pageStr = gyum_02.paging.Paging_PageModule.pageMake("my_stuclass_test_List.do", stuclass_Test_totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("test_list", stuclass_test_List);
		mav.addObject("test_pageStr",stuclass_test_pageStr);
		mav.setViewName("mypage/my_student/my_classtest");
		return mav;
	}
	
	@RequestMapping("/stu_onetest.do")
	public ModelAndView stu_Test_Reply(int test_idx,int c_t_q_idx,HttpSession session){
		int stu_idx = (Integer)session.getAttribute("idx");
		ModelAndView mav = new ModelAndView();
		int result = 0;
		List<My_StuClassDTO> class_test_student_reply_size = My_stuClassDao.class_test_student_reply_size(test_idx, stu_idx);
		System.out.println("class_test_student_reply_size : "+class_test_student_reply_size.size());
		List<My_StuClassDTO> list = new ArrayList<My_StuClassDTO>();
		if(class_test_student_reply_size.size()>0){
			String msg = "이미 시험을 보셨으므로 시험 보실수 없습니다.";
			mav.addObject("msg",msg);
			mav.setViewName("mypage/my_student/my_classMsg");
			return mav;
		}else{
			String asd= My_stuClassDao.class_test_start_time(test_idx, stu_idx);
			My_StuClassDTO stu_Test_Reply = My_stuClassDao.stu_Test_Reply(test_idx);
			if(asd==null||asd.equals("")){
				result = My_stuClassDao.class_test_student_time(test_idx, stu_idx);
				asd = My_stuClassDao.class_test_start_time(test_idx, stu_idx);
			}
			List<My_ClassTestDTO> stuclass_question_list = My_classTestDao.my_stuclass_question_list(test_idx, c_t_q_idx);
			
			mav.addObject("start_time",asd);
			mav.addObject("stu_Test_Reply",stu_Test_Reply);
			mav.addObject("stuclass_question_list",stuclass_question_list);
			mav.setViewName("mypage/my_student/my_onetest_reply");
			return mav;
		}
	}
	
	@RequestMapping("test_student_reply.do")
	public ModelAndView class_test_student_reply(My_StuClassDTO dto,int idx,int num,HttpSession session,int c_t_q_idx,int c_t_s_r_answer){
		
		int stu_idx = (Integer)session.getAttribute("idx");
		int test_idx = idx;
		session.setAttribute(String.valueOf(c_t_q_idx), c_t_s_r_answer);
		System.out.println(String.valueOf(c_t_q_idx));
		My_StuClassDTO qdto=My_stuClassDao.stu_nextTest_Reply(idx,num);
		ModelAndView mav=new ModelAndView();
		if(qdto==null||qdto.getC_t_q_question().equals("")){
			List<My_StuClassDTO> c_t_q_list = My_stuClassDao.class_test_qnaAll(test_idx);
			for(int i=0;i<c_t_q_list.size();i++){
				My_StuClassDTO forInsert=new My_StuClassDTO();
				int stu_reply = (Integer)session.getAttribute(String.valueOf(c_t_q_list.get(i).getC_t_q_idx()));
				int right_reply = c_t_q_list.get(i).getC_t_q_answer();
				forInsert.setStu_idx(stu_idx);
				forInsert.setC_t_s_r_answer(stu_reply);
				forInsert.setC_t_q_idx(c_t_q_list.get(i).getC_t_q_idx());
				if(stu_reply==right_reply){					
					forInsert.setC_t_s_r_correctness(1);
				}else{
					forInsert.setC_t_s_r_correctness(0);
				}
				int class_test_student_reply = My_stuClassDao.class_test_student_reply(forInsert);;
				int class_test_student_sum_count = My_stuClassDao.class_test_student_sum_count(stu_idx);
				int class_test_student_sum_test = My_stuClassDao.class_test_student_sum_test(stu_idx);
				int class_test_student_sum_test_score = My_stuClassDao.class_test_student_sum_test_score(stu_idx);
				int class_test_student_rain_count = My_stuClassDao.class_test_student_rain_count(stu_idx);
				mav.addObject("class_test_student_reply",class_test_student_reply);
				mav.addObject("class_test_student_sum_count",class_test_student_sum_count);
				mav.addObject("class_test_student_sum_test",class_test_student_sum_test);
				mav.addObject("class_test_student_sum_test_score",class_test_student_sum_test_score);
				mav.addObject("class_test_student_rain_count",class_test_student_rain_count);
				mav.addObject("test_idx",test_idx);
			}
			mav.setViewName("mypage/my_student/my_class_test_sumtest");
			return mav;
		}
		mav.setViewName("mypage/my_student/my_onetest_reply");
		mav.addObject("stu_Test_Reply", qdto);
		return mav;
	}
	
	@RequestMapping("/class_test_solved_problem.do")
	public ModelAndView class_test_solved_problem(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="test_idx")int test_idx,HttpSession session){
		int idxs = (Integer)session.getAttribute("idx");
		
		List<My_StuClassDTO> solved_List = My_stuClassDao.class_test_solved_problem(idxs, test_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("solved_List",solved_List);
		mav.setViewName("mypage/my_student/my_class_solved_problem");
		return mav;
	}
	
	@RequestMapping("/class_test_wrong_answer.do")
	public ModelAndView class_test_wrong_answer(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="test_idx")int test_idx,HttpSession session){
		int idxs = (Integer)session.getAttribute("idx");
		
		List<My_StuClassDTO> answer_List = My_stuClassDao.class_test_wrong_answer(idxs, test_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("answer_List",answer_List);
		System.out.println(answer_List.size());
		mav.setViewName("mypage/my_student/my_class_test_wrong_answer");
		return mav;
	}
	
	@RequestMapping("/class_test_reply_timezero.do")
	public ModelAndView class_test_reply_timezero(My_StuClassDTO dto,int test_idx,HttpSession session){
		int stu_idx = (Integer)session.getAttribute("idx");
		ModelAndView mav = new ModelAndView();
		int result = 0;
		List<My_StuClassDTO> test_qna_list = My_stuClassDao.class_test_qna_size(test_idx, stu_idx);
		
		System.out.println("reply_timezero_list : "+test_qna_list.size());
		for(int i=0;i<test_qna_list.size();i++){
			result = My_stuClassDao.class_test_reply_timezero(test_qna_list.get(i).getC_t_q_idx(),test_qna_list.get(i).getStu_idx());
		}
			String msg = result>0?"시간 초과 하였으므로 0점입니다.":"시간초과 안하엿습니다.";
			mav.addObject("msg",msg);
			mav.setViewName("/mypage/my_student/my_classMsg");
			return mav;
	}
}
