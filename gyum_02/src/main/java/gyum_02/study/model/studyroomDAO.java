package gyum_02.study.model;

import java.util.List;

public interface studyroomDAO {
	public List<studyroomDTO> studyroom_list(int date);
	public int studyroom_reserv(studyroomDTO dto);
	public List<studyroomDTO> get_studyroom_reserv(studyroomDTO dto);
	public int studyroom_reserv_cencel(studyroomDTO dto);
	public List<studyroomDTO> getstudyroom_list(String id);
	public int studyroom_reserv_cencel2(int studyroom_idx);
	public int studyroom_totalCnt();
	public List<studyroomDTO> studyroom_paging_all(int cp, int ls);
	public int studyroom_garbage(int studyroom_idx);
	public int studyroom_totalCnt_withId(String studyroom_id);
	public List<studyroomDTO> studyroom_paging_search(int cp,int ls,String studyroom_id);
}
