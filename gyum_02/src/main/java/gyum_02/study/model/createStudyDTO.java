package gyum_02.study.model;

import java.sql.Date;

public class createStudyDTO {
	private int study_idx;
	private String study_subject;
	private String study_content;
	private String study_id;
	private String study_directory;
	private String study_members;
	private int study_maxnum;
	private String study_lastday;
	private int study_public;	
	private int study_situ; 
	private Date study_createdate;
	
	public createStudyDTO() {
		super();
	}
	public createStudyDTO(int study_idx, String study_subject, String study_content, String study_id,
			String study_directory, String study_members, int study_maxnum, String study_lastday, int study_public,
			int study_situ, Date study_createdate) {
		super();
		this.study_idx = study_idx;
		this.study_subject = study_subject;
		this.study_content = study_content;
		this.study_id = study_id;
		this.study_directory = study_directory;
		this.study_members = study_members;
		this.study_maxnum = study_maxnum;
		this.study_lastday = study_lastday;
		this.study_public = study_public;
		this.study_situ = study_situ;
		this.study_createdate = study_createdate;
	}
	public int getStudy_idx() {
		return study_idx;
	}
	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}
	public String getStudy_subject() {
		return study_subject;
	}
	public void setStudy_subject(String study_subject) {
		this.study_subject = study_subject;
	}
	public String getStudy_content() {
		return study_content;
	}
	public void setStudy_content(String study_content) {
		this.study_content = study_content;
	}
	public String getStudy_id() {
		return study_id;
	}
	public void setStudy_id(String study_id) {
		this.study_id = study_id;
	}
	public String getStudy_directory() {
		return study_directory;
	}
	public void setStudy_directory(String study_directory) {
		this.study_directory = study_directory;
	}
	public String getStudy_members() {
		return study_members;
	}
	public void setStudy_members(String study_members) {
		this.study_members = study_members;
	}
	public int getStudy_maxnum() {
		return study_maxnum;
	}
	public void setStudy_maxnum(int study_maxnum) {
		this.study_maxnum = study_maxnum;
	}
	public String getStudy_lastday() {
		return study_lastday;
	}
	public void setStudy_lastday(String study_lastday) {
		this.study_lastday = study_lastday;
	}
	public int getStudy_public() {
		return study_public;
	}
	public void setStudy_public(int study_public) {
		this.study_public = study_public;
	}
	public int getStudy_situ() {
		return study_situ;
	}
	public void setStudy_situ(int study_situ) {
		this.study_situ = study_situ;
	}
	public Date getStudy_createdate() {
		return study_createdate;
	}
	public void setStudy_createdate(Date study_createdate) {
		this.study_createdate = study_createdate;
	}
	
	
	
	
	
	

}
