package gyum_02.my_score.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_score_SchoolScoreDAOImple implements my_score_SchoolScoreDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_score_SchoolScoreDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_score_SchoolScoreDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<my_score_SchoolScoreDTO> getSchoolScore(int stu_idx, int year) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		map.put("s_s_s_year", year);
		
		List<my_score_SchoolScoreDTO> list = sqlMap.selectList("my_score_getSchoolScore", map);
		return list;
	}
	
	public List<my_score_SchoolScoreDTO> getSchoolScoreOneTerm(int stu_idx, int year, int term) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		map.put("s_s_s_year", year);
		map.put("s_s_s_term", term);
		List<my_score_SchoolScoreDTO> list = sqlMap.selectList("my_score_getSchoolScore_oneterm",map);
		return list;
	}

	public List<my_score_SchoolScoreDTO> getSchoolSubjectScore(int stu_idx, int year, int subject_num) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stu_idx", stu_idx);
		map.put("endyear", year);
		map.put("startyear", year-3);
		map.put("subject_num", subject_num);
		List<my_score_SchoolScoreDTO> list = sqlMap.selectList("my_score_school_getSubjectScore", map);
		return list;
	}
	
	public void setSchoolScore(my_score_SchoolScoreDTO msssdto) {
		sqlMap.insert("my_score_setSchoolScore", msssdto);
	}
	
	public int checkSchoolScoreDB(my_score_SchoolScoreDTO msssdto){
		int count = sqlMap.selectOne("my_score_checkSchoolScoreDB", msssdto);
		return count;
	}
	
	public void modiSchoolScore(my_score_SchoolScoreDTO msssdto) {
		sqlMap.update("my_score_modiSchoolScore", msssdto);
	}
}
