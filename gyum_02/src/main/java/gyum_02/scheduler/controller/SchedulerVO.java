package gyum_02.scheduler.controller;

import java.sql.Date;

public class SchedulerVO {
	
	private int event_id;
	private String event_name;  
	private String start_date;  
	private String end_date;
	private int study_idx;
	private String stu_name;
	private int study_event_dayrepot;
	private Date study_event_writedate;
	
	public SchedulerVO() {
		super();
	}

	public SchedulerVO(int event_id, String event_name, String start_date, String end_date, int study_idx,
			String stu_name, int study_event_dayrepot, Date study_event_writedate) {
		super();
		this.event_id = event_id;
		this.event_name = event_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.study_idx = study_idx;
		this.stu_name = stu_name;
		this.study_event_dayrepot = study_event_dayrepot;
		this.study_event_writedate = study_event_writedate;
	}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getStudy_idx() {
		return study_idx;
	}

	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public int getStudy_event_dayrepot() {
		return study_event_dayrepot;
	}

	public void setStudy_event_dayrepot(int study_event_dayrepot) {
		this.study_event_dayrepot = study_event_dayrepot;
	}

	public Date getStudy_event_writedate() {
		return study_event_writedate;
	}

	public void setStudy_event_writedate(Date study_event_writedate) {
		this.study_event_writedate = study_event_writedate;
	}
	
	
}