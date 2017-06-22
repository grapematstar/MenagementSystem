package gyum_02.my_score.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_score_StudentScoreDAOImple implements my_score_StudentScoreDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_score_StudentScoreDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_score_StudentScoreDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<my_score_StudentScoreDTO> getStudentScore(int stu_idx, int class_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		map.put("class_idx", class_idx);
		List<my_score_StudentScoreDTO> list = sqlMap.selectList("my_score_getStudentScoreList", map);
		return list;
	}

	public List<Integer> getStudentScoreDate(int class_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		List<Integer> list = sqlMap.selectList("my_teacher_getStudentScoreDate", map);
		return list;
	}
	
	public List<my_score_StudentScoreDTO> getStudentScoreList(int class_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_idx", class_idx);
		List<my_score_StudentScoreDTO> list = sqlMap.selectList("my_teacher_getAllStudentScoreInfo", map);
		return list;
	}
}
