package gyum_02.cybercampus.Model;

import java.util.List;

public interface CC_QnADAO {
	//QnA
	public int cc_totalCntQnAList(int club_idx);
	public List<CC_QnADTO> cc_gotoQnAList(int cp,int listSize,int club_idx);
	public int cc_submitQnAWrite(CC_QnADTO dto);
	public int cc_submitQnAUpdate(CC_QnADTO dto);
	public int cc_submitQnADelete(int c_q_q_idx);
	public CC_QnADTO cc_gotoQnAContent(int c_q_q_idx);
	//QnAReply
	public int cc_totalCntQnAReplyList(int c_q_q_idx);
	public List<CC_QnADTO> cc_gotoQnAReplyContentList(int cp,int listSize,int c_q_q_idx);
	public int cc_submitQnAReplyWrite(CC_QnADTO dto);
	public int cc_submitQnAReplyUpdate(CC_QnADTO dto);
	public int cc_submitQnAReplyDelete(int c_q_a_idx);	
}
