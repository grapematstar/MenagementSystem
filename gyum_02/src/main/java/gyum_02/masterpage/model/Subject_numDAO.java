package gyum_02.masterpage.model;

import java.util.List;

public interface Subject_numDAO {
	public List<Subject_numDTO> mp_sn_select();
	public List<Subject_numDTO> mp_sn_select_name(int num);
}
