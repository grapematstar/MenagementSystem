package gyum_02.my_student.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.*;

public class my_stu_ClassEvalAnswerDAOImple implements my_stu_ClassEvalAnswerDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_ClassEvalAnswerDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_stu_ClassEvalAnswerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int setEvalAnswer(my_stu_ClassEvalAnswerDTO msceadto) {
		int count = sqlMap.insert("my_student_insert_evalAnswer", msceadto);
		return count;
	}
	
	public int existEvalAnswer(int class_idx, int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		
		int count = sqlMap.selectOne("my_student_existEvalAnswer", map);		
		return count;
	}
	
	public int fixEvalAnswer(int class_idx, int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		
		int fix = sqlMap.selectOne("my_student_fixEvalAnswer", map);		
		return fix;
	}

	public int doneEvalAnswer(int class_idx, int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		
		int count = sqlMap.update("my_student_doneEvalAnswer", map);		
		return count;
	}
	
	public int updateEvalAnswer(my_stu_ClassEvalAnswerDTO msceadto) {
		int count = sqlMap.update("my_student_update_evalAnswer", msceadto);
		return count;
	}
	
	public my_stu_ClassEvalAnswerDTO getEvalAnswer(int class_idx, int stu_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		
		my_stu_ClassEvalAnswerDTO dto = sqlMap.selectOne("my_student_getEvalAnswer", map);
		return dto;
	}
	
	public List<my_stu_ClassEvalAnswerDTO> getTeacherEvalList(int class_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		List<my_stu_ClassEvalAnswerDTO> list = sqlMap.selectList("my_teacher_getClassEvalList", map);
		return list;
	}
}
