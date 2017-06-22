package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class voteconListDAOImple implements voteconListDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public voteconListDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public int voteconListinsert(voteconStudyDTO vcsdto) {
		int count =sqlMap.insert("votecon_insert",vcsdto);
		return count;
	}

	public List<voteconStudyDTO> getvoteconlist(int study_idx,int study_votebbsidx){
		voteconStudyDTO dto=new voteconStudyDTO(0, study_idx, study_votebbsidx,"", 0);
		List<voteconStudyDTO> vcldto=sqlMap.selectList("getvoteconlist",dto);
		
		return vcldto;
	}
	public int updatevotenum(int study_voteidx){
		int count=sqlMap.update("updatevotenum",study_voteidx);
		return count;
	}
	public int vote_cancel(int study_voteidx,int study_votebbsidx){
		Map<String, Object> map=new HashMap();
		map.put("study_voteidx", study_voteidx);
		map.put("study_votebbsidx", study_votebbsidx);
		int count=sqlMap.update("vote_cancel",map);
		return count;
	}
}
