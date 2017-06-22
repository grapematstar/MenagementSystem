package gyum_02.my_student.model;

import java.util.*;

public interface my_stu_ClassStudentDAO {

	public List<Integer> getClassIdx(int stu_idx);
	
	public int getClassStudentNum(int class_idx);
	
	public List<Integer> getClassStudentIdxList(int class_idx);
}
