package gyum_02.masterpage.model._____;

import java.util.HashMap;
import java.util.List;

public interface mp_ClassManagementDAO {

	public List mpClassSearchList(mp_ClassManagementDTO dto);
	public int mpClassCheckUpdate(HashMap map);
	public int mpClassUpdate(mp_ClassManagementDTO dto);
}
