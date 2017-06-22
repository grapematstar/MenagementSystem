package gyum_02.study.model;

import java.util.Date;

public class bbsStudyDTO {
	private int studybbs_idx;
	private int studybbs_ref;
	private String studybbs_subject;
	private String studybbs_content;
	private String stu_id;
	private String stu_name;
	private int studybbs_lev;
	private int studybbs_sunbun;
	private Date studybbs_writedate;
	
	public bbsStudyDTO() {
		super();
	}

	public bbsStudyDTO(int studybbs_idx, int studybbs_ref, String studybbs_subject, String studybbs_content,
			String stu_id, String stu_name, int studybbs_lev, int studybbs_sunbun, Date studybbs_writedate) {
		super();
		this.studybbs_idx = studybbs_idx;
		this.studybbs_ref = studybbs_ref;
		this.studybbs_subject = studybbs_subject;
		this.studybbs_content = studybbs_content;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.studybbs_lev = studybbs_lev;
		this.studybbs_sunbun = studybbs_sunbun;
		this.studybbs_writedate = studybbs_writedate;
	}

	public int getStudybbs_idx() {
		return studybbs_idx;
	}

	public void setStudybbs_idx(int studybbs_idx) {
		this.studybbs_idx = studybbs_idx;
	}

	public int getStudybbs_ref() {
		return studybbs_ref;
	}

	public void setStudybbs_ref(int studybbs_ref) {
		this.studybbs_ref = studybbs_ref;
	}

	public String getStudybbs_subject() {
		return studybbs_subject;
	}

	public void setStudybbs_subject(String studybbs_subject) {
		this.studybbs_subject = studybbs_subject;
	}

	public String getStudybbs_content() {
		return studybbs_content;
	}

	public void setStudybbs_content(String studybbs_content) {
		this.studybbs_content = studybbs_content;
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

	public int getStudybbs_lev() {
		return studybbs_lev;
	}

	public void setStudybbs_lev(int studybbs_lev) {
		this.studybbs_lev = studybbs_lev;
	}

	public int getStudybbs_sunbun() {
		return studybbs_sunbun;
	}

	public void setStudybbs_sunbun(int studybbs_sunbun) {
		this.studybbs_sunbun = studybbs_sunbun;
	}

	public Date getStudybbs_writedate() {
		return studybbs_writedate;
	}

	public void setStudybbs_writedate(Date studybbs_writedate) {
		this.studybbs_writedate = studybbs_writedate;
	}
	
	
	
	
}
