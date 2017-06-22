package gyum_02.study.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class studyroomDAOImple implements studyroomDAO {
	private SqlSessionTemplate sqlMap;
	
	
	public studyroomDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public List<studyroomDTO> studyroom_list(int date){
		List<studyroomDTO> list=sqlMap.selectList("studyroom_list",date);
		return list;
	}
	public int studyroom_reserv(studyroomDTO dto){
		int count=sqlMap.insert("studyroom_reserv",dto);
		return count;
	}
	
	public List<studyroomDTO> get_studyroom_reserv(studyroomDTO dto){
		List<studyroomDTO> list=sqlMap.selectList("get_studyroom_reserv",dto);
		return list;
	}
	
	
	public int studyroom_reserv_cencel(studyroomDTO dto){
		int count =sqlMap.delete("studyroom_reserv_cencel",dto);				
		return count;
	}
	
	public List<studyroomDTO> getstudyroom_list(String id){
		List<studyroomDTO> list=sqlMap.selectList("getstudyroom_list",id);
		return list;
	}
	public int studyroom_reserv_cencel2(int studyroom_idx){
		int count=sqlMap.delete("studyroom_reserv_cencel2",studyroom_idx);
		return count;
	}
	public int studyroom_totalCnt() {
		int count = sqlMap.selectOne("studyroom_totalCnt");
		return count;
	}
	public List<studyroomDTO> studyroom_paging_all(int cp, int ls) {
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<studyroomDTO> list = sqlMap.selectList("studyroom_paging_all", map);
		return list;
	}
	public int studyroom_garbage(int studyroom_idx) {
		int count = sqlMap.delete("studyroom_garbage",studyroom_idx);
		return count;
	}
	public List<studyroomDTO> studyroom_paging_search(int cp, int ls, String studyroom_id) {
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("studyroom_id", studyroom_id);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<studyroomDTO> list = sqlMap.selectList("studyroom_paging_search", map);
		return list;
	}
	public int studyroom_totalCnt_withId(String studyroom_id) {
		int count = sqlMap.selectOne("studyroom_totalCnt_withId",studyroom_id);
		return count;
	}
}
