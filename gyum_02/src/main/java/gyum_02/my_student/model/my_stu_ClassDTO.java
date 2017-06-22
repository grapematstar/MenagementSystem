package gyum_02.my_student.model;

public class my_stu_ClassDTO {
	
	private int class_idx;
	private int subject_num;
	private int class_startdate;
	private int class_enddate;
	private int classroom;
	private String class_day;
	private int class_time;
	private String class_subject;
	private int tea_idx;
	private int class_price;
	private int class_max_student;
	
	private String tea_name;
	
	public my_stu_ClassDTO() {
		super();
	}

	public my_stu_ClassDTO(int class_idx, int subject_num, int class_startdate, int class_enddate, int classroom,
			String class_day, int class_time, String class_subject, int tea_idx, int class_price,
			int class_max_student) {
		super();
		this.class_idx = class_idx;
		this.subject_num = subject_num;
		this.class_startdate = class_startdate;
		this.class_enddate = class_enddate;
		this.classroom = classroom;
		this.class_day = class_day;
		this.class_time = class_time;
		this.class_subject = class_subject;
		this.tea_idx = tea_idx;
		this.class_price = class_price;
		this.class_max_student = class_max_student;
	}
	
	public my_stu_ClassDTO(int class_idx, int subject_num, int class_startdate, int class_enddate, int classroom,
			String class_day, int class_time, String class_subject, int tea_idx, int class_price, int class_max_student,
			String tea_name) {
		super();
		this.class_idx = class_idx;
		this.subject_num = subject_num;
		this.class_startdate = class_startdate;
		this.class_enddate = class_enddate;
		this.classroom = classroom;
		this.class_day = class_day;
		this.class_time = class_time;
		this.class_subject = class_subject;
		this.tea_idx = tea_idx;
		this.class_price = class_price;
		this.class_max_student = class_max_student;
		this.tea_name = tea_name;
	}

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

	public String getClass_day() {
		return class_day;
	}

	public void setClass_day(String class_day) {
		this.class_day = class_day;
	}

	public int getClass_time() {
		return class_time;
	}

	public void setClass_time(int class_time) {
		this.class_time = class_time;
	}

	public String getClass_subject() {
		return class_subject;
	}

	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}

	public int getTea_idx() {
		return tea_idx;
	}

	public void setTea_idx(int tea_idx) {
		this.tea_idx = tea_idx;
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

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
		
}
