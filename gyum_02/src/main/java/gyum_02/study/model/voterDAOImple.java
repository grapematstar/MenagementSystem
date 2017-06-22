package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class voterDAOImple implements voterDAO {
	private SqlSessionTemplate sqlMap;
	
	
	
	public voterDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}



	public int voterinsert(int study_voteidx,int study_votebbsidx,int stu_idx,String stu_id) {
		Map<String, Object> map=new HashMap();
		map.put("study_voteidx", study_voteidx);
		map.put("study_votebbsidx", study_votebbsidx);
		map.put("stu_id", stu_id);
		map.put("stu_idx", stu_idx);
		int count=sqlMap.insert("voterinsert",map);
		return count;
	}
	public List<voterDTO> getvoterstu_id(int study_votebbsidx,String stu_id){
		System.out.println("voterdao"+study_votebbsidx+"//"+stu_id);
		Map<String, Object> map=new HashMap<String, Object>();		
		map.put("study_votebbsidx", study_votebbsidx);
		map.put("stu_id", stu_id);
		List<voterDTO> list=sqlMap.selectList("getvoterstu_id",map);
		System.out.println(list.size());
		return list;
	}
	
	public int votercheck(int study_votebbsidx,String id){
		Map<String, Object> map=new HashMap();
		
		map.put("study_votebbsidx", study_votebbsidx);
		map.put("stu_id", id);
		int  result=0;
		try {
			result=sqlMap.selectOne("study_voter_check", map);	
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		System.out.println("votercheck"+result);
		
		return result;
	}
	
	public int voter_cancel(int study_voteidx,int study_votebbsidx,String id){
		Map<String, Object> map=new HashMap();
		map.put("study_voteidx", study_voteidx);
		map.put("study_votebbsidx", study_votebbsidx);
		map.put("stu_id",id);
		int count=sqlMap.delete("voter_cancel",map);
		return count;
		
	}

}
















