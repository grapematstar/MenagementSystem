package gyum_02.notice.model;

import java.sql.Date;

public class NoticeDTO {
	private int notice_idx;
	private String notice_subject;
	private String notice_content;
	private Date notice_writedate;
	
	public NoticeDTO() {
		super();
	}

	public NoticeDTO(int notice_idx, String notice_subject, String notice_content, Date notice_writedate) {
		super();
		this.notice_idx = notice_idx;
		this.notice_subject = notice_subject;
		this.notice_content = notice_content;
		this.notice_writedate = notice_writedate;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_writedate() {
		return notice_writedate;
	}

	public void setNotice_writedate(Date notice_writedate) {
		this.notice_writedate = notice_writedate;
	}

}
