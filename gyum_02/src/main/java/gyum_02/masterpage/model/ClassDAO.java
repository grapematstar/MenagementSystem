package gyum_02.masterpage.model;

import java.util.List;

public interface ClassDAO {
	public List<ClassDTO> mp_c_select(int idx);
	public List<ClassDTO> mp_c_select_tea_idx(int class_idx);
	public List<ClassDTO> mp_c_allList();
	public List<ClassDTO> mp_c_tea_idx(int idx);
	public List<ClassDTO> mp_c_select_with_sn(int subject_num);
	public int mp_c_delete(int tea_idx);
	public List<ClassDTO> mp_c_select_tea_idx_paging(int class_idx,int cp, int ls);
	public int mp_c_totalCnt(int class_idx);
	public List<ClassDTO> mp_c_allList_where_tea_idx(int tea_idx);
}
