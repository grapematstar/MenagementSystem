package gyum_02.masterpage.model;

import java.util.List;

public interface StudentDAO {
	
	public int mp_student_add(StudentDTO dto);
	public int mp_student_update(StudentDTO dto);
	public int mp_student_delete(int idx);
	public List<StudentDTO> mp_student_allList();
	public List<StudentDTO> mp_student_select(String key);
	public List<StudentDTO> mp_student_info(int idx);
	public List<StudentDTO> mp_student_info2(String name);
	public List<StudentDTO> mp_student_par(String key);
	public int mp_student_getTotalCnt();
	public List<StudentDTO> mp_student_paging(int cp,int listSize);
	public List<StudentDTO> mp_student_paging_stu_idx(int stu_idx,int cp, int ls);
	public int mp_student_get_idx(String stu_id);
}

