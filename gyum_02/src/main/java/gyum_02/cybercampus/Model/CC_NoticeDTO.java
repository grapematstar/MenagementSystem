package gyum_02.cybercampus.Model;

import java.util.Date;

public class CC_NoticeDTO {
	private int c_n_idx;
	private int club_idx;
	private String c_n_writer;
	private String c_n_subject;
	private String c_n_content;
	private String file_idx;
	private int c_n_readnum;
	private java.util.Date c_n_writedate;
	
	private String string_writedate;

	public CC_NoticeDTO(int c_n_idx, int club_idx, String c_n_writer, String c_n_subject, String c_n_content,
			String file_idx, int c_n_readnum, Date c_n_writedate, String string_writedate) {
		super();
		this.c_n_idx = c_n_idx;
		this.club_idx = club_idx;
		this.c_n_writer = c_n_writer;
		this.c_n_subject = c_n_subject;
		this.c_n_content = c_n_content;
		this.file_idx = file_idx;
		this.c_n_readnum = c_n_readnum;
		this.c_n_writedate = c_n_writedate;
		this.string_writedate = string_writedate;
	}

	public CC_NoticeDTO() {
		super();
	}

	public int getC_n_idx() {
		return c_n_idx;
	}

	public void setC_n_idx(int c_n_idx) {
		this.c_n_idx = c_n_idx;
	}

	public int getClub_idx() {
		return club_idx;
	}

	public void setClub_idx(int club_idx) {
		this.club_idx = club_idx;
	}

	public String getC_n_writer() {
		return c_n_writer;
	}

	public void setC_n_writer(String c_n_writer) {
		this.c_n_writer = c_n_writer;
	}

	public String getC_n_subject() {
		return c_n_subject;
	}

	public void setC_n_subject(String c_n_subject) {
		this.c_n_subject = c_n_subject;
	}

	public String getC_n_content() {
		return c_n_content;
	}

	public void setC_n_content(String c_n_content) {
		this.c_n_content = c_n_content;
	}

	public String getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(String file_idx) {
		this.file_idx = file_idx;
	}

	public int getC_n_readnum() {
		return c_n_readnum;
	}

	public void setC_n_readnum(int c_n_readnum) {
		this.c_n_readnum = c_n_readnum;
	}

	public java.util.Date getC_n_writedate() {
		return c_n_writedate;
	}

	public void setC_n_writedate(java.util.Date c_n_writedate) {
		this.c_n_writedate = c_n_writedate;
	}

	public String getString_writedate() {
		return string_writedate;
	}

	public void setString_writedate(String string_writedate) {
		this.string_writedate = string_writedate;
	}
	
	
}
