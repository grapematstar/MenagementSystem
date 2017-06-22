package gyum_02.mypage.model;

import java.util.HashMap;
import java.util.List;

import gyum_02.member.model.My_memberTeacherDTO;

public interface My_ClassTestDAO {

	public int class_Workbook_Write(My_ClassTestDTO dto);
	
	public List<My_ClassTestDTO> class_Workbook_List(int cp,int ls,int idx);
	
	public int workbook_TotalCnt(int idx);
	
	public int class_Question_Write(My_ClassTestDTO dto);
	
	public int question_Delete(My_ClassTestDTO dto);
	
	public int workbook_Question_Count(int test_idx,int c_t_testnum);
	
	public List<My_ClassTestDTO> class_workbook_Sel(int idx);
	
	public List<My_ClassTestDTO> my_stuclass_question_list(int test_idx,int c_t_q_idx);
	
	public List<My_ClassTestDTO> workbook_Question_List(HashMap map,int cp,int ls);
	
	public int workbook_Question_TotalCnt(int test_idx,int c_t_testnum,int class_test);

	public int woorkbook_question_Delete(My_ClassTestDTO dto);
	
	public int class_test_qna_option(My_ClassTestDTO dto);
	
	public int class_Question_Option_Write(My_ClassTestDTO dto,List<My_ClassTestDTO> list);
	
	public int class_test_qna_c_t_q_idx(int test_idx,int c_t_q_num);
	
	public My_ClassTestDTO class_question_update_select(int c_t_q_idx);
	
	public List<My_ClassTestDTO> class_question_option_update_select(int c_t_q_idx);
	
	public int class_question_qna_update(My_ClassTestDTO dto);
	
	public int class_question_option_update(List<My_ClassTestDTO> list);
	
	public int class_question_delete(int c_t_q_idx);
	
	public int class_question_option_delete(int c_t_q_idx);
	
	public int class_test_qna_option_update_delete(int test_idx,int c_t_q_idx);
	
}
