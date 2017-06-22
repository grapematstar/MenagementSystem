package gyum_02.sugang.model;

import java.sql.Date;

public class SgPaymentDTO {

	private int lpay_idx; // 수강결제idx
	private int stu_idx; // 학생idx
	private int class_idx; // 강의idx
	private int equip_idx; // 품목idx
	private int order_num; // 품목수량
	private int subject_num; //과목 번호
	private int class_startdate; //강의 시작일
	private int class_enddate; // 강의 종료일
	private int classroom; // 강의실
	private String class_day; // 강의 날짜
	private int class_time; // 강의 시간
	private String class_subject; // 강의 제목
	private String tea_name; // 강사 이름
	private int class_price; // 수강료
	private int class_max_student; // 수강인원수
	private Date lpay_date; // 결제일
	private int payment; //환불료
	
	public SgPaymentDTO() {
		super();
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

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public Date getLpay_date() {
		return lpay_date;
	}

	public void setLpay_date(Date lpay_date) {
		this.lpay_date = lpay_date;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}
	
	
}
