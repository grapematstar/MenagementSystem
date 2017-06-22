package gyum_02.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class My_memberClassDAOImple implements My_memberClassDAO {

	private SqlSessionTemplate sqlMap;
	

	public My_memberClassDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public int class_Open(My_memberClassDTO dto){
		int count = sqlMap.insert("class_Write",dto);
		return count;
	}
}
