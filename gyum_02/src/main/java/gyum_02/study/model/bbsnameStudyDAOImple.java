package gyum_02.study.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

public class bbsnameStudyDAOImple implements bbsnameStudyDAO {

	private SqlSessionTemplate sqlMap;
	
	public bbsnameStudyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public List<bbsnameStudyDTO> bbsnamelist(HttpSession session) {
		int study_idx=(Integer)session.getAttribute("study_idx");
		List<bbsnameStudyDTO> list=sqlMap.selectList("bbsnamelist_get",study_idx);
		return list;
	} 
	
	public int bbsnameinsert(bbsnameStudyDTO dto,HttpSession session){
		int study_idx=(Integer)session.getAttribute("study_idx");
		int maxref=sqlMap.selectOne("getmaxref",study_idx);		
		dto=new bbsnameStudyDTO(study_idx, dto.getStudy_bbsname(), maxref+1);
		int count=sqlMap.insert("study_bbsname",dto);		
		return count;
	}
	public int bbsnamedel(bbsnameStudyDTO dto){
		int count=sqlMap.delete("bbsnamedel",dto);
		return count;
	}
	
	public String bbsnameget(bbsnameStudyDTO dto){
		String bbsname=sqlMap.selectOne("bbsnameGet", dto);
		System.out.println("bbsname : "+bbsname);
		return bbsname;
	}


}
