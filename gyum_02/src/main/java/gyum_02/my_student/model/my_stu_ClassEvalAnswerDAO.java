package gyum_02.my_student.model;

import java.util.*;

public interface my_stu_ClassEvalAnswerDAO {

	public int setEvalAnswer(my_stu_ClassEvalAnswerDTO msceadto);
	
	public int existEvalAnswer(int class_idx, int stu_idx);
	
	/**fixed or not*/
	public int fixEvalAnswer(int class_idx, int stu_idx);
	
	/**fix the answer*/
	public int doneEvalAnswer(int class_idx, int stu_idx);
	
	public int updateEvalAnswer(my_stu_ClassEvalAnswerDTO msceadto);
	
	public my_stu_ClassEvalAnswerDTO getEvalAnswer(int class_idx, int stu_idx);
	
	public List<my_stu_ClassEvalAnswerDTO> getTeacherEvalList(int class_idx);
}
