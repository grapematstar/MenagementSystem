package gyum_02.masterpage.model;

import java.util.List;

public interface ParentDAO {
	public int mp_parent_add(ParentDTO dto);
	public int mp_parent_update(ParentDTO dto);
	public int mp_parent_delete(int idx);
	public List<ParentDTO> mp_parent_allList();
	public List<ParentDTO> mp_parent_select(String key);
	public List<ParentDTO> mp_parent_info(int idx);
	public List<ParentDTO> mp_parent_paging(int cp, int ls);
	public int mp_parent_totalCnt();
}
