package gyum_02.notice.model;

import java.sql.Date;

public class Teacher_NoticeDTO {

	private int t_n_idx;
	private String t_n_subject;
	private String t_n_content;
	private Date t_n_writedate;
	
	public Teacher_NoticeDTO() {
		super();
	}

	public Teacher_NoticeDTO(int t_n_idx, String t_n_subject, String t_n_content, Date t_n_writedate) {
		super();
		this.t_n_idx = t_n_idx;
		this.t_n_subject = t_n_subject;
		this.t_n_content = t_n_content;
		this.t_n_writedate = t_n_writedate;
	}

	public int getT_n_idx() {
		return t_n_idx;
	}

	public void setT_n_idx(int t_n_idx) {
		this.t_n_idx = t_n_idx;
	}

	public String getT_n_subject() {
		return t_n_subject;
	}

	public void setT_n_subject(String t_n_subject) {
		this.t_n_subject = t_n_subject;
	}

	public String getT_n_content() {
		return t_n_content;
	}

	public void setT_n_content(String t_n_content) {
		this.t_n_content = t_n_content;
	}

	public Date getT_n_writedate() {
		return t_n_writedate;
	}

	public void setT_n_writedate(Date t_n_writedate) {
		this.t_n_writedate = t_n_writedate;
	}

}
