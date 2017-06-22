package gyum_02.study.model;

public class bbsnameStudyDTO {
	private int study_idx;
	private String study_bbsname;
	private int study_bbsref;
	public bbsnameStudyDTO() {
		super();
	}
	public bbsnameStudyDTO(int study_idx, String study_bbsname, int study_bbsref) {
		super();
		this.study_idx = study_idx;
		this.study_bbsname = study_bbsname;
		this.study_bbsref = study_bbsref;
	}
	public int getStudy_idx() {
		return study_idx;
	}
	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}
	public String getStudy_bbsname() {
		return study_bbsname;
	}
	public void setStudy_bbsname(String study_bbsname) {
		this.study_bbsname = study_bbsname;
	}
	public int getStudy_bbsref() {
		return study_bbsref;
	}
	public void setStudy_bbsref(int study_bbsref) {
		this.study_bbsref = study_bbsref;
	}
	
	
	
}
