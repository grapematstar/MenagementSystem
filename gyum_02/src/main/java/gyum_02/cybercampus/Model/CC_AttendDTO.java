package gyum_02.cybercampus.Model;

import java.util.Date;
import java.util.List;

public class CC_AttendDTO {
	// ROWNUM
	private int rnum;
	// Today
	private String today;
	// Attend
	private int class_idx;
	private int stu_idx;
	private int attend_date;
	private String string_attenddate;
	private String attend_note;
	private int s_c_idx;
	private int a_a_idx;
	// Student
	private String stu_id;
	private String stu_name;
	private int stu_birth;
	private java.util.Date stu_in_date;
	private String string_stuindate;
	// Attend_Attendance
	private String a_a_attendance;
	// Club_present
	private int c_p_idx;
	private int club_idx;
	private int c_p_state;
	private String c_p_ex;
	private int c_p_writedate;
	// STU_SCORE
	// private int stu_idx;
	private int subject_num;
	// private int class_idx;
	private int s_s_result;
	private int s_s_date;
	private String string_ssdate;
	// private int club_idx;
	private String subject_name;
	private String class_num;
	private String class_subject;
	private List<CC_AttendDTO> list;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public int getStu_idx() {
		return stu_idx;
	}
	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}
	public int getAttend_date() {
		return attend_date;
	}
	public void setAttend_date(int attend_date) {
		this.attend_date = attend_date;
	}
	public String getString_attenddate() {
		return string_attenddate;
	}
	public void setString_attenddate(String string_attenddate) {
		this.string_attenddate = string_attenddate;
	}
	public String getAttend_note() {
		return attend_note;
	}
	public void setAttend_note(String attend_note) {
		this.attend_note = attend_note;
	}
	public int getS_c_idx() {
		return s_c_idx;
	}
	public void setS_c_idx(int s_c_idx) {
		this.s_c_idx = s_c_idx;
	}
	public int getA_a_idx() {
		return a_a_idx;
	}
	public void setA_a_idx(int a_a_idx) {
		this.a_a_idx = a_a_idx;
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
	public int getStu_birth() {
		return stu_birth;
	}
	public void setStu_birth(int stu_birth) {
		this.stu_birth = stu_birth;
	}
	public java.util.Date getStu_in_date() {
		return stu_in_date;
	}
	public void setStu_in_date(java.util.Date stu_in_date) {
		this.stu_in_date = stu_in_date;
	}
	public String getString_stuindate() {
		return string_stuindate;
	}
	public void setString_stuindate(String string_stuindate) {
		this.string_stuindate = string_stuindate;
	}
	public String getA_a_attendance() {
		return a_a_attendance;
	}
	public void setA_a_attendance(String a_a_attendance) {
		this.a_a_attendance = a_a_attendance;
	}
	public int getC_p_idx() {
		return c_p_idx;
	}
	public void setC_p_idx(int c_p_idx) {
		this.c_p_idx = c_p_idx;
	}
	public int getClub_idx() {
		return club_idx;
	}
	public void setClub_idx(int club_idx) {
		this.club_idx = club_idx;
	}
	public int getC_p_state() {
		return c_p_state;
	}
	public void setC_p_state(int c_p_state) {
		this.c_p_state = c_p_state;
	}
	public String getC_p_ex() {
		return c_p_ex;
	}
	public void setC_p_ex(String c_p_ex) {
		this.c_p_ex = c_p_ex;
	}
	public int getC_p_writedate() {
		return c_p_writedate;
	}
	public void setC_p_writedate(int c_p_writedate) {
		this.c_p_writedate = c_p_writedate;
	}
	public int getSubject_num() {
		return subject_num;
	}
	public void setSubject_num(int subject_num) {
		this.subject_num = subject_num;
	}
	public int getS_s_result() {
		return s_s_result;
	}
	public void setS_s_result(int s_s_result) {
		this.s_s_result = s_s_result;
	}
	public int getS_s_date() {
		return s_s_date;
	}
	public void setS_s_date(int s_s_date) {
		this.s_s_date = s_s_date;
	}
	public String getString_ssdate() {
		return string_ssdate;
	}
	public void setString_ssdate(String string_ssdate) {
		this.string_ssdate = string_ssdate;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public String getClass_subject() {
		return class_subject;
	}
	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}
	public List<CC_AttendDTO> getList() {
		return list;
	}
	public void setList(List<CC_AttendDTO> list) {
		this.list = list;
	}
	public CC_AttendDTO() {
		super();
	}
	public CC_AttendDTO(int rnum, String today, int class_idx, int stu_idx, int attend_date, String string_attenddate,
			String attend_note, int s_c_idx, int a_a_idx, String stu_id, String stu_name, int stu_birth,
			Date stu_in_date, String string_stuindate, String a_a_attendance, int c_p_idx, int club_idx, int c_p_state,
			String c_p_ex, int c_p_writedate, int subject_num, int s_s_result, int s_s_date, String string_ssdate,
			String subject_name, String class_num, String class_subject, List<CC_AttendDTO> list) {
		super();
		this.rnum = rnum;
		this.today = today;
		this.class_idx = class_idx;
		this.stu_idx = stu_idx;
		this.attend_date = attend_date;
		this.string_attenddate = string_attenddate;
		this.attend_note = attend_note;
		this.s_c_idx = s_c_idx;
		this.a_a_idx = a_a_idx;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_birth = stu_birth;
		this.stu_in_date = stu_in_date;
		this.string_stuindate = string_stuindate;
		this.a_a_attendance = a_a_attendance;
		this.c_p_idx = c_p_idx;
		this.club_idx = club_idx;
		this.c_p_state = c_p_state;
		this.c_p_ex = c_p_ex;
		this.c_p_writedate = c_p_writedate;
		this.subject_num = subject_num;
		this.s_s_result = s_s_result;
		this.s_s_date = s_s_date;
		this.string_ssdate = string_ssdate;
		this.subject_name = subject_name;
		this.class_num = class_num;
		this.class_subject = class_subject;
		this.list = list;
	}
	
	
	
}
