package gyum_02.my_student.model;

import java.util.*;

public interface my_stu_SubjectDAO {

	public String getSub(int subject_num);
	
	public List<String> getSubAll();
	
	public int getSubNum(String subject_name);
	
	public List<my_stu_SubjectDTO> getSubjectInfo();
}
