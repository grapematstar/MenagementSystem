package gyum_02.cybercampus.Model;

import java.util.Date;

public class CC_EpilogueDTO {
	private int c_r_idx;
	private int class_idx;
	private String c_r_subject;
	private String c_r_content;
	private java.util.Date c_r_writedate;
	private int c_r_readnum;
	private String c_r_writer;
	private int c_r_reply;
	private int c_r_sunbun;
	
	private String class_subject;
	private String tea_name;
	
	private String string_writedate;

	public CC_EpilogueDTO(int c_r_idx, int class_idx, String c_r_subject, String c_r_content, Date c_r_writedate,
			int c_r_readnum, String c_r_writer, int c_r_reply, int c_r_sunbun, String class_subject, String tea_name,
			String string_writedate) {
		super();
		this.c_r_idx = c_r_idx;
		this.class_idx = class_idx;
		this.c_r_subject = c_r_subject;
		this.c_r_content = c_r_content;
		this.c_r_writedate = c_r_writedate;
		this.c_r_readnum = c_r_readnum;
		this.c_r_writer = c_r_writer;
		this.c_r_reply = c_r_reply;
		this.c_r_sunbun = c_r_sunbun;
		this.class_subject = class_subject;
		this.tea_name = tea_name;
		this.string_writedate = string_writedate;
	}

	public CC_EpilogueDTO() {
		super();
	}

	public int getC_r_idx() {
		return c_r_idx;
	}

	public void setC_r_idx(int c_r_idx) {
		this.c_r_idx = c_r_idx;
	}

	public int getClass_idx() {
		return class_idx;
	}

	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}

	public String getC_r_subject() {
		return c_r_subject;
	}

	public void setC_r_subject(String c_r_subject) {
		this.c_r_subject = c_r_subject;
	}

	public String getC_r_content() {
		return c_r_content;
	}

	public void setC_r_content(String c_r_content) {
		this.c_r_content = c_r_content;
	}

	public java.util.Date getC_r_writedate() {
		return c_r_writedate;
	}

	public void setC_r_writedate(java.util.Date c_r_writedate) {
		this.c_r_writedate = c_r_writedate;
	}

	public int getC_r_readnum() {
		return c_r_readnum;
	}

	public void setC_r_readnum(int c_r_readnum) {
		this.c_r_readnum = c_r_readnum;
	}

	public String getC_r_writer() {
		return c_r_writer;
	}

	public void setC_r_writer(String c_r_writer) {
		this.c_r_writer = c_r_writer;
	}

	public int getC_r_reply() {
		return c_r_reply;
	}

	public void setC_r_reply(int c_r_reply) {
		this.c_r_reply = c_r_reply;
	}

	public int getC_r_sunbun() {
		return c_r_sunbun;
	}

	public void setC_r_sunbun(int c_r_sunbun) {
		this.c_r_sunbun = c_r_sunbun;
	}

	public String getClass_subject() {
		return class_subject;
	}

	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}

	public String getString_writedate() {
		return string_writedate;
	}

	public void setString_writedate(String string_writedate) {
		this.string_writedate = string_writedate;
	}
	

}
