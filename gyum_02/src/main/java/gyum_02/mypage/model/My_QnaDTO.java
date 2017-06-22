package gyum_02.mypage.model;

import java.sql.Date;

public class My_QnaDTO {

	private int qna_idx;
	private String qna_subject;
	private String qna_content;
	private Date qna_writedate;
	private int q_k_idx;
	private int qna_reply;
	private String qna_writer;
	
	private String stu_id;
	private String par_id;
	private String tea_id;
	public My_QnaDTO() {
		super();
	}
	public My_QnaDTO(int qna_idx, String qna_subject, String qna_content, Date qna_writedate, int q_k_idx,
			int qna_reply, String qna_writer, String stu_id, String par_id, String tea_id) {
		super();
		this.qna_idx = qna_idx;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_writedate = qna_writedate;
		this.q_k_idx = q_k_idx;
		this.qna_reply = qna_reply;
		this.qna_writer = qna_writer;
		this.stu_id = stu_id;
		this.par_id = par_id;
		this.tea_id = tea_id;
	}
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_writedate() {
		return qna_writedate;
	}
	public void setQna_writedate(Date qna_writedate) {
		this.qna_writedate = qna_writedate;
	}
	public int getQ_k_idx() {
		return q_k_idx;
	}
	public void setQ_k_idx(int q_k_idx) {
		this.q_k_idx = q_k_idx;
	}
	public int getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(int qna_reply) {
		this.qna_reply = qna_reply;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getPar_id() {
		return par_id;
	}
	public void setPar_id(String par_id) {
		this.par_id = par_id;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	
}
