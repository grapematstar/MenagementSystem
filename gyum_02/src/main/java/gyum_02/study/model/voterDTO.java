package gyum_02.study.model;

public class voterDTO {
	private int study_votebbsidx;
	private int study_voteidx;
	private int stu_idx;
	private String stu_id;
	public voterDTO() {
		super();
	}
	public voterDTO(int study_votebbsidx, int study_voteidx, int stu_idx, String stu_id) {
		super();
		this.study_votebbsidx = study_votebbsidx;
		this.study_voteidx = study_voteidx;
		this.stu_idx = stu_idx;
		this.stu_id = stu_id;
	}
	public int getStudy_votebbsidx() {
		return study_votebbsidx;
	}
	public void setStudy_votebbsidx(int study_votebbsidx) {
		this.study_votebbsidx = study_votebbsidx;
	}
	public int getStudy_voteidx() {
		return study_voteidx;
	}
	public void setStudy_voteidx(int study_voteidx) {
		this.study_voteidx = study_voteidx;
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

	
	
}
