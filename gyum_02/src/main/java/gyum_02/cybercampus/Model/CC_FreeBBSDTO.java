package gyum_02.cybercampus.Model;

import java.util.Date;

public class CC_FreeBBSDTO {
	private int c_f_b_idx;
	private int club_idx;
	private String c_f_b_writer;
	private String c_f_b_subject;
	private String c_f_b_content;
	private java.util.Date c_f_b_writedate;
	private String string_writedate;
	
	
	private int c_f_b_r_idx;
	private String c_f_b_r_writer;
	private String c_f_b_r_content;
	private String c_f_b_r_towho;
	private java.util.Date c_f_b_r_date;
	public CC_FreeBBSDTO(int c_f_b_idx, int club_idx, String c_f_b_writer, String c_f_b_subject, String c_f_b_content,
			Date c_f_b_writedate, String string_writedate, int c_f_b_r_idx, String c_f_b_r_writer,
			String c_f_b_r_content, String c_f_b_r_towho, Date c_f_b_r_date) {
		super();
		this.c_f_b_idx = c_f_b_idx;
		this.club_idx = club_idx;
		this.c_f_b_writer = c_f_b_writer;
		this.c_f_b_subject = c_f_b_subject;
		this.c_f_b_content = c_f_b_content;
		this.c_f_b_writedate = c_f_b_writedate;
		this.string_writedate = string_writedate;
		this.c_f_b_r_idx = c_f_b_r_idx;
		this.c_f_b_r_writer = c_f_b_r_writer;
		this.c_f_b_r_content = c_f_b_r_content;
		this.c_f_b_r_towho = c_f_b_r_towho;
		this.c_f_b_r_date = c_f_b_r_date;
	}
	public int getC_f_b_idx() {
		return c_f_b_idx;
	}
	public void setC_f_b_idx(int c_f_b_idx) {
		this.c_f_b_idx = c_f_b_idx;
	}
	public int getClub_idx() {
		return club_idx;
	}
	public void setClub_idx(int club_idx) {
		this.club_idx = club_idx;
	}
	public String getC_f_b_writer() {
		return c_f_b_writer;
	}
	public void setC_f_b_writer(String c_f_b_writer) {
		this.c_f_b_writer = c_f_b_writer;
	}
	public String getC_f_b_subject() {
		return c_f_b_subject;
	}
	public void setC_f_b_subject(String c_f_b_subject) {
		this.c_f_b_subject = c_f_b_subject;
	}
	public String getC_f_b_content() {
		return c_f_b_content;
	}
	public void setC_f_b_content(String c_f_b_content) {
		this.c_f_b_content = c_f_b_content;
	}
	public java.util.Date getC_f_b_writedate() {
		return c_f_b_writedate;
	}
	public void setC_f_b_writedate(java.util.Date c_f_b_writedate) {
		this.c_f_b_writedate = c_f_b_writedate;
	}
	public String getString_writedate() {
		return string_writedate;
	}
	public void setString_writedate(String string_writedate) {
		this.string_writedate = string_writedate;
	}
	public int getC_f_b_r_idx() {
		return c_f_b_r_idx;
	}
	public void setC_f_b_r_idx(int c_f_b_r_idx) {
		this.c_f_b_r_idx = c_f_b_r_idx;
	}
	public String getC_f_b_r_writer() {
		return c_f_b_r_writer;
	}
	public void setC_f_b_r_writer(String c_f_b_r_writer) {
		this.c_f_b_r_writer = c_f_b_r_writer;
	}
	public String getC_f_b_r_content() {
		return c_f_b_r_content;
	}
	public void setC_f_b_r_content(String c_f_b_r_content) {
		this.c_f_b_r_content = c_f_b_r_content;
	}
	public String getC_f_b_r_towho() {
		return c_f_b_r_towho;
	}
	public void setC_f_b_r_towho(String c_f_b_r_towho) {
		this.c_f_b_r_towho = c_f_b_r_towho;
	}
	public java.util.Date getC_f_b_r_date() {
		return c_f_b_r_date;
	}
	public void setC_f_b_r_date(java.util.Date c_f_b_r_date) {
		this.c_f_b_r_date = c_f_b_r_date;
	}
	public CC_FreeBBSDTO() {
		super();
	}

	
	
	
}
