package gyum_02.study.model;

import java.sql.Date;

public class votebbsDTO {
	private int study_votebbsidx;
	private int study_idx;
	private int study_votebbsref;
	private String stu_id;
	private String stu_name;
	private String study_votebbssubject;
	private String study_votebbscontent;	
	private int study_votebbslev;
	private int study_votebbssunbun;
	private int study_votebbsreply_sunbun;
	private int study_votesitu;
	private Date study_votebbswritedate;
	public votebbsDTO() {
		super();
	}
	public votebbsDTO(int study_votebbsidx, int study_idx, int study_votebbsref, String stu_id, String stu_name,
			String study_votebbssubject, String study_votebbscontent, int study_votebbslev, int study_votebbssunbun,
			int study_votebbsreply_sunbun, int study_votesitu, Date study_votebbswritedate) {
		super();
		this.study_votebbsidx = study_votebbsidx;
		this.study_idx = study_idx;
		this.study_votebbsref = study_votebbsref;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.study_votebbssubject = study_votebbssubject;
		this.study_votebbscontent = study_votebbscontent;
		this.study_votebbslev = study_votebbslev;
		this.study_votebbssunbun = study_votebbssunbun;
		this.study_votebbsreply_sunbun = study_votebbsreply_sunbun;
		this.study_votesitu = study_votesitu;
		this.study_votebbswritedate = study_votebbswritedate;
	}
	public int getStudy_votebbsidx() {
		return study_votebbsidx;
	}
	public void setStudy_votebbsidx(int study_votebbsidx) {
		this.study_votebbsidx = study_votebbsidx;
	}
	public int getStudy_idx() {
		return study_idx;
	}
	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}
	public int getStudy_votebbsref() {
		return study_votebbsref;
	}
	public void setStudy_votebbsref(int study_votebbsref) {
		this.study_votebbsref = study_votebbsref;
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
	public String getStudy_votebbssubject() {
		return study_votebbssubject;
	}
	public void setStudy_votebbssubject(String study_votebbssubject) {
		this.study_votebbssubject = study_votebbssubject;
	}
	public String getStudy_votebbscontent() {
		return study_votebbscontent;
	}
	public void setStudy_votebbscontent(String study_votebbscontent) {
		this.study_votebbscontent = study_votebbscontent;
	}
	public int getStudy_votebbslev() {
		return study_votebbslev;
	}
	public void setStudy_votebbslev(int study_votebbslev) {
		this.study_votebbslev = study_votebbslev;
	}
	public int getStudy_votebbssunbun() {
		return study_votebbssunbun;
	}
	public void setStudy_votebbssunbun(int study_votebbssunbun) {
		this.study_votebbssunbun = study_votebbssunbun;
	}
	public int getStudy_votebbsreply_sunbun() {
		return study_votebbsreply_sunbun;
	}
	public void setStudy_votebbsreply_sunbun(int study_votebbsreply_sunbun) {
		this.study_votebbsreply_sunbun = study_votebbsreply_sunbun;
	}
	public int getStudy_votesitu() {
		return study_votesitu;
	}
	public void setStudy_votesitu(int study_votesitu) {
		this.study_votesitu = study_votesitu;
	}
	public Date getStudy_votebbswritedate() {
		return study_votebbswritedate;
	}
	public void setStudy_votebbswritedate(Date study_votebbswritedate) {
		this.study_votebbswritedate = study_votebbswritedate;
	}
	
	
}
