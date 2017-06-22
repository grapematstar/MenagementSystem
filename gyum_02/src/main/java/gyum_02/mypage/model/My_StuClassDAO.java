package gyum_02.mypage.model;

import java.util.Date;
import java.util.List;

public interface My_StuClassDAO {

	public List<My_StuClassDTO> class_check_History(int cp,int ls, int idx);
	
	public int stu_checkhisroty_TotalCnt(int idx);
	
	public List<My_StuClassDTO> stuclass_Test_List(int cp,int ls, int idx);
	
	public List<My_StuClassDTO> my_stuclass_question_list(int test_idx,int c_t_q_idx);
	
	public int stuclass_test_TotalCnt(int idx);
	
	public My_StuClassDTO stu_Test_Reply(int idx);
	
	public My_StuClassDTO stu_nextTest_Reply(int idx,int num);
	
	public int class_test_student_reply(My_StuClassDTO dto);
	
	public int stu_test_reply_maxnum(int idx);
	
	public List<My_StuClassDTO> class_test_student_select(int stu_idx,int test_idx);

	public int class_test_student_answer_update(int stu_idx,int c_t_q_idx);
	
	public int class_test_student_answer_upno(int stu_idx,int c_t_q_idx);
	
	public int class_test_student_sum_count(int stu_idx);
	
	public int class_test_student_sum_test(int stu_idx);
	
	public int class_test_student_sum_test_score(int stu_idx);
	
	public int class_test_student_rain_count(int stu_idx);
	
	public List<My_StuClassDTO> class_test_qnaAll(int test_idx);
	
	public List<My_StuClassDTO> class_test_solved_problem(int idx,int test_idx);
	
	public List<My_StuClassDTO> class_test_wrong_answer(int idx,int test_idx);
	
	public int class_test_student_time(int test_idx,int stu_idx);
	
	public String class_test_start_time(int test_idx,int stu_idx);
	
	public List<My_StuClassDTO> class_test_student_reply_size(int test_idx,int stu_idx);
	
	public List<My_StuClassDTO> class_test_qna_size(int test_idx,int stu_idx);
	
	public int class_test_reply_timezero(int c_t_q_idx,int stu_idx);
}
