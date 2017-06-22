package gyum_02.my_score.model;

public class my_score_StudentScoreDTO {
	
	private int stu_idx;
	private int subject_num;
	private int class_idx;
	private int s_s_result;
	private int s_s_date;
	private int club_idx;
	
	public my_score_StudentScoreDTO() {
		// TODO Auto-generated constructor stub
	}

	public my_score_StudentScoreDTO(int stu_idx, int subject_num, int class_idx, int s_s_result, int s_s_date,
			int club_idx) {
		super();
		this.stu_idx = stu_idx;
		this.subject_num = subject_num;
		this.class_idx = class_idx;
		this.s_s_result = s_s_result;
		this.s_s_date = s_s_date;
		this.club_idx = club_idx;
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

	public int getClass_idx() {
		return class_idx;
	}

	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}

	public int getS_s_result() {
		return s_s_result;
	}

	public void setS_s_result(int s_s_result) {
		this.s_s_result = s_s_result;
	}

	public int getS_s_date() {
		return s_s_date;
	}

	public void setS_s_date(int s_s_date) {
		this.s_s_date = s_s_date;
	}

	public int getClub_idx() {
		return club_idx;
	}

	public void setClub_idx(int club_idx) {
		this.club_idx = club_idx;
	}
	
	
}
