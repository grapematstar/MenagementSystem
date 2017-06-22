package gyum_02.my_score.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_score_SchoolGoalDAOImple implements my_score_SchoolGoalDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_score_SchoolGoalDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_score_SchoolGoalDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<my_score_SchoolGoalDTO> getSchoolGoal(int stu_idx, int year, int term) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		map.put("s_s_g_year", year);
		map.put("s_s_g_term", term);
		List<my_score_SchoolGoalDTO> list = sqlMap.selectList("my_score_school_getGoal",map);
		return list;
	}

	public List<my_score_SchoolGoalDTO> getSchoolGoalAll(int stu_idx, int year, int subject_num) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		map.put("endyear", year);
		map.put("startyear", year-3);
		map.put("subject_num", subject_num);
		List<my_score_SchoolGoalDTO> list = sqlMap.selectList("my_score_school_getSubjectGoal", map);
		return list;
	}
	
	public int checkSchoolGoal(my_score_SchoolGoalDTO mssgdto) {
		int count = sqlMap.selectOne("my_score_checkSchoolGoal", mssgdto);
		return count;
	}
	
	public void setSchoolGoal(my_score_SchoolGoalDTO mssgdto) {
		sqlMap.insert("my_score_setSchoolGoal", mssgdto);	
	}
	
	public void modiSchoolGoal(my_score_SchoolGoalDTO mssgdto) {
		sqlMap.update("my_score_modiSchoolGoal", mssgdto);
	}
}
