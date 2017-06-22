package gyum_02.my_score.model;

public class my_score_SchoolGoalDTO {

	private int stu_idx;
	private int subject_num;
	private int s_s_g_year;
	private int s_s_g_term;
	private int s_s_g_goal;
	
	public my_score_SchoolGoalDTO() {
		super();
	}

	public my_score_SchoolGoalDTO(int stu_idx, int subject_num, int s_s_g_year, int s_s_g_term, int s_s_g_goal) {
		super();
		this.stu_idx = stu_idx;
		this.subject_num = subject_num;
		this.s_s_g_year = s_s_g_year;
		this.s_s_g_term = s_s_g_term;
		this.s_s_g_goal = s_s_g_goal;
	}

	public int getStu_idx() {
		return stu_idx;
	}

	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}

	public int getSubject_num() {
		return subject_num;
	}

	public void setSubject_num(int subject_num) {
		this.subject_num = subject_num;
	}

	public int getS_s_g_year() {
		return s_s_g_year;
	}

	public void setS_s_g_year(int s_s_g_year) {
		this.s_s_g_year = s_s_g_year;
	}

	public int getS_s_g_term() {
		return s_s_g_term;
	}

	public void setS_s_g_term(int s_s_g_term) {
		this.s_s_g_term = s_s_g_term;
	}

	public int getS_s_g_goal() {
		return s_s_g_goal;
	}

	public void setS_s_g_goal(int s_s_g_goal) {
		this.s_s_g_goal = s_s_g_goal;
	}
	
}
