package gyum_02.study.model;

import java.sql.Date;

public class studyroomDTO {
	private int studyroom_idx;
	private String studyroom_name;
	private String studyroom_id;
	private String studyroom_note;
	private int studyroom_reserv_date;
	private int studyroom_reserv_hour;
	private int studyroom_usetime;
	private int studyroom_tel;
	private Date studyroom_writedate;
	public studyroomDTO() {
		super();
	}
	public studyroomDTO(int studyroom_idx, String studyroom_name, String studyroom_id, String studyroom_note,
			int studyroom_reserv_date, int studyroom_reserv_hour, int studyroom_usetime, int studyroom_tel,
			Date studyroom_writedate) {
		super();
		this.studyroom_idx = studyroom_idx;
		this.studyroom_name = studyroom_name;
		this.studyroom_id = studyroom_id;
		this.studyroom_note = studyroom_note;
		this.studyroom_reserv_date = studyroom_reserv_date;
		this.studyroom_reserv_hour = studyroom_reserv_hour;
		this.studyroom_usetime = studyroom_usetime;
		this.studyroom_tel = studyroom_tel;
		this.studyroom_writedate = studyroom_writedate;
	}
	public int getStudyroom_idx() {
		return studyroom_idx;
	}
	public void setStudyroom_idx(int studyroom_idx) {
		this.studyroom_idx = studyroom_idx;
	}
	public String getStudyroom_name() {
		return studyroom_name;
	}
	public void setStudyroom_name(String studyroom_name) {
		this.studyroom_name = studyroom_name;
	}
	public String getStudyroom_id() {
		return studyroom_id;
	}
	public void setStudyroom_id(String studyroom_id) {
		this.studyroom_id = studyroom_id;
	}
	public String getStudyroom_note() {
		return studyroom_note;
	}
	public void setStudyroom_note(String studyroom_note) {
		this.studyroom_note = studyroom_note;
	}
	public int getStudyroom_reserv_date() {
		return studyroom_reserv_date;
	}
	public void setStudyroom_reserv_date(int studyroom_reserv_date) {
		this.studyroom_reserv_date = studyroom_reserv_date;
	}
	public int getStudyroom_reserv_hour() {
		return studyroom_reserv_hour;
	}
	public void setStudyroom_reserv_hour(int studyroom_reserv_hour) {
		this.studyroom_reserv_hour = studyroom_reserv_hour;
	}
	public int getStudyroom_usetime() {
		return studyroom_usetime;
	}
	public void setStudyroom_usetime(int studyroom_usetime) {
		this.studyroom_usetime = studyroom_usetime;
	}
	public int getStudyroom_tel() {
		return studyroom_tel;
	}
	public void setStudyroom_tel(int studyroom_tel) {
		this.studyroom_tel = studyroom_tel;
	}
	public Date getStudyroom_writedate() {
		return studyroom_writedate;
	}
	public void setStudyroom_writedate(Date studyroom_writedate) {
		this.studyroom_writedate = studyroom_writedate;
	}
	
	

	
}
