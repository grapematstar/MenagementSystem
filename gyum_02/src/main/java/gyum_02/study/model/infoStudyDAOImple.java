package gyum_02.study.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class infoStudyDAOImple implements infoStudyDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	
	
	
	public infoStudyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public int studyinfoadd(infoStudyDTO dto) {
		
		int count=sqlMap.insert("study_info_add",dto);
		
		return count;
	}

	public List<infoStudyDTO> getstudyinfo(int idx){
		List<infoStudyDTO> dto=sqlMap.selectList("getstudymeminfo",idx);
		return dto;
	}
	public infoStudyDTO getstudymem_info(String stu_id){
		System.out.println("daoimple"+stu_id);
		List<infoStudyDTO> infoDTO=sqlMap.selectList("getstudymem_info",stu_id);		
		if(infoDTO.size()==0){
			infoStudyDTO dto=new infoStudyDTO();
			dto.setStu_idx(0);
			return dto;
		}else{			
			return infoDTO.get(0);
		}
	}
	public int study_infoupdate(String stu_id){
		int count=sqlMap.update("study_infoupdate",stu_id);
		return count;
	}
	public int study_memdeport(String stu_id){
		int count=sqlMap.update("study_member_deport",stu_id);
		return count;
	}
}
