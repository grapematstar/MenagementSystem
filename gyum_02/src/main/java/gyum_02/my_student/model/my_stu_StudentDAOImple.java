package gyum_02.my_student.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.*;

public class my_stu_StudentDAOImple implements my_stu_StudentDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_StudentDAOImple() {
		// TODO Auto-generated constructor stub
	}

	public my_stu_StudentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public String getStudentName(int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		String name = sqlMap.selectOne("my_student_getStudentName", map);
		return name;
	}
	
	public List<Integer> getParStudentIdx(int par_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("par_idx", par_idx);
		List<Integer> list = sqlMap.selectList("my_parent_getStudentIdx", map);
		return list;
	}
	
	public List<my_stu_StudentDTO> getStudentIdxListOrderByName(List<Integer> stuIdxList) {
		List<my_stu_StudentDTO> list = sqlMap.selectList("my_teacher_getStudentIdxOrderByName", stuIdxList);
		return list;
	}
	
	public int getParentIdxByStudent(int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		Object par_idx_o = sqlMap.selectOne("my_student_getParIdx", map);
		int par_idx = 0;
		if(par_idx_o != null) par_idx = (Integer)par_idx_o;
		return par_idx;
	}
}
