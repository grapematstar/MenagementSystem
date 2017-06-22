package gyum_02.masterpage.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class AttendDAOImple implements AttendDAO {
	
	SqlSessionTemplate sqlMap;
	
	public AttendDAOImple(SqlSessionTemplate sqlMap) {
		// TODO Auto-generated constructor stub
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<AttendDTO> mp_attend_someone(int idx) {
		List<AttendDTO> list=sqlMap.selectList("mp_attend_someone",idx);
		return list;
	}
	public List<AttendDTO> mp_attend_getinfo(AttendDTO dto){
		List<AttendDTO> list=sqlMap.selectList("mp_attend_getinfo",dto);
		return list;
	}
	
	public int mp_attend_delete(int stu_idx) {
		int count = sqlMap.delete("mp_attend_delete",stu_idx);
		return count;
	}
}
