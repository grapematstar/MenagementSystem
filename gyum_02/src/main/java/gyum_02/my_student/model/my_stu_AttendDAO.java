package gyum_02.my_student.model;

import java.util.*;

public interface my_stu_AttendDAO {
	
	public my_stu_AttendDTO getAttendList(int class_idx, int stu_idx, int startdate, int enddate);
	
	public List<my_stu_AttendDTO> getTeacherClassAttendList(int class_idx, int year, int month);
	
	public List<Integer> getTeacherAttendDateList(int class_idx, int year, int month);
	
	public List<my_stu_AttendDTO> getIndividualAttendList(int class_idx, int stu_idx, int yearandmonth);
}
