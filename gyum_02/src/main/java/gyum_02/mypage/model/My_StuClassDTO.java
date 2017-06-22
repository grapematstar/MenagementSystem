package gyum_02.mypage.model;


import java.util.*;

public class My_StuClassDTO {

	private int rnum;
	private int lpay_idx;
	private int stu_idx;
	private int class_idx;
	private int equip_idx;
	private int order_num;
	private int class_startdate;
	private int class_enddate;
	private int classroom;
	private String class_day;
	private String class_subject;
	private int test_idx;
	private int club_idx;
	private int c_t_testnum;
	private int subject_num;
	private int stu_id;
	
	private int c_t_q_idx;
	private int c_t_q_num;
	private String c_t_q_question;
	private int c_t_q_answer;
	private String c_t_q_explain;
	private int c_t_q_score;
	private int c_t_s_r_answer;
	private int c_t_s_r_correctness;
	private int c_t_s_r_writedate;
	
	private int c_t_q_o_num;
	private int c_t_q_o_option;
	private Date class_test_start_time;
	public My_StuClassDTO() {
		super();
	}
	public My_StuClassDTO(int rnum, int lpay_idx, int stu_idx, int class_idx, int equip_idx, int order_num,
			int class_startdate, int class_enddate, int classroom, String class_day, String class_subject, int test_idx,
			int club_idx, int c_t_testnum, int subject_num, int stu_id, int c_t_q_idx, int c_t_q_num,
			String c_t_q_question, int c_t_q_answer, String c_t_q_explain, int c_t_q_score, int c_t_s_r_answer,
			int c_t_s_r_correctness, int c_t_s_r_writedate, int c_t_q_o_num, int c_t_q_o_option,
			Date class_test_start_time) {
		super();
		this.rnum = rnum;
		this.lpay_idx = lpay_idx;
		this.stu_idx = stu_idx;
		this.class_idx = class_idx;
		this.equip_idx = equip_idx;
		this.order_num = order_num;
		this.class_startdate = class_startdate;
		this.class_enddate = class_enddate;
		this.classroom = classroom;
		this.class_day = class_day;
		this.class_subject = class_subject;
		this.test_idx = test_idx;
		this.club_idx = club_idx;
		this.c_t_testnum = c_t_testnum;
		this.subject_num = subject_num;
		this.stu_id = stu_id;
		this.c_t_q_idx = c_t_q_idx;
		this.c_t_q_num = c_t_q_num;
		this.c_t_q_question = c_t_q_question;
		this.c_t_q_answer = c_t_q_answer;
		this.c_t_q_explain = c_t_q_explain;
		this.c_t_q_score = c_t_q_score;
		this.c_t_s_r_answer = c_t_s_r_answer;
		this.c_t_s_r_correctness = c_t_s_r_correctness;
		this.c_t_s_r_writedate = c_t_s_r_writedate;
		this.c_t_q_o_num = c_t_q_o_num;
		this.c_t_q_o_option = c_t_q_o_option;
		this.class_test_start_time = class_test_start_time;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getLpay_idx() {
		return lpay_idx;
	}
	public void setLpay_idx(int lpay_idx) {
		this.lpay_idx = lpay_idx;
	}
	public int getStu_idx() {
		return stu_idx;
	}
	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public int getEquip_idx() {
		return equip_idx;
	}
	public void setEquip_idx(int equip_idx) {
		this.equip_idx = equip_idx;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
	public String getClass_subject() {
		return class_subject;
	}
	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}
	public int getTest_idx() {
		return test_idx;
	}
	public void setTest_idx(int test_idx) {
		this.test_idx = test_idx;
	}
	public int getClub_idx() {
		return club_idx;
	}
	public void setClub_idx(int club_idx) {
		this.club_idx = club_idx;
	}
	public int getC_t_testnum() {
		return c_t_testnum;
	}
	public void setC_t_testnum(int c_t_testnum) {
		this.c_t_testnum = c_t_testnum;
	}
	public int getSubject_num() {
		return subject_num;
	}
	public void setSubject_num(int subject_num) {
		this.subject_num = subject_num;
	}
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public int getC_t_q_idx() {
		return c_t_q_idx;
	}
	public void setC_t_q_idx(int c_t_q_idx) {
		this.c_t_q_idx = c_t_q_idx;
	}
	public int getC_t_q_num() {
		return c_t_q_num;
	}
	public void setC_t_q_num(int c_t_q_num) {
		this.c_t_q_num = c_t_q_num;
	}
	public String getC_t_q_question() {
		return c_t_q_question;
	}
	public void setC_t_q_question(String c_t_q_question) {
		this.c_t_q_question = c_t_q_question;
	}
	public int getC_t_q_answer() {
		return c_t_q_answer;
	}
	public void setC_t_q_answer(int c_t_q_answer) {
		this.c_t_q_answer = c_t_q_answer;
	}
	public String getC_t_q_explain() {
		return c_t_q_explain;
	}
	public void setC_t_q_explain(String c_t_q_explain) {
		this.c_t_q_explain = c_t_q_explain;
	}
	public int getC_t_q_score() {
		return c_t_q_score;
	}
	public void setC_t_q_score(int c_t_q_score) {
		this.c_t_q_score = c_t_q_score;
	}
	public int getC_t_s_r_answer() {
		return c_t_s_r_answer;
	}
	public void setC_t_s_r_answer(int c_t_s_r_answer) {
		this.c_t_s_r_answer = c_t_s_r_answer;
	}
	public int getC_t_s_r_correctness() {
		return c_t_s_r_correctness;
	}
	public void setC_t_s_r_correctness(int c_t_s_r_correctness) {
		this.c_t_s_r_correctness = c_t_s_r_correctness;
	}
	public int getC_t_s_r_writedate() {
		return c_t_s_r_writedate;
	}
	public void setC_t_s_r_writedate(int c_t_s_r_writedate) {
		this.c_t_s_r_writedate = c_t_s_r_writedate;
	}
	public int getC_t_q_o_num() {
		return c_t_q_o_num;
	}
	public void setC_t_q_o_num(int c_t_q_o_num) {
		this.c_t_q_o_num = c_t_q_o_num;
	}
	public int getC_t_q_o_option() {
		return c_t_q_o_option;
	}
	public void setC_t_q_o_option(int c_t_q_o_option) {
		this.c_t_q_o_option = c_t_q_o_option;
	}
	public Date getClass_test_start_time() {
		return class_test_start_time;
	}
	public void setClass_test_start_time(Date class_test_start_time) {
		this.class_test_start_time = class_test_start_time;
	}
	
}
