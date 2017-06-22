package gyum_02.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class StudentMemberDAOImple implements StudentMemberDAO {

	private SqlSessionTemplate sqlMap;
	
	public StudentMemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int studentAdd(StudentMemberDTO dto) {
		int count = sqlMap.insert("StudentMemberJoin",dto);
		return count;
	}

	public int studentRmv(String name) {
		int count = sqlMap.delete("StudentMemberDelete", name);
		return count;
	}

	public List<StudentMemberDTO> studentAllList() {
		List<StudentMemberDTO> list = sqlMap.selectList("StudentMemberList");
		return list;
	}

	public List<StudentMemberDTO> studentSearch(String name) {
		List<StudentMemberDTO> list = sqlMap.selectList("StudentMemberSearch", name);
		return list;
	}

	public int studentUpdate(String name) {
		int count = sqlMap.update("StudentMemberUpdate", name);
		return count;
	}
	
	public int studentLogin(String id, String pwd){
		String realpwd = sqlMap.selectOne("StudentMemberLogin", id);
		if(realpwd.equals(pwd)){
			return 1;
		}else{
			return -1;
		}
	}

}
