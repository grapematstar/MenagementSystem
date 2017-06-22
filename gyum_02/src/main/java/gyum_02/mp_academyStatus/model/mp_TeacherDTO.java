package gyum_02.mp_academyStatus.model;

import java.util.Date;

public class mp_TeacherDTO {
	private int tea_idx;
	private String tea_id;
	private String tea_name;
	private String tea_tel;
	private String tea_email;
	private Date tea_in_date;
	private int file_idx;
	
	private String file_route;
	private String file_name;
	
	public mp_TeacherDTO() {
		super();
	}
	public mp_TeacherDTO(int tea_idx, String tea_id, String tea_name, String tea_tel, String tea_email,
			Date tea_in_date, int file_idx) {
		super();
		this.tea_idx = tea_idx;
		this.tea_id = tea_id;
		this.tea_name = tea_name;
		this.tea_tel = tea_tel;
		this.tea_email = tea_email;
		this.tea_in_date = tea_in_date;
		this.file_idx = file_idx;
	}
	public mp_TeacherDTO(int tea_idx, String tea_id, String tea_name, String tea_tel, String tea_email,
			Date tea_in_date, int file_idx, String file_route, String file_name) {
		super();
		this.tea_idx = tea_idx;
		this.tea_id = tea_id;
		this.tea_name = tea_name;
		this.tea_tel = tea_tel;
		this.tea_email = tea_email;
		this.tea_in_date = tea_in_date;
		this.file_idx = file_idx;
		this.file_route = file_route;
		this.file_name = file_name;
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
	public Date getTea_in_date() {
		return tea_in_date;
	}
	public void setTea_in_date(Date tea_in_date) {
		this.tea_in_date = tea_in_date;
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
}
