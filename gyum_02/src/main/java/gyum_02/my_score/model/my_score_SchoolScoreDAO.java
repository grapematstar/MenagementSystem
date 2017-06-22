package gyum_02.my_score.model;

import java.util.*;

public interface my_score_SchoolScoreDAO {
	
	public List<my_score_SchoolScoreDTO> getSchoolScore(int stu_idx, int year);
	
	public List<my_score_SchoolScoreDTO> getSchoolScoreOneTerm(int stu_idx, int year, int term);
	
	public List<my_score_SchoolScoreDTO> getSchoolSubjectScore(int stu_idx, int year, int subject_num);
	
	public void setSchoolScore(my_score_SchoolScoreDTO msssdto);
	
	public int checkSchoolScoreDB(my_score_SchoolScoreDTO msssdto);
	
	public void modiSchoolScore(my_score_SchoolScoreDTO msssdto);
}
