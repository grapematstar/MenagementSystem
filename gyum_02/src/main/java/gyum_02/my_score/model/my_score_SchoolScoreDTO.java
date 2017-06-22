package gyum_02.my_score.model;

public class my_score_SchoolScoreDTO {

	private int stu_idx;
	private int subject_num;
	private int s_s_s_year;
	private int s_s_s_term;
	private int s_s_s_result;
	
	public my_score_SchoolScoreDTO() {
		super();
	}

	public my_score_SchoolScoreDTO(int stu_idx, int subject_num, int s_s_s_year, int s_s_s_term, int s_s_s_result) {
		super();
		this.stu_idx = stu_idx;
		this.subject_num = subject_num;
		this.s_s_s_year = s_s_s_year;
		this.s_s_s_term = s_s_s_term;
		this.s_s_s_result = s_s_s_result;
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

	public int getS_s_s_year() {
		return s_s_s_year;
	}

	public void setS_s_s_year(int s_s_s_year) {
		this.s_s_s_year = s_s_s_year;
	}

	public int getS_s_s_term() {
		return s_s_s_term;
	}

	public void setS_s_s_term(int s_s_s_term) {
		this.s_s_s_term = s_s_s_term;
	}

	public int getS_s_s_result() {
		return s_s_s_result;
	}

	public void setS_s_s_result(int s_s_s_result) {
		this.s_s_s_result = s_s_s_result;
	}
	
}
