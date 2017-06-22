package gyum_02.study.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class inqStudyDAOImple implements inqStudyDAO {

	private SqlSessionTemplate sqlMap;
	
	public inqStudyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int study_recruit_inq_send(inqStudyDTO dto) {
		System.out.println(dto.getStu_id()+dto.getStudy_inq_content()+dto.getStudy_inq_reciver()+dto.getStudy_recruitidx());
		int count=sqlMap.insert("study_recruit_inq_send",dto);
		return count;
	}
	public List<inqStudyDTO> study_reciv_list(String stu_id){
		List<inqStudyDTO> inqlist=sqlMap.selectList("study_reciv_list",stu_id);
		return inqlist;
	}
	
	public List<inqStudyDTO> study_inq_list(inqStudyDTO inqdto){
		List<inqStudyDTO> inqlist=new ArrayList<inqStudyDTO>();
		System.out.println(inqdto.getStudy_idx()+inqdto.getStudy_inq_reciver()+inqdto.getStudy_inq_sender()+inqdto.getStudy_recruitidx());
		if(inqdto.getStudy_idx()==0){
			inqlist=sqlMap.selectList("study_inq_list(recruitidx)",inqdto);
		}else{			
			inqlist=sqlMap.selectList("study_inq_list(study_idx)",inqdto);
		}		
		return inqlist;		
	}
	public int update_study_readcheck(inqStudyDTO inqdto){
		int count=0;
		if(inqdto.getStudy_idx()==0){
			count=sqlMap.update("update_study_readcheck(recruitidx)",inqdto);
		}else{
			count=sqlMap.update("update_study_readcheck(study_idx)",inqdto);
		}
		return count;
	}
	public List<inqStudyDTO> study_send_list(String stu_id){
		List<inqStudyDTO> inqlist=sqlMap.selectList("study_send_list",stu_id);
		return inqlist;
	}
	

}
