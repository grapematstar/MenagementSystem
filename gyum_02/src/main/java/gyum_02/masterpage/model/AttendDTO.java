package gyum_02.masterpage.model;

public class AttendDTO {
	private int class_idx;	//강의번호
	private int stu_idx;	//수강생번호
	private int attend_date;	//출석날짜
	private int a_a_idx;	//출결번호
	private String attend_note;	//비고란
	private int s_c_idx;	//보충강의인덱스
	
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
	public AttendDTO() {
		super();
	}
	public AttendDTO(int class_idx, int stu_idx, int attend_date, int a_a_idx, String attend_note, int s_c_idx) {
		super();
		this.class_idx = class_idx;
		this.stu_idx = stu_idx;
		this.attend_date = attend_date;
		this.a_a_idx = a_a_idx;
		this.attend_note = attend_note;
		this.s_c_idx = s_c_idx;
	}
	
}
