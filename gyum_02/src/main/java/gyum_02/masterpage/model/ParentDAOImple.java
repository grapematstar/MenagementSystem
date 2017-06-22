package gyum_02.masterpage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ParentDAOImple implements ParentDAO {

	private SqlSessionTemplate sqlMap;
	
	public ParentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int mp_parent_add(ParentDTO dto) {
		int count = sqlMap.insert("mp_parent_insert",dto);
		return count;
	}

	public int mp_parent_update(ParentDTO dto) {
		int count = sqlMap.update("mp_parent_update",dto);
		return count;
	}
	
	public int mp_parent_delete(int idx) {
		int count = sqlMap.delete("mp_parent_delete",idx);
		return count;
	}
	
	public List<ParentDTO> mp_parent_allList() {
		List<ParentDTO> list = sqlMap.selectList("mp_parent_allList");
		return list;
	}
	
	public List<ParentDTO> mp_parent_select(String key){
		List<ParentDTO> list = sqlMap.selectList("mp_parent_select",key);
		return list;
	}
	
	public List<ParentDTO> mp_parent_info(int idx) {
		List<ParentDTO> list = sqlMap.selectList("mp_parent_info",idx);
		return list;
	}
	public List<ParentDTO> mp_parent_paging(int cp, int ls) {
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<ParentDTO> list = sqlMap.selectList("mp_parent_paging",map);
		return list;
	}
	public int mp_parent_totalCnt() {
		int count = sqlMap.selectOne("mp_parent_totalCnt");
		return count;
	}

}
