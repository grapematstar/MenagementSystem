package gyum_02.my_student.model;

public class my_stu_ClassEvalDTO {
	private int c_e_q_idx;
	private String c_e_q_question;
	
	public my_stu_ClassEvalDTO() {
		super();
	}

	public my_stu_ClassEvalDTO(int c_e_q_idx, String c_e_q_question) {
		super();
		this.c_e_q_idx = c_e_q_idx;
		this.c_e_q_question = c_e_q_question;
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
	
}
