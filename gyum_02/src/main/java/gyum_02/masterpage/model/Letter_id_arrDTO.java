package gyum_02.masterpage.model;
import java.util.*;
public class Letter_id_arrDTO {
	
	private List<LetterDTO> letterdto;
	private String letter_sender;
	private String letter_subject;
	private String letter_content;
	
	public Letter_id_arrDTO(List<LetterDTO> letterdto, String letter_sender, String letter_subject,
			String letter_content) {
		super();
		this.letterdto = letterdto;
		this.letter_sender = letter_sender;
		this.letter_subject = letter_subject;
		this.letter_content = letter_content;
	}
	public Letter_id_arrDTO() {
		super();
	}
	public List<LetterDTO> getLetterdto() {
		return letterdto;
	}
	public void setLetterdto(List<LetterDTO> letterdto) {
		this.letterdto = letterdto;
	}
	public String getLetter_sender() {
		return letter_sender;
	}
	public void setLetter_sender(String letter_sender) {
		this.letter_sender = letter_sender;
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
	


	
}
