package gyum_02.my_score.model;

import java.util.List;

public interface my_score_StudentScoreDAO {
	
	public List<my_score_StudentScoreDTO> getStudentScore(int stu_idx, int class_idx);
	
	public List<Integer> getStudentScoreDate(int class_idx);
	
	public List<my_score_StudentScoreDTO> getStudentScoreList(int class_idx);
}
