package gyum_02.Freebbs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class FreebbsDAOImple implements FreebbsDAO {

	private SqlSessionTemplate sqlMap;
	
	public FreebbsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<FreebbsDTO> freebbsList(int cp, int ls) {
		int startnum = (cp-1)*ls+1;
		int endnum = (cp*ls);
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<FreebbsDTO> list = sqlMap.selectList("freebbsList", map);
		return list;
	}
	
	public int getTotal() {
		int total = sqlMap.selectOne("getTotal");
		return total;
	}
	
	public List<FreebbsDTO> freebbsReply(int cp, int ls, int idx) {
		int startnum = (cp-1)*ls+1;
		int endnum = (cp*ls);
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("idx", idx);
		List<FreebbsDTO> list = sqlMap.selectList("freebbsRep", map);
		return list;
	}

	public int getTotalRep(int idx) {
		int total = sqlMap.selectOne("getTotalrep", idx);
		return total;
	}
	
	public FreebbsDTO freebbsContent(int idx) {
		List<FreebbsDTO> list = sqlMap.selectList("freebbsCon", idx);
		FreebbsDTO dto = null;
		if(!(list==null||list.size()==0)) {
			dto = list.get(0);
		}
		return dto;
	}
	
	public int freebbsWrite(FreebbsDTO dto) {
		int count = sqlMap.insert("freebbsWrite", dto);
		return count;
	}

	public int freebbsDel(int idx) {
		int count = sqlMap.delete("freebbsDel", idx);
		return count;
	}

	public int read(int idx) {
		int read = 0;
		read = sqlMap.update("read", idx);
		return read;
	}

	public List<FreebbsDTO> pageMove(int f_b_idx) {
		List<FreebbsDTO> page = sqlMap.selectList("pageMove", f_b_idx);
		
		return page;
	}
	
	public int freebbsUpdate(FreebbsDTO dto) {
		int count = sqlMap.update("freebbsUpdate", dto);
		return count;
	}

}
