package gyum_02.my_score.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

public class my_score_TeacherDAOImple implements my_score_TeacherDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_score_TeacherDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_score_TeacherDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public String getTeacherName(int tea_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("tea_idx", tea_idx);
		String name = sqlMap.selectOne("my_teacher_getTeacherName", map);
		return name;
	}

}
