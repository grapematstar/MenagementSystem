package gyum_02.masterpage.model;

public class Subject_numDTO {
	private int subject_num;
	private String subject_name;
	
	public Subject_numDTO() {
		super();
	}
	public Subject_numDTO(int subject_num, String subject_name) {
		super();
		this.subject_num = subject_num;
		this.subject_name = subject_name;
	}
	public int getSubject_num() {
		return subject_num;
	}
	public void setSubject_num(int subject_num) {
		this.subject_num = subject_num;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	
}
