package gyum_02.my_student.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.*;

public class my_stu_AttendAttendanceDAOImple implements my_stu_AttendAttendanceDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_AttendAttendanceDAOImple() {
		// TODO Auto-generated constructor stub
	}

	public my_stu_AttendAttendanceDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public String getAttendance(int attend) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("a_a_idx", attend);
		String a_a_attendance = sqlMap.selectOne("my_student_getAttendance", map);
		return a_a_attendance;
	}
}
