package gyum_02.mp_qnaManagement.model;

import java.util.*;

public class mp_QnaDTO {

	private int qna_idx;
	private String qna_subject;
	private String qna_writer;
	private Date qna_writedate;
	private String qna_content;
	private String q_k_kind;
	private int qna_reply;
	
//	q_k_qna_idx
//	q_k_kind
	
	public mp_QnaDTO() {
		super();
	}
	public mp_QnaDTO(int qna_idx, String qna_subject, 
			String qna_writer, Date qna_writedate, String q_k_kind, int qna_reply) {
		super();
		this.qna_idx = qna_idx;
		this.qna_subject = qna_subject;
		this.qna_writer = qna_writer;
		this.qna_writedate = qna_writedate;
		this.q_k_kind = q_k_kind;
		this.qna_reply = qna_reply;
		
	}
	
	public mp_QnaDTO(int qna_idx, String qna_subject, 
			String qna_writer, Date qna_writedate, String qna_content,
			String q_k_kind, int qna_reply) {
		super();
		this.qna_idx = qna_idx;
		this.qna_subject = qna_subject;
		this.qna_writedate = qna_writedate;
		this.qna_writer = qna_writer;
		this.qna_content = qna_content;
		this.q_k_kind = q_k_kind;
		this.qna_reply = qna_reply;
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
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public Date getQna_writedate() {
		return qna_writedate;
	}
	public void setQna_writedate(Date qna_writedate) {
		this.qna_writedate = qna_writedate;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQ_k_kind() {
		return q_k_kind;
	}
	public void setQ_k_kind(String q_k_kind) {
		this.q_k_kind = q_k_kind;
	}
	public int getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(int qna_reply) {
		this.qna_reply = qna_reply;
	}
	
	
	
}
