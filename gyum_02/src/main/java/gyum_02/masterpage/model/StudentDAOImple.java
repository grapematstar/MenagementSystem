package gyum_02.masterpage.model;

import org.mybatis.spring.SqlSessionTemplate;

import java.util.*;

public class StudentDAOImple implements StudentDAO {

	private SqlSessionTemplate sqlMap;
	
	public StudentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int mp_student_add(StudentDTO dto) {
		int count=sqlMap.insert("mp_student_insert",dto);
		return count;
	}
	
	public int mp_student_update(StudentDTO dto){
		int count=sqlMap.update("mp_student_update",dto);
		return count;
	}
	
	public int mp_student_delete(int idx) {
		int count=sqlMap.delete("mp_student_delete",idx);
		return count;
	}
	
	public List<StudentDTO> mp_student_allList() {
		List<StudentDTO> list=sqlMap.selectList("mp_student_allList");
		return list;
	}
	
	public List<StudentDTO> mp_student_select(String key) {
		List<StudentDTO> list = sqlMap.selectList("mp_student_select",key);
		return list;
	}
	
	public List<StudentDTO> mp_student_info(int idx) {
		List<StudentDTO> list = sqlMap.selectList("mp_student_info",idx);
		return list;
	}
	
	public List<StudentDTO> mp_student_info2(String name) {
		List<StudentDTO> list = sqlMap.selectList("mp_student_info2",name);
		return list;
	}
	
	public List<StudentDTO> mp_student_par(String key) {
		List<StudentDTO> list = sqlMap.selectList("mp_student_par",key);
		return list;
	}
	public int mp_student_getTotalCnt() {
		int count = sqlMap.selectOne("mp_student_totalCnt");
		return count;
	}
	public List<StudentDTO> mp_student_paging(int cp, int listSize) {
		int startnum = (cp-1)*listSize+1;
		int endnum = cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<StudentDTO> list = sqlMap.selectList("mp_student_paging",map);
		return list;
	}
	public List<StudentDTO> mp_student_paging_stu_idx(int stu_idx, int cp, int ls) {
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("stu_idx", stu_idx);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<StudentDTO> list = sqlMap.selectList("mp_student_paging_stu_idx",map);
		return list;
	}
	public int mp_student_get_idx(String stu_id) {
		int count = sqlMap.selectOne("mp_student_get_idx",stu_id);
		return count;
	}

}
