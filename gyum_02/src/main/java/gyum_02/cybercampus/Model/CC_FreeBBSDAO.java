package gyum_02.cybercampus.Model;

import java.util.List;
import java.util.Map;

public interface CC_FreeBBSDAO {
	public List<CC_FreeBBSDTO> cc_gotoFreeBBSList(int class_idx,int cp,int listSize);
	public int cc_submitFreeBBSWrite(CC_FreeBBSDTO dto);
	public int cc_submitFrreBBSUpdate(CC_FreeBBSDTO dto);
	public int cc_submitFreeBBSDelete(int c_f_b_idx);
	public CC_FreeBBSDTO cc_gotoFreeBBSContent(int c_f_b_idx);
	public int cc_totalCntFreeBBSList(int class_idx);
	public int cc_totalCntSearchFreeBBSForThisUser(Map<String,Object> searchMap);
	public List<CC_FreeBBSDTO> cc_searchFreeBBSForThisUser(Map<String,Object> searchMap);;
	public int cc_submitFreeBBSReply(Map<String,Object> searchMap);
	public List<CC_FreeBBSDTO> cc_getFreeBBSReplyList(Map<String,Object> searchMap);
}