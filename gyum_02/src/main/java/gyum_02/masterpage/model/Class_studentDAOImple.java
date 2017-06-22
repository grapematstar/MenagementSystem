package gyum_02.masterpage.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class Class_studentDAOImple implements Class_studentDAO {

	private SqlSessionTemplate sqlMap;
	
	public Class_studentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<Class_studentDTO> mp_cs_select(int stu_idx) {
		List<Class_studentDTO> IndexList = sqlMap.selectList("mp_cs_select",stu_idx);
		return IndexList;
	}
	
	public int mp_cs_insert(Class_studentDTO dto) {
		int count = sqlMap.insert("mp_cs_insert",dto);
		return count;
	}
	
	public int mp_cs_delete(Class_studentDTO dto) {
		int count = sqlMap.delete("mp_cs_delete",dto);
		return count;
	}
	
	public List<Class_studentDTO> mp_cs_stu_idx_paging(int class_idx,int cp,int listSize) { 
		int startnum = (cp-1)*listSize+1;
		int endnum = cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("class_idx", class_idx);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<Class_studentDTO> stu_idx_list = sqlMap.selectList("mp_cs_stu_idx_paging",map);
		return stu_idx_list;
	}
	public List<Class_studentDTO> mp_cs_stu_idx(int class_idx) { 
		List<Class_studentDTO> stu_idx_list = sqlMap.selectList("mp_cs_stu_idx",class_idx);
		return stu_idx_list;
	}
	
	public int mp_cs_delete_student(int idx) {
		int count = sqlMap.delete("mp_cs_delete_student",idx);
		return count;
	}
	public int mp_cs_totalCnt(int class_idx) {
		int count=sqlMap.selectOne("mp_cs_totalCnt",class_idx);
		return count;
	}

}
