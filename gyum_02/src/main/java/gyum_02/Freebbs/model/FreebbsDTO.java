package gyum_02.Freebbs.model;

import java.sql.Date;

public class FreebbsDTO {

	private int f_b_idx;
	private String f_b_subject;
	private String f_b_content;
	private Date f_b_writedate;
	private int f_b_readnum;
	private String f_b_writer;
	private int f_b_reply;
	private int f_b_sunbun;
	
	public FreebbsDTO() {
		super();
	}

	public FreebbsDTO(int f_b_idx, String f_b_subject, String f_b_content, Date f_b_writedate, int f_b_readnum,
			String f_b_writer, int f_b_reply, int f_b_sunbun) {
		super();
		this.f_b_idx = f_b_idx;
		this.f_b_subject = f_b_subject;
		this.f_b_content = f_b_content;
		this.f_b_writedate = f_b_writedate;
		this.f_b_readnum = f_b_readnum;
		this.f_b_writer = f_b_writer;
		this.f_b_reply = f_b_reply;
		this.f_b_sunbun = f_b_sunbun;
	}

	public int getF_b_idx() {
		return f_b_idx;
	}

	public void setF_b_idx(int f_b_idx) {
		this.f_b_idx = f_b_idx;
	}

	public String getF_b_subject() {
		return f_b_subject;
	}

	public void setF_b_subject(String f_b_subject) {
		this.f_b_subject = f_b_subject;
	}

	public String getF_b_content() {
		return f_b_content;
	}

	public void setF_b_content(String f_b_content) {
		this.f_b_content = f_b_content;
	}

	public Date getF_b_writedate() {
		return f_b_writedate;
	}

	public void setF_b_writedate(Date f_b_writedate) {
		this.f_b_writedate = f_b_writedate;
	}

	public int getF_b_readnum() {
		return f_b_readnum;
	}

	public void setF_b_readnum(int f_b_readnum) {
		this.f_b_readnum = f_b_readnum;
	}

	public String getF_b_writer() {
		return f_b_writer;
	}

	public void setF_b_writer(String f_b_writer) {
		this.f_b_writer = f_b_writer;
	}

	public int getF_b_reply() {
		return f_b_reply;
	}

	public void setF_b_reply(int f_b_reply) {
		this.f_b_reply = f_b_reply;
	}

	public int getF_b_sunbun() {
		return f_b_sunbun;
	}

	public void setF_b_sunbun(int f_b_sunbun) {
		this.f_b_sunbun = f_b_sunbun;
	}
	
}
