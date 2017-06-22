package gyum_02.my_student.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_stu_AttendDAOImple implements my_stu_AttendDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_AttendDAOImple() {
		// TODO Auto-generated constructor stub
	}

	public my_stu_AttendDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public my_stu_AttendDTO getAttendList(int class_idx, int stu_idx, int startdate, int enddate) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		
		my_stu_AttendDTO dayandattend = sqlMap.selectOne("my_student_getAttendList", map);
		return dayandattend;
	}
	
	public List<my_stu_AttendDTO> getTeacherClassAttendList(int class_idx, int year, int month) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		map.put("datestart", year*10000+month*100);
		map.put("dateend", year*10000+month*100+99);
		List<my_stu_AttendDTO> list = sqlMap.selectList("my_teacher_getStudentAttendList", map);
		return list;
	}
	
	public List<Integer> getTeacherAttendDateList(int class_idx, int year, int month) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		map.put("datestart", year*10000+month*100);
		map.put("dateend", year*10000+month*100+99);
		List<Integer> list = sqlMap.selectList("my_teacher_getStudentAttendDate", map);
		return list;
	}
	
	public List<my_stu_AttendDTO> getIndividualAttendList(int class_idx, int stu_idx, int yearandmonth) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		map.put("datestart", yearandmonth);
		map.put("dateend", yearandmonth+99);
		List<my_stu_AttendDTO> list = sqlMap.selectList("my_teacher_getIndividualAttendList", map);
		return list;
	}
}
