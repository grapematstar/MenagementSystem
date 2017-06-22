package gyum_02.study.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class leaderStudyDAOImple implements leaderStudyDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public leaderStudyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public List<leaderStudyDTO> getstudyleaderinfo(int study_idx) {
		List<leaderStudyDTO> list=sqlMap.selectList("getstudyleaderinfo",study_idx);
		return list;
	}
	
	
	public int study_leaderchange(leaderStudyDTO lstdto){
		int count=sqlMap.update("study_leaderchange",lstdto);
		return count;
	}
	public int study_seconchange(leaderStudyDTO lstdto){
		int count=sqlMap.update("study_seconchange",lstdto);
		return count;
	}

}
