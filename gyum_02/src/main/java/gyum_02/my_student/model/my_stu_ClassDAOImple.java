package gyum_02.my_student.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import gyum_02.my_student.model.*;

public class my_stu_ClassDAOImple implements my_stu_ClassDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_ClassDAOImple() {
		// TODO Auto-generated constructor stub
	}
		
	public my_stu_ClassDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public my_stu_ClassDTO getClassInfo(int class_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		my_stu_ClassDTO dto = sqlMap.selectOne("my_student_classinfo", map);
		return dto;
	}

	public List<my_stu_ClassDTO> getAllClassInfo(String search) {
		Calendar now = Calendar.getInstance();
		int today = now.get(Calendar.YEAR)*10000+(now.get(Calendar.MONTH)+1)*100+now.get(Calendar.DATE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("today", today);
		map.put("search", search);
		List<my_stu_ClassDTO> list = sqlMap.selectList("my_student_allClassInfo", map);
		return list;
	}
	
	public List<my_stu_ClassDTO> getClassDayandTime(List<Integer> cilist) {
		List<my_stu_ClassDTO> list = new ArrayList<my_stu_ClassDTO>();
		
		for(int i = 0; i < cilist.size(); i++){
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("class_idx", cilist.get(i));
			my_stu_ClassDTO dto = sqlMap.selectOne("my_student_getClassInfo_dayandtime", map);
			list.add(dto);
		}
		return list;
	}
	
	public List<String> getClassSubject(List<Integer> cilist) {
		List<String> list = new ArrayList<String>();
		for(int i = 0; i < cilist.size(); i++){
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("class_idx", cilist.get(i));
			String sub = sqlMap.selectOne("my_student_getClassSubject", map);
			list.add(sub);
		}
		
		return list;
	}
	
	public my_stu_ClassDTO getClassPeriod(int class_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		my_stu_ClassDTO dto = sqlMap.selectOne("my_student_getClassPeriod", map);
		return dto;
	}
	
	public List<my_stu_ClassDTO> getAllStudentClassInfo(List<Integer> cilist, int cp) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", cilist);
		map.put("cp", cp);
		List<my_stu_ClassDTO> list = sqlMap.selectList("my_student_getAllStudentClassInfo", map);
		return list;
	}
	
	public List<my_stu_ClassDTO> getAllTeacherClassInfo(int tea_idx, int cp) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("tea_idx", tea_idx);
		map.put("cp", cp);
		List<my_stu_ClassDTO> list = sqlMap.selectList("my_student_getAllTeacherClassInfo", map);
		return list;
	}
	
	public List<my_stu_ClassDTO> getAllTeacherClassTimetable(int tea_idx, int today) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("tea_idx", tea_idx);
		map.put("today", today);
		List<my_stu_ClassDTO> list = sqlMap.selectList("my_student_getTeacherClassInfo_timetable", map);
		return list;
	}
	
	public List<my_stu_ClassDTO> getAllStudentClassInfoEval(List<Integer> cilist, int cp, int today) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", cilist);
		map.put("cp", cp);
		map.put("today", today);
		List<my_stu_ClassDTO> list = sqlMap.selectList("my_student_getAllStudentClassInfo_eval", map);
		return list;
	}
}
