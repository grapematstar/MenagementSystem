package gyum_02.cybercampus.Model;

import java.util.List;

public interface CC_EpilogueDAO {
	public List<CC_EpilogueDTO> cc_gotoEpilogueList(int cp, int ls, int class_idx);
	public void cc_submitEpilogueWrite(CC_EpilogueDTO dto);
	public void cc_submitEpilogueUpdate(CC_EpilogueDTO dto);
	public void cc_submitEpilogueDelete(int c_r_idx);
	
}
