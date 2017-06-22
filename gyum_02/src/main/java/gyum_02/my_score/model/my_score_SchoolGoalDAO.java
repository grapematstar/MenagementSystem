package gyum_02.my_score.model;

import java.util.*;

public interface my_score_SchoolGoalDAO {
	
	public List<my_score_SchoolGoalDTO> getSchoolGoal(int stu_idx, int year, int term);
	
	public List<my_score_SchoolGoalDTO> getSchoolGoalAll(int stu_idx, int year, int subject_num);
	
	public int checkSchoolGoal(my_score_SchoolGoalDTO mssgdto);
	
	public void setSchoolGoal(my_score_SchoolGoalDTO mssgdto);
	
	public void modiSchoolGoal(my_score_SchoolGoalDTO mssgdto);
}
