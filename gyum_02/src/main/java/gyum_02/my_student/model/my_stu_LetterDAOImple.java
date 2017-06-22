package gyum_02.my_student.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class my_stu_LetterDAOImple implements my_stu_LetterDAO {

	private SqlSessionTemplate sqlMap;
	
	public my_stu_LetterDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public my_stu_LetterDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<my_stu_LetterDTO> getMyLetter(String id, int cp) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("letter_sendee", id);
		map.put("cp", cp);
		List<my_stu_LetterDTO> list = sqlMap.selectList("my_stu_getMyLetterList",map);
		return list;
	}
	
	public List<my_stu_LetterDTO> getMySendLetter(String id, int cp) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("letter_sender", id);
		map.put("cp", cp);
		List<my_stu_LetterDTO> list = sqlMap.selectList("my_stu_getMySendLetterList",map);
		return list;
	}
	
	public List<Integer> getNoReadLetterList(String id, int cp) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("letter_sendee", id);
		map.put("cp", cp);
		List<Integer> list = sqlMap.selectList("my_stu_getNoReadLetterList", map);
		return list;
	}

	public my_stu_LetterDTO getOneLetter(int letter_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("letter_idx", letter_idx);
		my_stu_LetterDTO dto = sqlMap.selectOne("my_stu_getOneLetterContent", map);
		return dto;
	}
	
	public void readLetter(int letter_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("letter_idx", letter_idx);
		sqlMap.update("my_stu_letter_read", map);
	}
	
	public int noReadLetterNumber(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("letter_sendee", id);
		int count = sqlMap.selectOne("my_stu_noReadLetterNumber", map);
		return count;
	}
	
	public void sendLetter(my_stu_LetterDTO dto) {
		sqlMap.insert("my_letter_send", dto);
	}
	
	public int getTotalLetter(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("letter_sendee", id);
		int count = sqlMap.selectOne("my_letter_getTotalNumber", map);
		return count;
	}
	
	public int getTotalSendLetter(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("letter_sender", id);
		int count = sqlMap.selectOne("my_sendletter_getTotalNumber", map);
		return count;
	}
	
	public List<my_stu_LetterDTO> getMyLetterIndex(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("letter_sendee", id);
		List<my_stu_LetterDTO> list = sqlMap.selectList("my_index_getMyLetter", map);
		return list;
	}
}
