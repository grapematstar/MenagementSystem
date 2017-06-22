package gyum_02.cybercampus.Model;

import java.util.*;

public class CccccccDTO {
	private int c_h_t_idx;
	private int class_idx;
	private int tea_idx;
	private String c_h_t_subject;
	private Date c_h_t_startdate;
	private Date c_h_t_enddate;
	private Date c_h_t_deadline;
	private String c_h_t_notice;
	private Date c_h_t_writedate;
	
	private int c_h_s_idx;
	private int stu_idx;
	private int file_idx;
	private Date c_h_s_writedate;

	private String c_h_t_present;
	private String c_h_t_status;
	private String tea_name;
	private String file_route;
	private String file_name;
	
	private Date file_enrolldate;
	private Date file_modidate;

	public CccccccDTO() {
		super();
	}
	public CccccccDTO(int c_h_t_idx, int class_idx, int tea_idx, String c_h_t_subject, Date c_h_t_startdate,
			Date c_h_t_enddate, Date c_h_t_deadline, String c_h_t_notice, Date c_h_t_writedate, int c_h_s_idx,
			int stu_idx, int file_idx, Date c_h_s_writedate, String c_h_t_present, String c_h_t_status, String tea_name,
			String file_route, String file_name) {
		super();
		this.c_h_t_idx = c_h_t_idx;
		this.class_idx = class_idx;
		this.tea_idx = tea_idx;
		this.c_h_t_subject = c_h_t_subject;
		this.c_h_t_startdate = c_h_t_startdate;
		this.c_h_t_enddate = c_h_t_enddate;
		this.c_h_t_deadline = c_h_t_deadline;
		this.c_h_t_notice = c_h_t_notice;
		this.c_h_t_writedate = c_h_t_writedate;
		this.c_h_s_idx = c_h_s_idx;
		this.stu_idx = stu_idx;
		this.file_idx = file_idx;
		this.c_h_s_writedate = c_h_s_writedate;
		this.c_h_t_present = c_h_t_present;
		this.c_h_t_status = c_h_t_status;
		this.tea_name = tea_name;
		this.file_route = file_route;
		this.file_name = file_name;
	}
	public CccccccDTO(int c_h_t_idx, String c_h_t_subject, Date c_h_t_enddate, Date c_h_t_writedate,
			String c_h_t_present, String c_h_t_status, String tea_name) {
		super();
		this.c_h_t_idx = c_h_t_idx;
		this.c_h_t_subject = c_h_t_subject;
		this.c_h_t_enddate = c_h_t_enddate;
		this.c_h_t_writedate = c_h_t_writedate;
		this.c_h_t_present = c_h_t_present;
		this.c_h_t_status = c_h_t_status;
		this.tea_name = tea_name;
	}
	
	public Date getFile_enrolldate() {
		return file_enrolldate;
	}
	public void setFile_enrolldate(Date file_enrolldate) {
		this.file_enrolldate = file_enrolldate;
	}
	public Date getFile_modidate() {
		return file_modidate;
	}
	public void setFile_modidate(Date file_modidate) {
		this.file_modidate = file_modidate;
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
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
	public int getC_h_t_idx() {
		return c_h_t_idx;
	}

	public void setC_h_t_idx(int c_h_t_idx) {
		this.c_h_t_idx = c_h_t_idx;
	}

	public int getClass_idx() {
		return class_idx;
	}

	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}

	public int getTea_idx() {
		return tea_idx;
	}

	public void setTea_idx(int tea_idx) {
		this.tea_idx = tea_idx;
	}

	public String getC_h_t_subject() {
		return c_h_t_subject;
	}

	public void setC_h_t_subject(String c_h_t_subject) {
		this.c_h_t_subject = c_h_t_subject;
	}

	public Date getC_h_t_startdate() {
		return c_h_t_startdate;
	}

	public void setC_h_t_startdate(Date c_h_t_startdate) {
		this.c_h_t_startdate = c_h_t_startdate;
	}

	public Date getC_h_t_enddate() {
		return c_h_t_enddate;
	}

	public void setC_h_t_enddate(Date c_h_t_enddate) {
		this.c_h_t_enddate = c_h_t_enddate;
	}

	public Date getC_h_t_deadline() {
		return c_h_t_deadline;
	}

	public void setC_h_t_deadline(Date c_h_t_deadline) {
		this.c_h_t_deadline = c_h_t_deadline;
	}

	public String getC_h_t_notice() {
		return c_h_t_notice;
	}

	public void setC_h_t_notice(String c_h_t_notice) {
		this.c_h_t_notice = c_h_t_notice;
	}

	public Date getC_h_t_writedate() {
		return c_h_t_writedate;
	}

	public void setC_h_t_writedate(Date c_h_t_writedate) {
		this.c_h_t_writedate = c_h_t_writedate;
	}

	public int getC_h_s_idx() {
		return c_h_s_idx;
	}

	public void setC_h_s_idx(int c_h_s_idx) {
		this.c_h_s_idx = c_h_s_idx;
	}

	public int getStu_idx() {
		return stu_idx;
	}

	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}

	public Date getC_h_s_writedate() {
		return c_h_s_writedate;
	}

	public void setC_h_s_writedate(Date c_h_s_writedate) {
		this.c_h_s_writedate = c_h_s_writedate;
	}

	public String getC_h_t_present() {
		return c_h_t_present;
	}

	public void setC_h_t_present(String c_h_t_present) {
		this.c_h_t_present = c_h_t_present;
	}

	public String getC_h_t_status() {
		return c_h_t_status;
	}

	public void setC_h_t_status(String c_h_t_status) {
		this.c_h_t_status = c_h_t_status;
	}
	
	
}
