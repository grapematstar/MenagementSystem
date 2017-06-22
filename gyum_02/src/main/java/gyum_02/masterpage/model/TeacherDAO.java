package gyum_02.masterpage.model;

import java.util.List;

public interface TeacherDAO {
	
	public int mp_teacher_add(TeacherDTO dto);
	public int mp_teacher_update(TeacherDTO dto);
	public int mp_teacher_delete(int idx);
	public List<TeacherDTO> mp_teacher_allList();
	public List<TeacherDTO> mp_teacher_select(String key);
	public List<TeacherDTO> mp_teacher_info(int idx);
	public List<TeacherDTO> mp_teacher_subject(int idx);
	public List<TeacherDTO> mp_teacher_name(String name);
	public List<TeacherDTO> mp_teacher_paging(int cp, int listSize);
	public int mp_teacher_totalCnt();
}
