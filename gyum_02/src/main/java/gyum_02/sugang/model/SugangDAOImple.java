package gyum_02.sugang.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.member.model.My_memberStudentDTO;

public class SugangDAOImple implements SugangDAO {

	private SqlSessionTemplate sqlMap;
	
	public SugangDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<SugangDTO> sugangList() {
		List<SugangDTO> list = sqlMap.selectList("sugangList");
		return list;
	}
	
	
	public List<SugangDTO> sugangList(int cp, int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<SugangDTO> list = sqlMap.selectList("sugangList", map);
		return list;
	}

	public int userIdxSearch(String id) {
		
		List<My_memberStudentDTO> list = sqlMap.selectList("SearchStu_idx", id);
		
		My_memberStudentDTO sdto = new My_memberStudentDTO(list.get(0).getStu_idx(), null, "-", 0,
				"-", 0, null, "-", "-", null, null, "-", 0, 0, 0, null, null, null);
		
		int useridx = sdto.getStu_idx();
		System.out.println("3번째:"+useridx);
		return useridx;
	}
	
	public List<StudentInfoDTO> stuList(String id){
		List<StudentInfoDTO> stuList = sqlMap.selectList("stuInfoList", id);
		return stuList;
	}

	public int classTotalCnt() {
		int count = sqlMap.selectOne("sugangTotalCnt");
		return count;
	}

	public List<SugangDTO> searchKeyword(Map<String, Object> searchmap) {
		List<SugangDTO> list = sqlMap.selectList("sgsearchForThisUser", searchmap);
		return list;
	}

	public int searchTotalCnt(Map<String, Object> searchmap) {
		int count = sqlMap.selectOne("sgtotalCntSearchForThisClass", searchmap);
		return count;
	}
	
	

}
