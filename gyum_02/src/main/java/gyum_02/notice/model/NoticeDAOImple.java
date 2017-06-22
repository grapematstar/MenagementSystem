package gyum_02.notice.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDAOImple implements NoticeDAO {

	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<NoticeDTO> notice_List(int cp, int ls) {
		int startnum = (cp-1)*ls+1;
		int endnum = (cp*ls);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<NoticeDTO> nlist = sqlMap.selectList("notice_List", map);			
		
		return nlist;
	}
	
	public List<Teacher_NoticeDTO> t_n_List(int cp, int ls) {
		int startnum = (cp-1)*ls+1;
		int endnum = (cp*ls);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<Teacher_NoticeDTO> tlist = sqlMap.selectList("t_n_List", map);
		
		return tlist;
	}
	
	public int getTotal(String sel) {
		int total = 0;
		total = sqlMap.selectOne(sel+"GetTotal");
		System.out.println(total);
		return total;
	}

	public int notice_Write(NoticeDTO dto) {
		int count = sqlMap.insert("notice_Write", dto);
		return count;
	}
	
	public int t_n_Write(Teacher_NoticeDTO tdto) {
		int count = sqlMap.insert("t_n_Write", tdto);
		return count;
	}
	
	public NoticeDTO notice_Content(int idx) {
		List<NoticeDTO> list = sqlMap.selectList("notice_Con", idx);		
		NoticeDTO dto = null;
		if(!(list==null||list.size()==0)) {
			dto = list.get(0);
		}
		return dto;
	}
	
	public Teacher_NoticeDTO t_n_Content(int idx) {
		List<Teacher_NoticeDTO> tlist = sqlMap.selectList("t_n_Con", idx);		
		Teacher_NoticeDTO tdto = null;
		if(!(tlist==null||tlist.size()==0)) {
			tdto = tlist.get(0);
		}
		return tdto;
	}

	public int notice_Update(NoticeDTO dto) {
		int count = sqlMap.update("notice_Update", dto);
		return count;
	}

	public int t_n_Update(Teacher_NoticeDTO dto) {
		int count = sqlMap.update("t_n_Update", dto);
		return count;
	}
	
	public int noticeDel(int idx, String sel) {
		int count = sqlMap.delete(sel+"Del", idx);
		return count;
	}

}
