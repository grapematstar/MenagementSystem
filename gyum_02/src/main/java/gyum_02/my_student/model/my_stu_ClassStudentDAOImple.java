package gyum_02.my_student.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_stu_ClassStudentDAOImple implements my_stu_ClassStudentDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_ClassStudentDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_stu_ClassStudentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<Integer> getClassIdx(int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		
		List<Integer> list = sqlMap.selectList("my_student_getClassIdx", map);
		return list;
	}

	public int getClassStudentNum(int class_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		int count = sqlMap.selectOne("my_teacher_getClassStudentNumber", map);
		return count;
	}
	
	public List<Integer> getClassStudentIdxList(int class_idx){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		List<Integer> list = sqlMap.selectList("my_teacher_getClassStudentIdxList", map);
		return list;
	}
}
