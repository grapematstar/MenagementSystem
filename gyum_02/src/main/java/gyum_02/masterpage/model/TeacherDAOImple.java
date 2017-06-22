package gyum_02.masterpage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class TeacherDAOImple implements TeacherDAO {

	private SqlSessionTemplate sqlMap;
	
	public TeacherDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public int mp_teacher_add(TeacherDTO dto){
		int count = sqlMap.insert("mp_teacher_insert",dto);
		return count;
	}
	
	public int mp_teacher_update(TeacherDTO dto) {
		int count = sqlMap.update("mp_teacher_update",dto);
		return count;
	}
	
	public int mp_teacher_delete(int idx) {
		int count = sqlMap.delete("mp_teacher_delete",idx);
		return count;
	}
	
	public List<TeacherDTO> mp_teacher_allList(){
		List<TeacherDTO> list=sqlMap.selectList("mp_teacher_allList");
		return list;
	}
	
	public List<TeacherDTO> mp_teacher_select(String key) {
		List<TeacherDTO> list = sqlMap.selectList("mp_teacher_select",key);
		return list;
	}
	
	public List<TeacherDTO> mp_teacher_info(int idx) {
		List<TeacherDTO> list = sqlMap.selectList("mp_teacher_info",idx);
		return list;
	}

	 public List<TeacherDTO> mp_teacher_subject(int idx) {
		 List<TeacherDTO> list = sqlMap.selectList("mp_teacher_subject",idx);
		 return list;
	}
	 public List<TeacherDTO> mp_teacher_name(String name) {
		 List<TeacherDTO> list = sqlMap.selectList("mp_teacher_name",name);
		 return list;
	}
	public List<TeacherDTO> mp_teacher_paging(int cp, int listSize) {
		int startnum = (cp-1)*listSize+1;
		int endnum = cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<TeacherDTO> list = sqlMap.selectList("mp_teacher_paging",map);
		return list;
	}
	public int mp_teacher_totalCnt() {
		int count = sqlMap.selectOne("mp_teacher_totalCnt");
		return count;
	}
}
