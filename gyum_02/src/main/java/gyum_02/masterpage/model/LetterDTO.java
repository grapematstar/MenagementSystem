package gyum_02.masterpage.model;

import java.sql.*;

public class LetterDTO {
	private int letter_idx;	//쪽지인덱스
	private String letter_subject;	//제목
	private String letter_content;	//내용
	private String letter_sender;	//보낸이
	private String letter_sendee;	//받는이
	private Date letter_senddate;	//보낸날짜
	private Date letter_readdate;	//읽은날짜
	public LetterDTO() {
		super();
	}
	public LetterDTO(int letter_idx, String letter_subject, String letter_content, String letter_sender,
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
	public Date getLetter_senddate() {
		return letter_senddate;
	}
	public void setLetter_senddate(Date letter_senddate) {
		this.letter_senddate = letter_senddate;
	}
	public Date getLetter_readdate() {
		return letter_readdate;
	}
	public void setLetter_readdate(Date letter_readdate) {
		this.letter_readdate = letter_readdate;
	}
	
	
	
	
}
