package gyum_02.my_student.model;

import java.util.*;

public interface my_stu_TimetableDAO {
	
	public int setTimetable(List<my_stu_TimetableDTO> list);
	
	public int deleteTimetable(int stu_idx);
	
	public List<Integer> getTimetable(int stu_idx);
	
}
