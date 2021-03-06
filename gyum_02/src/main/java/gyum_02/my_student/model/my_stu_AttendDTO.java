package gyum_02.my_student.model;

public class my_stu_AttendDTO {

	private int class_idx;
	private int stu_idx;
	private int attend_date;
	private int a_a_idx;
	private String attend_note;
	private int s_c_idx;
	
	public my_stu_AttendDTO() {
		super();
	}

	public my_stu_AttendDTO(int class_idx, int stu_idx, int attend_date, int a_a_idx, String attend_note, int s_c_idx) {
		super();
		this.class_idx = class_idx;
		this.stu_idx = stu_idx;
		this.attend_date = attend_date;
		this.a_a_idx = a_a_idx;
		this.attend_note = attend_note;
		this.s_c_idx = s_c_idx;
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

	public int getAttend_date() {
		return attend_date;
	}

	public void setAttend_date(int attend_date) {
		this.attend_date = attend_date;
	}

	public int getA_a_idx() {
		return a_a_idx;
	}

	public void setA_a_idx(int a_a_idx) {
		this.a_a_idx = a_a_idx;
	}

	public String getAttend_note() {
		return attend_note;
	}

	public void setAttend_note(String attend_note) {
		this.attend_note = attend_note;
	}

	public int getS_c_idx() {
		return s_c_idx;
	}

	public void setS_c_idx(int s_c_idx) {
		this.s_c_idx = s_c_idx;
	}
	
}
