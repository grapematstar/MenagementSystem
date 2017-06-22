package gyum_02.notice.model;

import java.util.List;

public interface NoticeDAO {
	public List<NoticeDTO> notice_List(int cp, int ls);
	public List<Teacher_NoticeDTO> t_n_List(int cp, int ls);
	public int getTotal(String sel);
	public int notice_Write(NoticeDTO dto);
	public int t_n_Write(Teacher_NoticeDTO tdto);
	public NoticeDTO notice_Content(int idx);
	public Teacher_NoticeDTO t_n_Content(int idx);
	public int notice_Update(NoticeDTO dto);
	public int t_n_Update(Teacher_NoticeDTO dto);
	public int noticeDel(int idx, String sel);
}
