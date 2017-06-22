package gyum_02.my_student.model;

import java.util.*;

public interface my_stu_StudentDAO {

	public String getStudentName(int stu_idx);
	
	public List<Integer> getParStudentIdx(int par_idx);
	
	public List<my_stu_StudentDTO> getStudentIdxListOrderByName(List<Integer> stuIdxList);
	
	public int getParentIdxByStudent(int stu_idx);
}
