package gyum_02.mp_academyStatus.model;

import java.util.*;

public class mp_StudentDTO {
	private int stu_idx;
	private String stu_id;
	private String stu_name;
	private String stu_tel;
	private String stu_email;
	private Date stu_in_date;
	private Date stu_out_date;
	private String stu_school;
	private String class_subject;
	private String class_idx_s;
	private int class_idx;
	//테이블 : student, class, timetable
	//연결 : 	  timetable.stu_idx, class_idx
	
	public mp_StudentDTO() {
		super();
	}

	public mp_StudentDTO(int stu_idx, String stu_id, String stu_name, String stu_tel, String stu_email, Date stu_in_date, Date stu_out_date,
			String stu_school, int class_idx) {
		super();
		this.stu_idx = stu_idx;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_tel = stu_tel;
		this.stu_email = stu_email;
		this.stu_in_date = stu_in_date;
		this.stu_out_date = stu_out_date;
		this.stu_school = stu_school;
		this.class_idx = class_idx;
	}
	
	public mp_StudentDTO(int stu_idx, String stu_id, String stu_name, String stu_tel, String stu_email, Date stu_in_date, Date stu_out_date,
			String stu_school, String class_subject) {
		super();
		this.stu_idx = stu_idx;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_tel = stu_tel;
		this.stu_email = stu_email;
		this.stu_in_date = stu_in_date;
		this.stu_out_date = stu_out_date;
		this.stu_school = stu_school;
		this.class_subject = class_subject;
	}
	

	public int getStu_idx() {
		return stu_idx;
	}

	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_tel() {
		return stu_tel;
	}

	public void setStu_tel(String stu_tel) {
		this.stu_tel = stu_tel;
	}

	public String getStu_email() {
		return stu_email;
	}

	public void setStu_email(String stu_email) {
		this.stu_email = stu_email;
	}

	public Date getStu_in_date() {
		return stu_in_date;
	}

	public void setStu_in_date(Date stu_in_date) {
		this.stu_in_date = stu_in_date;
	}

	public Date getStu_out_date() {
		return stu_out_date;
	}

	public void setStu_out_date(Date stu_out_date) {
		this.stu_out_date = stu_out_date;
	}

	public String getStu_school() {
		return stu_school;
	}

	public void setStu_school(String stu_school) {
		this.stu_school = stu_school;
	}

	public String getClass_subject() {
		return class_subject;
	}

	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}

	public String getClass_idx_s() {
		return class_idx_s;
	}

	public void setClass_idx_s(String class_idx_s) {
		this.class_idx_s = class_idx_s;
	}

	public int getClass_idx() {
		return class_idx;
	}

	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}

	
}
