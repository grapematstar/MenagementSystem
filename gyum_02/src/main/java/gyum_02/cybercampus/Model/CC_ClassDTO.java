package gyum_02.cybercampus.Model;

public class CC_ClassDTO {
	//CLASS
	private int rnum;
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
	private int club_idx;
	//CLASS_NUM,SUBJECT_NUM
	private String class_num;
	//CLASS_STUDENT
	private int stu_idx;
	//TEACHER
	private String tea_name;
	private String tea_id;
	private String tea_tel;
	private String tea_email;
	private int class_check;
	public CC_ClassDTO(int rnum, int class_idx, int subject_num, int class_startdate, int class_enddate, int classroom,
			String class_day, int class_time, String class_subject, int tea_idx, int class_price, int class_max_student,
			int club_idx, String class_num, int stu_idx, String tea_name, String tea_id, String tea_tel,
			String tea_email, int class_check) {
		super();
		this.rnum = rnum;
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
		this.club_idx = club_idx;
		this.class_num = class_num;
		this.stu_idx = stu_idx;
		this.tea_name = tea_name;
		this.tea_id = tea_id;
		this.tea_tel = tea_tel;
		this.tea_email = tea_email;
		this.class_check = class_check;
	}
	public CC_ClassDTO() {
		super();
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
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
	public int getClub_idx() {
		return club_idx;
	}
	public void setClub_idx(int club_idx) {
		this.club_idx = club_idx;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public int getStu_idx() {
		return stu_idx;
	}
	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public String getTea_tel() {
		return tea_tel;
	}
	public void setTea_tel(String tea_tel) {
		this.tea_tel = tea_tel;
	}
	public String getTea_email() {
		return tea_email;
	}
	public void setTea_email(String tea_email) {
		this.tea_email = tea_email;
	}
	public int getClass_check() {
		return class_check;
	}
	public void setClass_check(int class_check) {
		this.class_check = class_check;
	}
	
}
