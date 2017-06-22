package gyum_02.my_student.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_stu_SubjectDAOImple implements my_stu_SubjectDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_SubjectDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_stu_SubjectDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public String getSub(int subject_num) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("subject_num", subject_num);
		String subjectname = sqlMap.selectOne("my_student_subject", map);
		return subjectname;
	}

	public List<String> getSubAll() {
		List<String> list = sqlMap.selectList("my_student_subjectAll");
		return list;
	}
	
	public int getSubNum(String subject_name) {
		my_stu_SubjectDTO dto = sqlMap.selectOne("my_student_subject_num", subject_name);
		return dto.getSubject_num();
	}
	
	public List<my_stu_SubjectDTO> getSubjectInfo() {
		List<my_stu_SubjectDTO> list = sqlMap.selectList("my_student_getSubjectInfoAll");
		return list;
	}
}
