package gyum_02.masterpage.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class LetterDAOImple implements LetterDAO {
	SqlSessionTemplate sqlMap;
	
	public LetterDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}

	public int mp_letter_insert(LetterDTO dto) {
		int count = sqlMap.insert("mp_letter_insert",dto);
		return count;
	}
	public List<LetterDTO> mp_letter_allList(int cp,int ls) {
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<LetterDTO> list = sqlMap.selectList("mp_letter_allList",map);
		return list;
	}
	public int mp_letter_totalCnt() {
		int count=sqlMap.selectOne("mp_letter_totalCnt");
		return count;
	}
	public LetterDTO mp_letter_content(int letter_idx) {
		LetterDTO dto=sqlMap.selectOne("mp_letter_content",letter_idx);
		return dto;
	}
	public List<Integer> mp_letter_dateCheck(Date min_letter_senddate, Date max_letter_senddate) {
		System.out.println(min_letter_senddate+"//"+max_letter_senddate);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("minnum", min_letter_senddate);
		map.put("maxnum", max_letter_senddate);
		List<Integer> idxlist=sqlMap.selectList("mp_letter_dateCheck", map);
		return idxlist;
	}
	
}
