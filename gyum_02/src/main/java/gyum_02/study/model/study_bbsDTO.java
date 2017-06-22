package gyum_02.study.model;

import java.sql.Date;

public class study_bbsDTO {
	private int study_bbsidx;
	private int study_idx;
	private int study_bbsref;
	private String stu_id;
	private String stu_name;
	private String study_bbssubject;
	private String study_bbscontent;	
	private int study_bbslev;
	private int study_bbssunbun;
	private int study_bbsreply_sunbun;
	private Date study_bbswritedate;
	public study_bbsDTO() {
		super();
	}
	public study_bbsDTO(int study_bbsidx, int study_idx, int study_bbsref, String stu_id, String stu_name,
			String study_bbssubject, String study_bbscontent, int study_bbslev, int study_bbssunbun,
			int study_bbsreply_sunbun, Date study_bbswritedate) {
		super();
		this.study_bbsidx = study_bbsidx;
		this.study_idx = study_idx;
		this.study_bbsref = study_bbsref;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.study_bbssubject = study_bbssubject;
		this.study_bbscontent = study_bbscontent;
		this.study_bbslev = study_bbslev;
		this.study_bbssunbun = study_bbssunbun;
		this.study_bbsreply_sunbun = study_bbsreply_sunbun;
		this.study_bbswritedate = study_bbswritedate;
	}
	public int getStudy_bbsidx() {
		return study_bbsidx;
	}
	public void setStudy_bbsidx(int study_bbsidx) {
		this.study_bbsidx = study_bbsidx;
	}
	public int getStudy_idx() {
		return study_idx;
	}
	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}
	public int getStudy_bbsref() {
		return study_bbsref;
	}
	public void setStudy_bbsref(int study_bbsref) {
		this.study_bbsref = study_bbsref;
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
	public String getStudy_bbssubject() {
		return study_bbssubject;
	}
	public void setStudy_bbssubject(String study_bbssubject) {
		this.study_bbssubject = study_bbssubject;
	}
	public String getStudy_bbscontent() {
		return study_bbscontent;
	}
	public void setStudy_bbscontent(String study_bbscontent) {
		this.study_bbscontent = study_bbscontent;
	}
	public int getStudy_bbslev() {
		return study_bbslev;
	}
	public void setStudy_bbslev(int study_bbslev) {
		this.study_bbslev = study_bbslev;
	}
	public int getStudy_bbssunbun() {
		return study_bbssunbun;
	}
	public void setStudy_bbssunbun(int study_bbssunbun) {
		this.study_bbssunbun = study_bbssunbun;
	}
	public int getStudy_bbsreply_sunbun() {
		return study_bbsreply_sunbun;
	}
	public void setStudy_bbsreply_sunbun(int study_bbsreply_sunbun) {
		this.study_bbsreply_sunbun = study_bbsreply_sunbun;
	}
	public Date getStudy_bbswritedate() {
		return study_bbswritedate;
	}
	public void setStudy_bbswritedate(Date study_bbswritedate) {
		this.study_bbswritedate = study_bbswritedate;
	}
	
	
	
}
