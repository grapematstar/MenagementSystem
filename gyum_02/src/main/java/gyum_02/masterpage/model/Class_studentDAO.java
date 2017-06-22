package gyum_02.masterpage.model;

import java.util.List;

public interface Class_studentDAO {
	public List<Class_studentDTO> mp_cs_select(int idx);
	public int mp_cs_insert(Class_studentDTO dto);
	public int mp_cs_delete(Class_studentDTO dto);
	public List<Class_studentDTO> mp_cs_stu_idx_paging(int class_idx,int cp, int listSize);
	public List<Class_studentDTO> mp_cs_stu_idx(int idx);
	public int mp_cs_delete_student(int idx);
	public int mp_cs_totalCnt(int class_idx);
}
