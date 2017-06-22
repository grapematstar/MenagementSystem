package gyum_02.masterpage.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class Subject_numDAOImple implements Subject_numDAO {

	private SqlSessionTemplate sqlMap;
	
	public Subject_numDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<Subject_numDTO> mp_sn_select() {
		List<Subject_numDTO> snList = sqlMap.selectList("mp_sn_select");
		return snList;
	}
	
	public List<Subject_numDTO> mp_sn_select_name(int num) {
		List<Subject_numDTO> list = sqlMap.selectList("mp_sn_select_name",num);
		return list;
	}
}
