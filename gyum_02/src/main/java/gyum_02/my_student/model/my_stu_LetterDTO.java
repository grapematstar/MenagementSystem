package gyum_02.my_student.model;

import java.sql.Date;

public class my_stu_LetterDTO {
	
	private int letter_idx;
	private String letter_subject;
	private String letter_content;
	private String letter_sender;
	private String letter_sendee;
	private java.sql.Date letter_senddate;
	private java.sql.Date letter_readdate;
	
	public my_stu_LetterDTO() {
		// TODO Auto-generated constructor stub
	}

	public my_stu_LetterDTO(int letter_idx, String letter_subject, String letter_content, String letter_sender,
			String letter_sendee, Date letter_senddate, Date letter_readdate) {
		super();
		this.letter_idx = letter_idx;
		this.letter_subject = letter_subject;
		this.letter_content = letter_content;
		this.letter_sender = letter_sender;
		this.letter_sendee = letter_sendee;
		this.letter_senddate = letter_senddate;
		this.letter_readdate = letter_readdate;
	}

	public int getLetter_idx() {
		return letter_idx;
	}

	public void setLetter_idx(int letter_idx) {
		this.letter_idx = letter_idx;
	}

	public String getLetter_subject() {
		return letter_subject;
	}

	public void setLetter_subject(String letter_subject) {
		this.letter_subject = letter_subject;
	}

	public String getLetter_content() {
		return letter_content;
	}

	public void setLetter_content(String letter_content) {
		this.letter_content = letter_content;
	}

	public String getLetter_sender() {
		return letter_sender;
	}

	public void setLetter_sender(String letter_sender) {
		this.letter_sender = letter_sender;
	}

	public String getLetter_sendee() {
		return letter_sendee;
	}

	public void setLetter_sendee(String letter_sendee) {
		this.letter_sendee = letter_sendee;
	}

	public java.sql.Date getLetter_senddate() {
		return letter_senddate;
	}

	public void setLetter_senddate(java.sql.Date letter_senddate) {
		this.letter_senddate = letter_senddate;
	}

	public java.sql.Date getLetter_readdate() {
		return letter_readdate;
	}

	public void setLetter_readdate(java.sql.Date letter_readdate) {
		this.letter_readdate = letter_readdate;
	}
	
	
}
