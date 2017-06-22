package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class filebbsDAOImple implements filebbsDAO {
	SqlSessionTemplate sqlMap;
	
	public filebbsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public int makelistfilebbs(filebbsDTO dto) {
		int maxfbsun=-1;
		try{
		maxfbsun=sqlMap.selectOne("getmaxfilebbssunbun",dto);
		}catch (NullPointerException e) {
			// TODO: handle exception
		}
		if(maxfbsun>-1){
			dto.setStudy_filebbssunbun(maxfbsun+1);
		}else{
			dto.setStudy_filebbssunbun(0);
		}
		int count = sqlMap.insert("makelistfilebbs",dto);
		
		return  maxfbsun+1;
	}
	
	public List<filebbsDTO> getfilebbsList(int study_idx,int cp,int ls){
		  int startnum = (cp-1)*ls+1;
	      int endnum = cp*ls;
		Map<String, Integer> map=new HashMap<String, Integer>();
		   map.put("startnum", startnum);
		      map.put("endnum", endnum);
		      map.put("study_idx",study_idx);
		
		List<filebbsDTO> list= sqlMap.selectList("study_filebbs_List",map);
		return list;
	}
	public filebbsDTO getfilebbsContent(int study_filebbsidx) {
		filebbsDTO dto=sqlMap.selectOne("getfilebbsContent",study_filebbsidx);                  
		return dto;
	}
	public List<filebbsDTO> getstudy_filebbsreply(filebbsDTO dto) {
		List<filebbsDTO> list = sqlMap.selectList("getstudy_filebbsreply",dto);
		return list;
	}
	public int makestudy_filebbsreply(filebbsDTO dto){
		int maxreplysunbuncheck=-1;	
		try {
			maxreplysunbuncheck=sqlMap.selectOne("getmaxreplysunbun2",dto);
		} catch (NullPointerException e) {
			// TODO: handle exception
		}		
		System.out.println(maxreplysunbuncheck);
		if(maxreplysunbuncheck>-1){
			dto.setStudy_filebbsreply_sunbun((maxreplysunbuncheck+1));
		}else{
			dto.setStudy_filebbsreply_sunbun(0);
		}
		int count = sqlMap.insert("makestudy_filebbsreply",dto);
		return count;
	}
	public int study_filebbsdel(int study_filebbsidx) {
		int count = sqlMap.delete("study_filebbsdel",study_filebbsidx);
		return count;
	}
	public int study_filebbsupdate(filebbsDTO dto) {
		int count = sqlMap.update("study_filebbsupdate",dto);
		return count;
	}
	public int study_filebbsreplyupdate(filebbsDTO dto) {
		int count = sqlMap.update("study_filebbsreplyupdate",dto);
		return count;
	}
	public int getstudy_fileupload_s_f_idx(filebbsDTO dto){
		int s_f_idx=sqlMap.selectOne("getstudy_fileupload_s_f_idx",dto);
		return s_f_idx;
	}
	public int study_filebbs_gettotal(int study_idx){
		int count=sqlMap.selectOne("study_filebbs_gettotal",study_idx);
		return count;
	}
}
