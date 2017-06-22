package gyum_02.masterpage.model;

public class A_tableDTO {
	private String subject_name;//마찬가지
	private int class_idx;//이건 어자피 선택하면 나오는데 없앸ㅋㅋ일단 가져오기 구찮으니idx로 바꿈		
	private int stu_idx;
	private String stu_name;
	private int attend_date;
	private String a_a_attendance;	
	private String attend_note;
	private String class_subject;

	
	public A_tableDTO() {
		super();
	}


	public A_tableDTO(String subject_name, int class_idx, int stu_idx, String stu_name, int attend_date,
			String a_a_attendance, String attend_note,String class_subject) {
		super();
		this.subject_name = subject_name;
		this.class_idx = class_idx;
		this.stu_idx = stu_idx;
		this.stu_name = stu_name;
		this.attend_date = attend_date;
		this.a_a_attendance = a_a_attendance;
		this.attend_note = attend_note;
		this.class_subject = class_subject;
	}


	public String getClass_subject() {
		return class_subject;
	}


	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}


	public String getSubject_name() {
		return subject_name;
	}


	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}


	public int getClass_idx() {
		return class_idx;
	}


	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}


	public int getStu_idx() {
		return stu_idx;
	}


	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}


	public String getStu_name() {
		return stu_name;
	}


	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}


	public int getAttend_date() {
		return attend_date;
	}


	public void setAttend_date(int attend_date) {
		this.attend_date = attend_date;
	}


	public String getA_a_attendance() {
		return a_a_attendance;
	}


	public void setA_a_attendance(String a_a_attendance) {
		this.a_a_attendance = a_a_attendance;
	}


	public String getAttend_note() {
		return attend_note;
	}


	public void setAttend_note(String attend_note) {
		this.attend_note = attend_note;
	}
	
	
}
