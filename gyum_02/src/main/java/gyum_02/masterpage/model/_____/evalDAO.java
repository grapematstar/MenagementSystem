package gyum_02.masterpage.model._____;

import java.util.*;

public interface evalDAO {
	public List mpStudentEvalInfo(int class_idx, String stu_name);
	public List mpQuestionList();
	public mp_EvalDTO mpEvalInfo(int stu_idx, int class_idx);
	public mp_EvalDTO mpEvalAvgInfo(int class_idx);
	public List mpTeacherEvalList(String searchText);
}
