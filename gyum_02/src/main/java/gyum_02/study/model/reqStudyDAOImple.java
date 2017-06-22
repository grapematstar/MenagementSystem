package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class reqStudyDAOImple implements reqStudyDAO {
	private SqlSessionTemplate sqlMap;
	
	
	public reqStudyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public int study_req_add(reqStudyDTO dto) {
		int count =sqlMap.insert("study_req_add",dto);
		return count;
	}
	public List<reqStudyDTO> study_req_check(reqStudyDTO dto){
		List<reqStudyDTO> list=sqlMap.selectList("study_req_check", dto);
		return list;
	}
	public List<reqStudyDTO> study_req_list(int idx){
		List<reqStudyDTO> list=sqlMap.selectList("study_req_list", idx);
		return list;
	}
	public int sutdy_req_del(reqStudyDTO reqdto){
		int count=sqlMap.delete("sutdy_req_del",reqdto);
		return count;
	}
	public List<reqStudyDTO> study_recru_reqlist(int study_recruitidx){
		List<reqStudyDTO> list=sqlMap.selectList("study_recru_reqlist",study_recruitidx);
		return list;
	}
	public int study_req_del(int stu_idx, int study_recruitidx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_idx", stu_idx);
		map.put("study_recruitidx", study_recruitidx);
		int count = sqlMap.delete("study_req_del",map);
		return count;
	}
	public int study_recruit_accept(int stu_idx, int study_recruitidx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_idx", stu_idx);
		map.put("study_recruitidx", study_recruitidx);
		int count = sqlMap.update("study_recruit_accept",map);
		return count;
	}
	public int study_recruit_cancle(int stu_idx, int study_recruitidx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_idx", stu_idx);
		map.put("study_recruitidx", study_recruitidx);
		int count = sqlMap.update("study_recruit_cancle",map);
		return count;
	}
	public int study_req_del2(int study_recruitidx){
		int count = sqlMap.delete("study_req_del2",study_recruitidx);
		return count;
	}
}
