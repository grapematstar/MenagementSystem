package gyum_02.cybercampus.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CC_QnADAOImple implements CC_QnADAO {
	private SqlSessionTemplate sqlMap;

	public CC_QnADAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//QnA
	public int cc_totalCntQnAList(int club_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntQnAList", club_idx);
		return totalCnt;
	}
	public List<CC_QnADTO> cc_gotoQnAList(int cp, int listSize, int club_idx) {
		Map<String,Object> map=new HashMap<String,Object>();
		int startnum = (cp-1)*listSize+1;
		int endnum = cp*listSize;
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("club_idx", club_idx);
		List<CC_QnADTO> list=sqlMap.selectList("cc_gotoQnAList", map);
		return list;
	}
	
	public int cc_submitQnAWrite(CC_QnADTO dto) {
		int count=sqlMap.insert("cc_submitQnAWrite", dto);
		return count;
	}
	
	public int cc_submitQnAUpdate(CC_QnADTO dto) {
		int count=sqlMap.update("cc_submitQnAUpdate", dto);
		return count;
	}
	
	public int cc_submitQnADelete(int c_q_q_idx) {
		int count=sqlMap.delete("cc_submitQnADelete", c_q_q_idx);
		return count;
	}
	
	public CC_QnADTO cc_gotoQnAContent(int c_q_q_idx) {
		CC_QnADTO dto=sqlMap.selectOne("cc_gotoQnAContent", c_q_q_idx);
		return dto;
	}
	
	//QnA Reply
	public int cc_totalCntQnAReplyList(int c_q_q_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntQnAReplyList", c_q_q_idx);
		return totalCnt;
	}
	
	public List<CC_QnADTO> cc_gotoQnAReplyContentList(int cp, int listSize, int c_q_q_idx) {
		Map<String,Object> map=new HashMap<String,Object>();
		int startnum = (cp-1)*listSize+1;
		int endnum = cp*listSize;
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("c_q_q_idx", c_q_q_idx);
		List<CC_QnADTO> list=sqlMap.selectList("cc_gotoQnAReplyContentList", map);
		return list;
	}
	
	public int cc_submitQnAReplyWrite(CC_QnADTO dto) {
		int count=sqlMap.insert("cc_submitQnAReplyWrite", dto);
		return count;
	}
	
	public int cc_submitQnAReplyUpdate(CC_QnADTO dto) {
		int count=sqlMap.update("cc_submitQnAReplyUpdate", dto);
		return count;
	}
	
	public int cc_submitQnAReplyDelete(int c_q_a_idx) {
		int count=sqlMap.delete("cc_submitQnAReplyDelete", c_q_a_idx);
		return count;
	}
}
