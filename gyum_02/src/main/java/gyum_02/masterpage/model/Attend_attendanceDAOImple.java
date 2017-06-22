package gyum_02.masterpage.model;

import org.mybatis.spring.SqlSessionTemplate;

public class Attend_attendanceDAOImple implements Attend_attendanceDAO {
	
	SqlSessionTemplate sqlMap;
	
	public Attend_attendanceDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	public String mp_aa_aaa(int idx) {
		String result=sqlMap.selectOne("mp_aa_aaa",idx);
		return result;
	}
}
