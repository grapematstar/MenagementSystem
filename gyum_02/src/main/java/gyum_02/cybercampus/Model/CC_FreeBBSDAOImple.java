package gyum_02.cybercampus.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CC_FreeBBSDAOImple implements CC_FreeBBSDAO {
	private SqlSessionTemplate sqlMap;
	public CC_FreeBBSDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public List<CC_FreeBBSDTO> cc_gotoFreeBBSList(int class_idx,int cp,int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("club_idx", class_idx);
		List<CC_FreeBBSDTO> list=sqlMap.selectList("cc_gotoFreeBBSList",map);
		return list;
	}
	public int cc_submitFreeBBSWrite(CC_FreeBBSDTO dto) {
		int count=sqlMap.insert("cc_submitFreeBBSWrite", dto);
		return count;
	}
	public int cc_submitFrreBBSUpdate(CC_FreeBBSDTO dto) {
		int count=sqlMap.update("cc_submitFreeBBSUpdate", dto);
		return count;
	}
	public int cc_submitFreeBBSDelete(int c_f_b_idx) {
		int count=sqlMap.delete("cc_submitFreeBBSDelete", c_f_b_idx);
		return count;
	}
	public CC_FreeBBSDTO cc_gotoFreeBBSContent(int c_f_b_idx) {
		CC_FreeBBSDTO dto=sqlMap.selectOne("cc_gotoFreeBBSContent", c_f_b_idx);
		return dto;
	}
	public int cc_totalCntFreeBBSList(int class_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntFreeBBSList", class_idx);
		return totalCnt;
	}
	public int cc_totalCntSearchFreeBBSForThisUser(Map<String, Object> searchMap) {
		int totalCnt=sqlMap.selectOne("cc_totalCntSearchFreeBBSForThisUser", searchMap);
		return totalCnt;
	}
	public List<CC_FreeBBSDTO> cc_searchFreeBBSForThisUser(Map<String, Object> searchMap) {
		List<CC_FreeBBSDTO> list=sqlMap.selectList("cc_searchFreeBBSForThisUser", searchMap);
		return list;
	}
	public int cc_submitFreeBBSReply(Map<String, Object> searchMap) {
		int count=sqlMap.insert("cc_submitFreeBBSReply", searchMap);
		return count;
	}
	public List<CC_FreeBBSDTO> cc_getFreeBBSReplyList(Map<String,Object> searchMap){
		List<CC_FreeBBSDTO> list=sqlMap.selectList("cc_getFreeBBSReplyList", searchMap);
		return list;
	}
}
