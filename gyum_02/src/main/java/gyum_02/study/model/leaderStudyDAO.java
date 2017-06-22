package gyum_02.study.model;

import java.util.List;

public interface leaderStudyDAO {
	public List<leaderStudyDTO> getstudyleaderinfo(int study_idx);
	public int study_leaderchange(leaderStudyDTO lstdto);
	public int study_seconchange(leaderStudyDTO lstdto);
}
