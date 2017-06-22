package gyum_02.masterpage.model._____;

import java.util.*;

public class mp_EvalDTO {
	
	public int stu_idx;
	public int class_idx;
	public int tea_idx;
	public String stu_name;
	public String tea_name;
	public String class_subject;
	public Date c_e_writedate;
	public String c_e_note;
	
	public int c_e_a1;
	public int c_e_a2;
	public int c_e_a3;
	public int c_e_a4;
	public int c_e_a5;
	
	public int c_e_q_idx;
	public String c_e_q_question;
	public float c_e_a1_avg;
	public float c_e_a2_avg;
	public float c_e_a3_avg;
	public float c_e_a4_avg;
	public float c_e_a5_avg;
	
	public float eval_avg;
	
	public Date min_c_e_writedate;
	public Date max_c_e_writedate;
	public int stu_on_eval;
	public int stu_total;
	
	public mp_EvalDTO() {
		super();
	}
	
	public mp_EvalDTO(int class_idx, int tea_idx, String tea_name, String class_subject, float eval_avg,
			Date min_c_e_writedate, Date max_c_e_writedate, int stu_on_eval, int stu_total) {
		super();
		this.class_idx = class_idx;
		this.tea_idx = tea_idx;
		this.tea_name = tea_name;
		this.class_subject = class_subject;
		this.eval_avg = eval_avg;
		this.min_c_e_writedate = min_c_e_writedate;
		this.max_c_e_writedate = max_c_e_writedate;
		this.stu_on_eval = stu_on_eval;
		this.stu_total = stu_total;
	}

	public mp_EvalDTO(int stu_idx, int class_idx, int tea_idx, float eval_avg, String stu_name, String tea_name,
			String class_subject, Date c_e_writedate, String c_e_note) {
		super();
		this.stu_idx = stu_idx;
		this.class_idx = class_idx;
		this.tea_idx = tea_idx;
		this.eval_avg = eval_avg;
		this.stu_name = stu_name;
		this.tea_name = tea_name;
		this.class_subject = class_subject;
		this.c_e_writedate = c_e_writedate;
		this.c_e_note = c_e_note;
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

	public mp_EvalDTO(int c_e_q_idx, String c_e_q_question) {
		super();
		this.c_e_q_idx = c_e_q_idx;
		this.c_e_q_question = c_e_q_question;
	}
	
	public int getStu_on_eval() {
		return stu_on_eval;
	}

	public void setStu_on_eval(int stu_on_eval) {
		this.stu_on_eval = stu_on_eval;
	}

	public int getStu_total() {
		return stu_total;
	}

	public void setStu_total(int stu_total) {
		this.stu_total = stu_total;
	}

	public Date getMin_c_e_writedate() {
		return min_c_e_writedate;
	}

	public void setMin_c_e_writedate(Date min_c_e_writedate) {
		this.min_c_e_writedate = min_c_e_writedate;
	}

	public Date getMax_c_e_writedate() {
		return max_c_e_writedate;
	}

	public void setMax_c_e_writedate(Date max_c_e_writedate) {
		this.max_c_e_writedate = max_c_e_writedate;
	}

	public float getC_e_a1_avg() {
		return c_e_a1_avg;
	}

	public void setC_e_a1_avg(float c_e_a1_avg) {
		this.c_e_a1_avg = c_e_a1_avg;
	}

	public float getC_e_a2_avg() {
		return c_e_a2_avg;
	}

	public void setC_e_a2_avg(float c_e_a2_avg) {
		this.c_e_a2_avg = c_e_a2_avg;
	}

	public float getC_e_a3_avg() {
		return c_e_a3_avg;
	}

	public void setC_e_a3_avg(float c_e_a3_avg) {
		this.c_e_a3_avg = c_e_a3_avg;
	}

	public float getC_e_a4_avg() {
		return c_e_a4_avg;
	}

	public void setC_e_a4_avg(float c_e_a4_avg) {
		this.c_e_a4_avg = c_e_a4_avg;
	}

	public float getC_e_a5_avg() {
		return c_e_a5_avg;
	}

	public void setC_e_a5_avg(float c_e_a5_avg) {
		this.c_e_a5_avg = c_e_a5_avg;
	}

	public int getC_e_q_idx() {
		return c_e_q_idx;
	}

	public void setC_e_q_idx(int c_e_q_idx) {
		this.c_e_q_idx = c_e_q_idx;
	}

	public String getC_e_q_question() {
		return c_e_q_question;
	}

	public void setC_e_q_question(String c_e_q_question) {
		this.c_e_q_question = c_e_q_question;
	}

	public String getC_e_note() {
		return c_e_note;
	}

	public void setC_e_note(String c_e_note) {
		this.c_e_note = c_e_note;
	}

	public Date getC_e_writedate() {
		return c_e_writedate;
	}

	public void setC_e_writedate(Date c_e_writedate) {
		this.c_e_writedate = c_e_writedate;
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
	public int getTea_idx() {
		return tea_idx;
	}
	public void setTea_idx(int tea_idx) {
		this.tea_idx = tea_idx;
	}
	public float getEval_avg() {
		return eval_avg;
	}
	public void setEval_avg(float eval_avg) {
		this.eval_avg = eval_avg;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
	public String getClass_subject() {
		return class_subject;
	}
	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}
	
	
}
