package gyum_02.cybercampus.Model;

import java.util.List;
import java.util.Map;

public interface CC_NoticeDAO {
	public int cc_submitNoticeWrite(CC_NoticeDTO dto);
	public List<CC_NoticeDTO> cc_gotoNoticeList(int club_idx,int cp,int listSize);
	public CC_NoticeDTO cc_gotoNoticeContent(int c_n_idx);
	public int cc_submitNoticeUpdate(CC_NoticeDTO dto);
	public int cc_submitNoticeDelete(int c_n_idx);
	public int cc_totalCntNoticeList(int class_idx);
	public int cc_totalSearchNoticeForThisUser(Map<String,Object> searchMap);
	public List<CC_NoticeDTO> cc_searchNoticeForThisUser(Map<String,Object> searchMap);
}
