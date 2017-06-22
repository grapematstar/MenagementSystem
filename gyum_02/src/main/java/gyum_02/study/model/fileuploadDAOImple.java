package gyum_02.study.model;

import org.mybatis.spring.SqlSessionTemplate;

public class fileuploadDAOImple implements fileuploadDAO {
	
	SqlSessionTemplate sqlMap;
	
	public fileuploadDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	public int study_fileupload_insert(fileuploadDTO fdto) {
		int count = sqlMap.insert("study_fileupload_insert",fdto);
		return count;
	}

}
