package gyum_02.cybercampus.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CC_EpilogueDAOImple implements CC_EpilogueDAO {

	private SqlSessionTemplate sqlMap;
	
	public CC_EpilogueDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	public List<CC_EpilogueDTO> cc_gotoEpilogueList(int cp, int ls, int class_idx) {
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("cp", cp);
		forSubmit.put("ls", ls);
		forSubmit.put("class_idx", class_idx);
		List<CC_EpilogueDTO> list = sqlMap.selectList("cc_gotoEpilogueClass",forSubmit);
		return list;
	}

	public void cc_submitEpilogueWrite(CC_EpilogueDTO dto) {
		sqlMap.insert("cc_submitEpilogueWrite", dto);
	}

	public void cc_submitEpilogueUpdate(CC_EpilogueDTO dto) {
		sqlMap.update("cc_submitEpilogueUpdate", dto);
	}

	public void cc_submitEpilogueDelete(int c_r_idx) {
		sqlMap.delete("cc_submitEpilogueDelete", c_r_idx);
	}
	
}
