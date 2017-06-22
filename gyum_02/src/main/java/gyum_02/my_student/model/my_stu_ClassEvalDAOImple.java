package gyum_02.my_student.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_stu_ClassEvalDAOImple implements my_stu_ClassEvalDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_ClassEvalDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_stu_ClassEvalDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<my_stu_ClassEvalDTO> getEvalQuestion() {
		List<my_stu_ClassEvalDTO> list = sqlMap.selectList("my_student_evalQuestion");
		return list;
	}

}
