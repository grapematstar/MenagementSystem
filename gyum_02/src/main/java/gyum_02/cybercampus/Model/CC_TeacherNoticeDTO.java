package gyum_02.cybercampus.Model;

import java.util.Date;

public class CC_TeacherNoticeDTO {
	private int t_n_idx;
	private String t_n_subject;
	private String t_n_content;
	private java.util.Date t_n_writedate;
	private String string_writedate;
	private String t_n_writer;
	public CC_TeacherNoticeDTO(int t_n_idx, String t_n_subject, String t_n_content, Date t_n_writedate,
			String string_writedate, String t_n_writer) {
		super();
		this.t_n_idx = t_n_idx;
		this.t_n_subject = t_n_subject;
		this.t_n_content = t_n_content;
		this.t_n_writedate = t_n_writedate;
		this.string_writedate = string_writedate;
		this.t_n_writer = t_n_writer;
	}
	public CC_TeacherNoticeDTO() {
		super();
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
	public java.util.Date getT_n_writedate() {
		return t_n_writedate;
	}
	public void setT_n_writedate(java.util.Date t_n_writedate) {
		this.t_n_writedate = t_n_writedate;
	}
	public String getString_writedate() {
		return string_writedate;
	}
	public void setString_writedate(String string_writedate) {
		this.string_writedate = string_writedate;
	}
	public String getT_n_writer() {
		return t_n_writer;
	}
	public void setT_n_writer(String t_n_writer) {
		this.t_n_writer = t_n_writer;
	}
	
}
