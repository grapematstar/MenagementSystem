package gyum_02.main_TeacherInfo.Model;

import java.sql.Date;

public class TeacherInfoDTO {

	private int tea_idx;
	private int tea_birth;
	private String tea_name;
	private String tea_tel;
	private String tea_email;
	private int subject_num;
	private String subject_name;
	private int file_idx;
	private String file_route;
	private int class_idx;
	private int class_startdate;
	private int class_enddate;
	private int class_room;
	private String class_day;
	private int class_time;
	private String class_subject;
	private int class_price;
	private int class_max_student;
	private String c_r_content;
	private Date c_r_writedate;
	private String c_r_writer;
	
	public TeacherInfoDTO() {
		super();
	}

	public TeacherInfoDTO(int tea_idx, int tea_birth, String tea_name, String tea_tel, String tea_email,
			int subject_num, String subject_name, int file_idx, String file_route, int class_idx, int class_startdate,
			int class_enddate, int class_room, String class_day, int class_time, String class_subject, int class_price,
			int class_max_student, String c_r_content, Date c_r_writedate, String c_r_writer) {
		super();
		this.tea_idx = tea_idx;
		this.tea_birth = tea_birth;
		this.tea_name = tea_name;
		this.tea_tel = tea_tel;
		this.tea_email = tea_email;
		this.subject_num = subject_num;
		this.subject_name = subject_name;
		this.file_idx = file_idx;
		this.file_route = file_route;
		this.class_idx = class_idx;
		this.class_startdate = class_startdate;
		this.class_enddate = class_enddate;
		this.class_room = class_room;
		this.class_day = class_day;
		this.class_time = class_time;
		this.class_subject = class_subject;
		this.class_price = class_price;
		this.class_max_student = class_max_student;
		this.c_r_content = c_r_content;
		this.c_r_writedate = c_r_writedate;
		this.c_r_writer = c_r_writer;
	}

	public int getTea_idx() {
		return tea_idx;
	}

	public void setTea_idx(int tea_idx) {
		this.tea_idx = tea_idx;
	}

	public int getTea_birth() {
		return tea_birth;
	}

	public void setTea_birth(int tea_birth) {
		this.tea_birth = tea_birth;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
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

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public String getFile_route() {
		return file_route;
	}

	public void setFile_route(String file_route) {
		this.file_route = file_route;
	}

	public int getClass_idx() {
		return class_idx;
	}

	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
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

	public int getClass_room() {
		return class_room;
	}

	public void setClass_room(int class_room) {
		this.class_room = class_room;
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

	public String getC_r_content() {
		return c_r_content;
	}

	public void setC_r_content(String c_r_content) {
		this.c_r_content = c_r_content;
	}

	public Date getC_r_writedate() {
		return c_r_writedate;
	}

	public void setC_r_writedate(Date c_r_writedate) {
		this.c_r_writedate = c_r_writedate;
	}

	public String getC_r_writer() {
		return c_r_writer;
	}

	public void setC_r_writer(String c_r_writer) {
		this.c_r_writer = c_r_writer;
	}
	
}
