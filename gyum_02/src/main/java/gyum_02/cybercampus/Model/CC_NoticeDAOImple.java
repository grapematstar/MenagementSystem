package gyum_02.cybercampus.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CC_NoticeDAOImple implements CC_NoticeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public CC_NoticeDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	public int cc_submitNoticeWrite(CC_NoticeDTO dto) {
		int count=sqlMap.insert("cc_submitNoticeWrite",dto);
		return count;
	}
	public List<CC_NoticeDTO> cc_gotoNoticeList(int club_idx,int cp,int listSize){
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("club_idx", club_idx);
		List<CC_NoticeDTO> list=sqlMap.selectList("cc_gotoNoticeList",map);
		return list;
	}
	public CC_NoticeDTO cc_gotoNoticeContent(int c_n_idx) {
		CC_NoticeDTO dto=sqlMap.selectOne("cc_gotoNoticeContent", c_n_idx); 
		return dto;
	}
	public int cc_submitNoticeUpdate(CC_NoticeDTO dto) {
		int count=sqlMap.update("cc_submitNoticeUpdate",dto);
		return count;
	}
	public int cc_submitNoticeDelete(int c_n_idx) {
		int count=sqlMap.delete("cc_submitNoticeDelete",c_n_idx);
		return count;
	}
	public int cc_totalCntNoticeList(int class_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntNoticeList", class_idx);
		return totalCnt;
	}
	public int cc_totalSearchNoticeForThisUser(Map<String, Object> searchMap) {
		int totalCnt=sqlMap.selectOne("cc_totalSearchNoticeForThisUser", searchMap);
		return totalCnt;
	}
	public List<CC_NoticeDTO> cc_searchNoticeForThisUser(Map<String, Object> searchMap) {
		List<CC_NoticeDTO> list=sqlMap.selectList("cc_searchNoticeForThisUser",searchMap);
		return list;
	}
}
