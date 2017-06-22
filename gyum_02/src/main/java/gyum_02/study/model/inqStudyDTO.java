package gyum_02.study.model;

import java.sql.Date;

public class inqStudyDTO {
	private int study_inqidx;
	private int study_recruitidx ;
	private int study_idx;	
	private String 	study_inq_reciver;
	private String study_inq_sender ;
	private String study_inq_content;
	private String stu_id;
	private int study_inq_readcheck;
	private Date study_inq_wirtedate;
	
	public inqStudyDTO() {
		super();
	}

	public int getStudy_inqidx() {
		return study_inqidx;
	}

	public void setStudy_inqidx(int study_inqidx) {
		this.study_inqidx = study_inqidx;
	}

	public int getStudy_recruitidx() {
		return study_recruitidx;
	}

	public void setStudy_recruitidx(int study_recruitidx) {
		this.study_recruitidx = study_recruitidx;
	}

	public int getStudy_idx() {
		return study_idx;
	}

	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}

	public String getStudy_inq_reciver() {
		return study_inq_reciver;
	}

	public void setStudy_inq_reciver(String study_inq_reciver) {
		this.study_inq_reciver = study_inq_reciver;
	}

	public String getStudy_inq_sender() {
		return study_inq_sender;
	}

	public void setStudy_inq_sender(String study_inq_sender) {
		this.study_inq_sender = study_inq_sender;
	}

	public String getStudy_inq_content() {
		return study_inq_content;
	}

	public void setStudy_inq_content(String study_inq_content) {
		this.study_inq_content = study_inq_content;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public int getStudy_inq_readcheck() {
		return study_inq_readcheck;
	}

	public void setStudy_inq_readcheck(int study_inq_readcheck) {
		this.study_inq_readcheck = study_inq_readcheck;
	}

	public Date getStudy_inq_wirtedate() {
		return study_inq_wirtedate;
	}

	public void setStudy_inq_wirtedate(Date study_inq_wirtedate) {
		this.study_inq_wirtedate = study_inq_wirtedate;
	}

	public inqStudyDTO(int study_inqidx, int study_recruitidx, int study_idx, String study_inq_reciver,
			String study_inq_sender, String study_inq_content, String stu_id, int study_inq_readcheck,
			Date study_inq_wirtedate) {
		super();
		this.study_inqidx = study_inqidx;
		this.study_recruitidx = study_recruitidx;
		this.study_idx = study_idx;
		this.study_inq_reciver = study_inq_reciver;
		this.study_inq_sender = study_inq_sender;
		this.study_inq_content = study_inq_content;
		this.stu_id = stu_id;
		this.study_inq_readcheck = study_inq_readcheck;
		this.study_inq_wirtedate = study_inq_wirtedate;
	}	
}
