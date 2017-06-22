package gyum_02.masterpage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ClassDAOImple implements ClassDAO {

	private SqlSessionTemplate sqlMap;
	
	public ClassDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<ClassDTO> mp_c_select(int idx) {
		List<ClassDTO> classList = sqlMap.selectList("mp_c_select",idx);
		return classList;
	}
	
	public List<ClassDTO> mp_c_select_tea_idx(int class_idx) {
		List<ClassDTO> tea_idxs = sqlMap.selectList("mp_c_select_tea_idx",class_idx);
		return tea_idxs;
	}
	
	public List<ClassDTO> mp_c_allList() {
		List<ClassDTO> allClass = sqlMap.selectList("mp_c_allList");
		return allClass;
	}

	public List<ClassDTO> mp_c_tea_idx(int idx) {
		List<ClassDTO> tea_idx_list = sqlMap.selectList("mp_c_tea_idx",idx);
		return tea_idx_list;
	}
	
	public List<ClassDTO> mp_c_select_with_sn(int subject_num) {
		List<ClassDTO> list = sqlMap.selectList("mp_c_select_with_sn",subject_num);
		return list;
	}
	public int mp_c_delete(int tea_idx) {
		int count =sqlMap.delete("mp_c_delete",tea_idx);
		return count;
	}
	public List<ClassDTO> mp_c_select_tea_idx_paging(int class_idx, int cp, int ls) {
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("class_idx", class_idx);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<ClassDTO> list = sqlMap.selectList("mp_c_select_tea_idx_paging",map);
		return list;
	}
	public int mp_c_totalCnt(int class_idx) {
		int count = sqlMap.selectOne("mp_c_totalCnt",class_idx);
		return count;
	}
	public List<ClassDTO> mp_c_allList_where_tea_idx(int tea_idx) {
		List<ClassDTO> list = sqlMap.selectList("mp_c_allList_where_tea_idx",tea_idx);
		return list;
	}
}
