package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.w3c.dom.ls.LSInput;

public class study_bbsDAOImple implements study_bbsDAO {
	
	private SqlSessionTemplate sqlMap;
	public study_bbsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public List<study_bbsDTO> study_bbslist_get(study_bbsDTO dto,int cp,int ls) {		
		  int startnum = (cp-1)*ls+1;
	      int endnum = cp*ls;
		Map<String, Integer> map=new HashMap<String, Integer>();
		   map.put("startnum", startnum);
		      map.put("endnum", endnum);
		      map.put("study_idx",dto.getStudy_idx());
		      map.put("study_bbsref",dto.getStudy_bbsref());
		      
		      
		List<study_bbsDTO> list=sqlMap.selectList("study_bbslist_get",map);		
		return	list;
	}	
	public List<study_bbsDTO> study_bbslist(study_bbsDTO dto) {		
		List<study_bbsDTO> list=sqlMap.selectList("study_bbslist",dto);		
		return	list;
	}	
	
	
	public int study_bbsinsert(study_bbsDTO dto){
		int maxbbssunbuncheck=-1;
		try {
			maxbbssunbuncheck=sqlMap.selectOne("getmaxbbssunbun",dto);
		} catch (Exception e) {
			// TODO: handle exception
		}		
		if(maxbbssunbuncheck>-1){
			dto.setStudy_bbssunbun((maxbbssunbuncheck+1));
		}else{
			dto.setStudy_bbssunbun(0);
		}
		int count=sqlMap.insert("study_bbsinsert",dto);
		return count;
	}
	
	public List<study_bbsDTO> study_bbscontent(int study_bbsidx){
		List<study_bbsDTO> list=sqlMap.selectList("studybbscontent",study_bbsidx);
		
		return list;
	}
	public List<study_bbsDTO> study_bbsreply(study_bbsDTO dto){
		List<study_bbsDTO> list=sqlMap.selectList("studybbsreply",dto);
		
		return list;
	}
	public int study_replyinsert(study_bbsDTO dto){		
		int maxreplysunbuncheck=-1;	
		
		try {
			maxreplysunbuncheck=sqlMap.selectOne("getmaxreplysunbun",dto);
		} catch (Exception e) {
			// TODO: handle exception
		}		
		System.out.println("���� �ƽ� ��"+maxreplysunbuncheck);
		if(maxreplysunbuncheck>-1){
			dto.setStudy_bbsreply_sunbun((maxreplysunbuncheck+1));
		}else{
			dto.setStudy_bbsreply_sunbun(0);
		}
		int count=sqlMap.insert("study_bbsreplyinsert",dto);
		System.out.println("���þֵ� ���� ���"+count);
		return count;
	}
	public int get_studybbslist_total(study_bbsDTO dto){
		int count=sqlMap.selectOne("get_studybbslist_total",dto);
		return count;
	}
	
	   public int study_bbsreplyupdate(study_bbsDTO dto) {
		      int count = sqlMap.update("study_bbsreplyupdate",dto);
		      return count;
		   }
		   public int study_bbsdel(int study_bbsidx) {
		      int count = sqlMap.delete("study_bbsdel",study_bbsidx);
		      return count;
		   }
	
}
