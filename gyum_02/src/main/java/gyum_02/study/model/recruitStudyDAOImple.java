package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class recruitStudyDAOImple implements recruitStudyDAO {
	private SqlSessionTemplate sqlMap;

	public recruitStudyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int study_recruit_insert(recruitStudyDTO dto) {
		int count = sqlMap.insert("study_recruit_insert", dto);
		return count;
	}

	public List<recruitStudyDTO> study_recruit_list(int cp, int ls) {
		int startnum = (cp - 1) * ls + 1;
		int endnum = cp * ls;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<recruitStudyDTO> list = sqlMap.selectList("study_recruit_list", map);
		return list;
	}

	public List<recruitStudyDTO> getstudy_recruit(int study_recruitidx) {
		List<recruitStudyDTO> list = sqlMap.selectList("getstudy_recruit", study_recruitidx);
		return list;
	}

	public int study_recruit_req_update_plus(int study_recruitidx) {
		int count = sqlMap.update("study_recruit_req_update_plus", study_recruitidx);
		return count;
	}

	public int study_recruit_req_update_minus(int study_recruitidx) {
		int count = sqlMap.update("study_recruit_req_update_minus", study_recruitidx);
		return count;
	}

	public int getstudy_recruitidx(recruitStudyDTO dto) {
		int study_recruitidx = sqlMap.selectOne("getstudy_recruitidx", dto);
		return study_recruitidx;
	}

	public List<recruitStudyDTO> getstudy_recruitlist(int stu_idx) {
		List<recruitStudyDTO> list = sqlMap.selectList("getstudy_recruitlist", stu_idx);
		return list;
	}

	public int get_study_recruit_total() {
		int count = sqlMap.selectOne("get_study_recruit_total");
		return count;
	}

	public int get_studyRecruit_total_theme(String theme) {
		int count = sqlMap.selectOne("get_studyRecruit_total_theme", theme);
		return count;
	}

	public int get_studyRecruit_total_title(String title) {
		int count = sqlMap.selectOne("get_studyRecruit_total_title", title);
		return count;
	}

	public List<recruitStudyDTO> studyRecruitlist_theme(int cp, int ls, String theme) {
		int startnum = (cp - 1) * ls + 1;
		int endnum = cp * ls;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theme", theme);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<recruitStudyDTO> list = sqlMap.selectList("studyRecruitlist_theme", map);
		return list;
	}

	public List<recruitStudyDTO> studyRecruitlist_title(int cp, int ls, String title) {
		int startnum = (cp - 1) * ls + 1;
		int endnum = cp * ls;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<recruitStudyDTO> list = sqlMap.selectList("studyRecruitlist_title", map);
		return list;
	}
	
	
	
	public int study_recruit_del(int stu_idx, int study_recruitidx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_idx", stu_idx);
		map.put("study_recruitidx", study_recruitidx);
		int count = sqlMap.delete("study_recruit_del",map);
		return count;
	}
	public int study_recruit_close(int stu_idx, int study_recruitidx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_idx", stu_idx);
		map.put("study_recruitidx", study_recruitidx);
		int count = sqlMap.update("study_recruit_close",map);
		return count;
	}
	public List<recruitStudyDTO> getstudy_make_recruitlist(String id){
		List<recruitStudyDTO> list = sqlMap.selectList("getstudy_make_recruitlist", id);
		return list;
	}
	public int rcs_close(int study_recruitidx){
		int count=sqlMap.update("rcs_close",study_recruitidx);
		return count;
	}

}
