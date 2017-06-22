package gyum_02.my_student.model;

import java.sql.Date;

public class my_stu_ClassEvalAnswerDTO {
	private int class_idx;
	private int tea_idx;
	private int stu_idx;
	private int c_e_a1;
	private int c_e_a2;
	private int c_e_a3;
	private int c_e_a4;
	private int c_e_a5;
	private String c_e_note;
	private int c_e_fix;
	private java.sql.Date c_e_writedate;
	
	public my_stu_ClassEvalAnswerDTO() {
		super();
	}

	public my_stu_ClassEvalAnswerDTO(int class_idx, int tea_idx, int stu_idx, int c_e_a1, int c_e_a2, int c_e_a3,
			int c_e_a4, int c_e_a5, String c_e_note, int c_e_fix, Date c_e_writedate) {
		super();
		this.class_idx = class_idx;
		this.tea_idx = tea_idx;
		this.stu_idx = stu_idx;
		this.c_e_a1 = c_e_a1;
		this.c_e_a2 = c_e_a2;
		this.c_e_a3 = c_e_a3;
		this.c_e_a4 = c_e_a4;
		this.c_e_a5 = c_e_a5;
		this.c_e_note = c_e_note;
		this.c_e_fix = c_e_fix;
		this.c_e_writedate = c_e_writedate;
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

	public int getStu_idx() {
		return stu_idx;
	}

	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}

	public int getC_e_a1() {
		return c_e_a1;
	}

	public void setC_e_a1(int c_e_a1) {
		this.c_e_a1 = c_e_a1;
	}

	public int getC_e_a2() {
		return c_e_a2;
	}

	public void setC_e_a2(int c_e_a2) {
		this.c_e_a2 = c_e_a2;
	}

	public int getC_e_a3() {
		return c_e_a3;
	}

	public void setC_e_a3(int c_e_a3) {
		this.c_e_a3 = c_e_a3;
	}

	public int getC_e_a4() {
		return c_e_a4;
	}

	public void setC_e_a4(int c_e_a4) {
		this.c_e_a4 = c_e_a4;
	}

	public int getC_e_a5() {
		return c_e_a5;
	}

	public void setC_e_a5(int c_e_a5) {
		this.c_e_a5 = c_e_a5;
	}

	public String getC_e_note() {
		return c_e_note;
	}

	public void setC_e_note(String c_e_note) {
		this.c_e_note = c_e_note;
	}

	public int getC_e_fix() {
		return c_e_fix;
	}

	public void setC_e_fix(int c_e_fix) {
		this.c_e_fix = c_e_fix;
	}

	public java.sql.Date getC_e_writedate() {
		return c_e_writedate;
	}

	public void setC_e_writedate(java.sql.Date c_e_writedate) {
		this.c_e_writedate = c_e_writedate;
	}
	
}
