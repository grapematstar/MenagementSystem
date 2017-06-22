package gyum_02.my_student.model;

import java.util.*;
import gyum_02.my_student.model.*;

public interface my_stu_ClassDAO {
	
	public my_stu_ClassDTO getClassInfo(int class_idx);
	
	public List<my_stu_ClassDTO> getAllClassInfo(String search); 
	
	public List<my_stu_ClassDTO> getClassDayandTime(List<Integer> cilist);
	
	public List<String> getClassSubject(List<Integer> cilist);
	
	public my_stu_ClassDTO getClassPeriod(int class_idx);
	
	public List<my_stu_ClassDTO> getAllStudentClassInfo(List<Integer> cilist, int cp);
	
	public List<my_stu_ClassDTO> getAllTeacherClassInfo(int tea_idx, int cp);

	public List<my_stu_ClassDTO> getAllTeacherClassTimetable(int tea_idx, int today);
	
	public List<my_stu_ClassDTO> getAllStudentClassInfoEval(List<Integer> cilist, int cp, int today);
}
