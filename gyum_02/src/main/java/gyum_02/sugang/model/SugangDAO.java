package gyum_02.sugang.model;

import java.util.List;
import java.util.Map;

public interface SugangDAO {

	public List<SugangDTO> sugangList();
	public List<SugangDTO> sugangList(int cp,int listSize);
	public int userIdxSearch(String id);
	public List<StudentInfoDTO> stuList(String id);
	public int classTotalCnt();
	public List<SugangDTO> searchKeyword(Map<String, Object> searchmap);
	public int searchTotalCnt(Map<String, Object> searchmap);
}
