package gyum_02.study.model;

public class memberStudyDTO {
	private int study_idx;
	private int stu_idx;
	private String stu_id;
	private String stu_name;
	public memberStudyDTO() {
		super();
	}
	public memberStudyDTO(int study_idx, int stu_idx, String stu_id, String stu_name) {
		super();
		this.study_idx = study_idx;
		this.stu_idx = stu_idx;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
	}
	public int getStudy_idx() {
		return study_idx;
	}
	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}
	public int getStu_idx() {
		return stu_idx;
	}
	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	
	
}
