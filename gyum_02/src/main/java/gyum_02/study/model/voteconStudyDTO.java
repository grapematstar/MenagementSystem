package gyum_02.study.model;

public class voteconStudyDTO {
	private int study_voteidx;
	private int study_idx;
	private int study_votebbsidx;
	private String study_votecontent;
	private int study_votenum;
	public voteconStudyDTO() {
		super();
	}
	public voteconStudyDTO(int study_voteidx, int study_idx, int study_votebbsidx, String study_votecontent,
			int study_votenum) {
		super();
		this.study_voteidx = study_voteidx;
		this.study_idx = study_idx;
		this.study_votebbsidx = study_votebbsidx;
		this.study_votecontent = study_votecontent;
		this.study_votenum = study_votenum;
	}
	public int getStudy_voteidx() {
		return study_voteidx;
	}
	public void setStudy_voteidx(int study_voteidx) {
		this.study_voteidx = study_voteidx;
	}
	public int getStudy_idx() {
		return study_idx;
	}
	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}
	public int getStudy_votebbsidx() {
		return study_votebbsidx;
	}
	public void setStudy_votebbsidx(int study_votebbsidx) {
		this.study_votebbsidx = study_votebbsidx;
	}
	public String getStudy_votecontent() {
		return study_votecontent;
	}
	public void setStudy_votecontent(String study_votecontent) {
		this.study_votecontent = study_votecontent;
	}
	public int getStudy_votenum() {
		return study_votenum;
	}
	public void setStudy_votenum(int study_votenum) {
		this.study_votenum = study_votenum;
	}
	
}
