package gyum_02.study.model;

import java.sql.Date;

public class reqStudyDTO {
	private int study_recruitidx;
	private int stu_idx;
	private int study_req_accept;
	private Date study_req_date;
	public reqStudyDTO() {
		super();
	}
	public reqStudyDTO(int study_recruitidx, int stu_idx, int study_req_accept, Date study_req_date) {
		super();
		this.study_recruitidx = study_recruitidx;
		this.stu_idx = stu_idx;
		this.study_req_accept = study_req_accept;
		this.study_req_date = study_req_date;
	}
	public int getStudy_recruitidx() {
		return study_recruitidx;
	}
	public void setStudy_recruitidx(int study_recruitidx) {
		this.study_recruitidx = study_recruitidx;
	}
	public int getStu_idx() {
		return stu_idx;
	}
	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}
	public int getStudy_req_accept() {
		return study_req_accept;
	}
	public void setStudy_req_accept(int study_req_accept) {
		this.study_req_accept = study_req_accept;
	}
	public Date getStudy_req_date() {
		return study_req_date;
	}
	public void setStudy_req_date(Date study_req_date) {
		this.study_req_date = study_req_date;
	}


	
	
}
