package gyum_02.study.model;

public class leaderStudyDTO {
	private int study_idx;
	private String study_leader;
	private String study_seconleader;
	
	
	
	
	public leaderStudyDTO() {
		super();
	}




	public leaderStudyDTO(int study_idx, String study_leader, String study_seconleader) {
		super();
		this.study_idx = study_idx;
		this.study_leader = study_leader;
		this.study_seconleader = study_seconleader;
	}




	public int getStudy_idx() {
		return study_idx;
	}




	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}




	public String getStudy_leader() {
		return study_leader;
	}




	public void setStudy_leader(String study_leader) {
		this.study_leader = study_leader;
	}




	public String getStudy_seconleader() {
		return study_seconleader;
	}




	public void setStudy_seconleader(String study_seconleader) {
		this.study_seconleader = study_seconleader;
	}
	
	
}
