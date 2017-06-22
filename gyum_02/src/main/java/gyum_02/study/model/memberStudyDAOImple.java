package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import com.sun.beans.decoder.ValueObject;

import gyum_02.member.model.My_memberStudentDTO;

public class memberStudyDAOImple implements memberStudyDAO {
	
	private  SqlSessionTemplate sqlMap;
	
	
	
	
	
	public memberStudyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}





	public int membercheck(HttpSession session,int idx) {
		int s_idx=(Integer)session.getAttribute("idx");
		Map<String,Integer> map =new HashMap<String, Integer>();
		map.put("s_idx", s_idx);
		map.put("idx",idx);
		
		int result=1;
		String mem=sqlMap.selectOne("getstudy",map);
		if(mem==null){
			result=0;
		}
		
		return result;
	}
	
	public List<memberStudyDTO> getstudymemberinfo(int study_idx){
		List<memberStudyDTO> list=sqlMap.selectList("getstudymemberinfo",study_idx);
		return list;
	}
	public int study_memberdel(memberStudyDTO dto){
		int count=sqlMap.delete("study_memdel",dto);
		return count;
	}
	
	public int study_membercheck(String stu_id,int study_idx){
		Map<String , Object> map=new HashMap();
		map.put("stu_id", stu_id);
		map.put("study_idx",study_idx);
		int count=0;		
		List<memberStudyDTO> dto=sqlMap.selectList("study_membercheck",map);		
		if(dto.size()==0){			
		}else{
			count=1;
		}		
		return count;
	}
	
	public int study_memadd(String stu_id,int study_idx){		
		List<My_memberStudentDTO> stuDTO=sqlMap.selectList("getstudentinfo",stu_id);		
		memberStudyDTO memberDTO=new memberStudyDTO(study_idx, stuDTO.get(0).getStu_idx(), stu_id, stuDTO.get(0).getStu_name());				
		int count = sqlMap.insert("study_member_add",memberDTO);
		return count;
	}
	
	public int membercount(int study_idx){
		int count=sqlMap.selectOne("getmembercount",study_idx);
		return count;
	}
	
	public List<memberStudyDTO> getstudy_idx(int stu_idx){
		List<memberStudyDTO> mlist=sqlMap.selectList("getstudy_idx",stu_idx);
		return mlist;
	}

}
