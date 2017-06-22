package gyum_02.cybercampus.Model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CccccccDAOImple implements CccccccDAO {

	private SqlSessionTemplate sqlMap;
	
	public CccccccDAOImple() {
		super();
	}
	public CccccccDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public List getStudentCcRepositoryList(String stu_id) {
		return sqlMap.selectList("getStudentCcRepositoryList",stu_id);
	}

	public List getTeacherCcRepositoryList(String tea_id) {
		return sqlMap.selectList("getTeacherCcRepositoryList",tea_id);
	}

}
