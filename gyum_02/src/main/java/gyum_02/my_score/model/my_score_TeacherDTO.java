package gyum_02.my_score.model;

import java.sql.Date;

public class my_score_TeacherDTO {

	private int tea_idx;
	private String tea_id;
	private String tea_pwd;
	private int pwd_q_idx;
	private String tea_pwd_a;
	private int tea_birth;
	private String tea_name;
	private String tea_tel;
	private String tea_email;
	private int subject_num;
	private java.sql.Date tea_in_date;
	private java.sql.Date tea_out_date;
	private int file_idx;
	
	public my_score_TeacherDTO() {
		// TODO Auto-generated constructor stub
	}

	public my_score_TeacherDTO(int tea_idx, String tea_id, String tea_pwd, int pwd_q_idx, String tea_pwd_a,
			int tea_birth, String tea_name, String tea_tel, String tea_email, int subject_num, Date tea_in_date,
			Date tea_out_date, int file_idx) {
		super();
		this.tea_idx = tea_idx;
		this.tea_id = tea_id;
		this.tea_pwd = tea_pwd;
		this.pwd_q_idx = pwd_q_idx;
		this.tea_pwd_a = tea_pwd_a;
		this.tea_birth = tea_birth;
		this.tea_name = tea_name;
		this.tea_tel = tea_tel;
		this.tea_email = tea_email;
		this.subject_num = subject_num;
		this.tea_in_date = tea_in_date;
		this.tea_out_date = tea_out_date;
		this.file_idx = file_idx;
	}

	public int getTea_idx() {
		return tea_idx;
	}

	public void setTea_idx(int tea_idx) {
		this.tea_idx = tea_idx;
	}

	public String getTea_id() {
		return tea_id;
	}

	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}

	public String getTea_pwd() {
		return tea_pwd;
	}

	public void setTea_pwd(String tea_pwd) {
		this.tea_pwd = tea_pwd;
	}

	public int getPwd_q_idx() {
		return pwd_q_idx;
	}

	public void setPwd_q_idx(int pwd_q_idx) {
		this.pwd_q_idx = pwd_q_idx;
	}

	public String getTea_pwd_a() {
		return tea_pwd_a;
	}

	public void setTea_pwd_a(String tea_pwd_a) {
		this.tea_pwd_a = tea_pwd_a;
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

	public java.sql.Date getTea_in_date() {
		return tea_in_date;
	}

	public void setTea_in_date(java.sql.Date tea_in_date) {
		this.tea_in_date = tea_in_date;
	}

	public java.sql.Date getTea_out_date() {
		return tea_out_date;
	}

	public void setTea_out_date(java.sql.Date tea_out_date) {
		this.tea_out_date = tea_out_date;
	}

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	
}
