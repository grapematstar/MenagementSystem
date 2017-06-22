package gyum_02.cybercampus.Model;

import java.util.Date;

public class CC_QnADTO {
	//ROWNUM
	private int rnum;
	//CLUB_QNA_QUESTION
	private int c_q_q_idx;
	private int club_idx;
	private String c_q_q_writer;
	private String c_q_q_subject;
	private String c_q_q_content;
	private java.util.Date c_q_q_writedate;
	//CLUB_QNA_ANSWER
	private int c_q_a_idx;
	private String c_q_a_writer;
	private String c_q_a_content;
	private java.util.Date c_q_a_writedate;
	
	private String string_Qwritedate;
	private String string_Awritedate;
	public CC_QnADTO(int rnum, int c_q_q_idx, int club_idx, String c_q_q_writer, String c_q_q_subject,
			String c_q_q_content, Date c_q_q_writedate, int c_q_a_idx, String c_q_a_writer, String c_q_a_content,
			Date c_q_a_writedate, String string_Qwritedate, String string_Awritedate) {
		super();
		this.rnum = rnum;
		this.c_q_q_idx = c_q_q_idx;
		this.club_idx = club_idx;
		this.c_q_q_writer = c_q_q_writer;
		this.c_q_q_subject = c_q_q_subject;
		this.c_q_q_content = c_q_q_content;
		this.c_q_q_writedate = c_q_q_writedate;
		this.c_q_a_idx = c_q_a_idx;
		this.c_q_a_writer = c_q_a_writer;
		this.c_q_a_content = c_q_a_content;
		this.c_q_a_writedate = c_q_a_writedate;
		this.string_Qwritedate = string_Qwritedate;
		this.string_Awritedate = string_Awritedate;
	}
	public CC_QnADTO() {
		super();
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getC_q_q_idx() {
		return c_q_q_idx;
	}
	public void setC_q_q_idx(int c_q_q_idx) {
		this.c_q_q_idx = c_q_q_idx;
	}
	public int getClub_idx() {
		return club_idx;
	}
	public void setClub_idx(int club_idx) {
		this.club_idx = club_idx;
	}
	public String getC_q_q_writer() {
		return c_q_q_writer;
	}
	public void setC_q_q_writer(String c_q_q_writer) {
		this.c_q_q_writer = c_q_q_writer;
	}
	public String getC_q_q_subject() {
		return c_q_q_subject;
	}
	public void setC_q_q_subject(String c_q_q_subject) {
		this.c_q_q_subject = c_q_q_subject;
	}
	public String getC_q_q_content() {
		return c_q_q_content;
	}
	public void setC_q_q_content(String c_q_q_content) {
		this.c_q_q_content = c_q_q_content;
	}
	public java.util.Date getC_q_q_writedate() {
		return c_q_q_writedate;
	}
	public void setC_q_q_writedate(java.util.Date c_q_q_writedate) {
		this.c_q_q_writedate = c_q_q_writedate;
	}
	public int getC_q_a_idx() {
		return c_q_a_idx;
	}
	public void setC_q_a_idx(int c_q_a_idx) {
		this.c_q_a_idx = c_q_a_idx;
	}
	public String getC_q_a_writer() {
		return c_q_a_writer;
	}
	public void setC_q_a_writer(String c_q_a_writer) {
		this.c_q_a_writer = c_q_a_writer;
	}
	public String getC_q_a_content() {
		return c_q_a_content;
	}
	public void setC_q_a_content(String c_q_a_content) {
		this.c_q_a_content = c_q_a_content;
	}
	public java.util.Date getC_q_a_writedate() {
		return c_q_a_writedate;
	}
	public void setC_q_a_writedate(java.util.Date c_q_a_writedate) {
		this.c_q_a_writedate = c_q_a_writedate;
	}
	public String getString_Qwritedate() {
		return string_Qwritedate;
	}
	public void setString_Qwritedate(String string_Qwritedate) {
		this.string_Qwritedate = string_Qwritedate;
	}
	public String getString_Awritedate() {
		return string_Awritedate;
	}
	public void setString_Awritedate(String string_Awritedate) {
		this.string_Awritedate = string_Awritedate;
	}


}
