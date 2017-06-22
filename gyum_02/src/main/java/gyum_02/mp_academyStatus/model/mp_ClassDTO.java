package gyum_02.mp_academyStatus.model;

public class mp_ClassDTO {
	private int class_idx;
	private int subject_num;//과목번호
	private int class_startdate;//개강일
	private int class_enddate;//종강일
	private int classroom;//강의실번호
	private int class_time;//강의시간
	private int class_price;//수강료
	private int class_max_student;//최대인원
	private String class_day;//강의요일
	private String class_subject;//강의제목
	private String tea_id;//강사id
	private int tea_idx;//강사idx

//	tea_idx	NUMBER
//	tea_id
	
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public int getSubject_num() {
		return subject_num;
	}
	public void setSubject_num(int subject_num) {
		this.subject_num = subject_num;
	}
	public int getClass_startdate() {
		return class_startdate;
	}
	public void setClass_startdate(int class_startdate) {
		this.class_startdate = class_startdate;
	}
	public int getClass_enddate() {
		return class_enddate;
	}
	public void setClass_enddate(int class_enddate) {
		this.class_enddate = class_enddate;
	}
	public int getClassroom() {
		return classroom;
	}
	public void setClassroom(int classroom) {
		this.classroom = classroom;
	}
	public int getClass_time() {
		return class_time;
	}
	public void setClass_time(int class_time) {
		this.class_time = class_time;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public int getClass_max_student() {
		return class_max_student;
	}
	public void setClass_max_student(int class_max_student) {
		this.class_max_student = class_max_student;
	}
	public String getClass_day() {
		return class_day;
	}
	public void setClass_day(String class_day) {
		this.class_day = class_day;
	}
	public String getClass_subject() {
		return class_subject;
	}
	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public int getTea_idx() {
		return tea_idx;
	}
	public void setTea_idx(int tea_idx) {
		this.tea_idx = tea_idx;
	}
	
}
