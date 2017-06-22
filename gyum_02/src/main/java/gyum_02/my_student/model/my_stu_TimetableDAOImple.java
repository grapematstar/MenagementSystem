package gyum_02.my_student.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_stu_TimetableDAOImple implements my_stu_TimetableDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_TimetableDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_stu_TimetableDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int setTimetable(List<my_stu_TimetableDTO> list) {
		int result = 0;
		for(int i = 0; i < list.size(); i++){			
			result = sqlMap.insert("my_student_timetable_set", list.get(i));
		}
		return result;
	}

	public int deleteTimetable(int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		int result = sqlMap.delete("my_student_timetable_delete", map);
		return result;
	}

	public List<Integer> getTimetable(int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		List<Integer> list = sqlMap.selectList("my_student_timetable_get", map);
		return list;
	}

}
