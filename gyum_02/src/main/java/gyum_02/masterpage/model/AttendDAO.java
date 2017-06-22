package gyum_02.masterpage.model;

import java.util.List;

public interface AttendDAO {
	public List<AttendDTO> mp_attend_someone(int idx);
	public List<AttendDTO> mp_attend_getinfo(AttendDTO dto);
	public int mp_attend_delete(int stu_idx);
}
