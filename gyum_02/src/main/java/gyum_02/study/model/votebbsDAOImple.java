package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class votebbsDAOImple implements votebbsDAO {
	private SqlSessionTemplate sqlMap;
	
	
	public votebbsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public int votebbsinsert(votebbsDTO dto) {
		int getref=-1;
		try {
			getref=sqlMap.selectOne("getstudy_votebbsref",dto);
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		
		dto.setStudy_votebbsref(getref+1);
		dto.setStudy_votebbssunbun(getref+1);
		int count=sqlMap.insert("votebbs_insert",dto);
		int study_votebbsidx=0;
		if(count>0){
			study_votebbsidx=sqlMap.selectOne("getstudy_votebbsidx", dto);
		}
		
		return study_votebbsidx;
	}
	public List<votebbsDTO> getvotebbsList(int study_idx,int cp,int ls){
		  int startnum = (cp-1)*ls+1;
	      int endnum = cp*ls;
		Map<String, Integer> map=new HashMap<String, Integer>();
		   map.put("startnum", startnum);
		      map.put("endnum", endnum);
		      map.put("study_idx",study_idx);
		      
		List<votebbsDTO> list=sqlMap.selectList("vote_bbslist",map);
		return list;
	}
	public votebbsDTO getvotecon(int sbvoteidx){
		List<votebbsDTO> list=sqlMap.selectList("getvotebbscon",sbvoteidx);
		return list.get(0);
	}
	   /*���⿩��*/
	   public int study_votebbsreplyupdate(votebbsDTO dto) {
	      int count = sqlMap.update("study_votebbsreplyupdate",dto);
	      return count;
	   }
	   public int study_votebbsdel(int study_votebbsidx) {
	      int count = sqlMap.delete("study_votebbsdel",study_votebbsidx);
	      return count;
	   }
	   public List<votebbsDTO> getstudy_votebbsreply(votebbsDTO dto) {
	      List<votebbsDTO> list = sqlMap.selectList("getstudy_votebbsreply",dto);
	      return list;
	   }
	   public int makestudy_votebbsreply(votebbsDTO dto){
	      int maxreplysunbuncheck=-1;   
	      try {
	         maxreplysunbuncheck=sqlMap.selectOne("getmaxreplysunbun2_vote",dto);
	      } catch (NullPointerException e) {
	         // TODO: handle exception
	      }      
	      System.out.println(maxreplysunbuncheck);
	      if(maxreplysunbuncheck>-1){
	         dto.setStudy_votebbsreply_sunbun((maxreplysunbuncheck+1));
	      }else{
	         dto.setStudy_votebbsreply_sunbun(0);
	      }
	      System.out.println(dto.getStu_name()+"�Ѥ�");
	      int count = sqlMap.insert("makestudy_votebbsreply",dto);
	      return count;
	   }
	   public int study_votebbs_gettotal(int study_idx){
		   int count=sqlMap.selectOne("study_votebbs_gettotal",study_idx);
		   return count;
	   }
	   
	   
}
