package gyum_02.mypage.model;

public class My_ClassTestDTO {

	private int test_idx;
	private int class_idx;
	private int club_idx;
	private int c_t_testnum;
	
	private String class_subject;
	private int classroom;
	
	private int c_t_q_idx;
	private int c_t_q_num;
	private String c_t_q_question;
	private int c_t_q_answer;
	private String c_t_q_explain;
	private int c_t_q_score;
	
	private int c_t_q_o_num;
	private String c_t_q_o_option;
	private int c_t_q_o_correctness;
	public My_ClassTestDTO() {
		super();
	}
	public My_ClassTestDTO(int test_idx, int class_idx, int club_idx, int c_t_testnum, String class_subject,
			int classroom, int c_t_q_idx, int c_t_q_num, String c_t_q_question, int c_t_q_answer, String c_t_q_explain,
			int c_t_q_score, int c_t_q_o_num, String c_t_q_o_option, int c_t_q_o_correctness) {
		super();
		this.test_idx = test_idx;
		this.class_idx = class_idx;
		this.club_idx = club_idx;
		this.c_t_testnum = c_t_testnum;
		this.class_subject = class_subject;
		this.classroom = classroom;
		this.c_t_q_idx = c_t_q_idx;
		this.c_t_q_num = c_t_q_num;
		this.c_t_q_question = c_t_q_question;
		this.c_t_q_answer = c_t_q_answer;
		this.c_t_q_explain = c_t_q_explain;
		this.c_t_q_score = c_t_q_score;
		this.c_t_q_o_num = c_t_q_o_num;
		this.c_t_q_o_option = c_t_q_o_option;
		this.c_t_q_o_correctness = c_t_q_o_correctness;
	}
	public int getTest_idx() {
		return test_idx;
	}
	public void setTest_idx(int test_idx) {
		this.test_idx = test_idx;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
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
	public String getClass_subject() {
		return class_subject;
	}
	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}
	public int getClassroom() {
		return classroom;
	}
	public void setClassroom(int classroom) {
		this.classroom = classroom;
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
	public int getC_t_q_o_num() {
		return c_t_q_o_num;
	}
	public void setC_t_q_o_num(int c_t_q_o_num) {
		this.c_t_q_o_num = c_t_q_o_num;
	}
	public String getC_t_q_o_option() {
		return c_t_q_o_option;
	}
	public void setC_t_q_o_option(String c_t_q_o_option) {
		this.c_t_q_o_option = c_t_q_o_option;
	}
	public int getC_t_q_o_correctness() {
		return c_t_q_o_correctness;
	}
	public void setC_t_q_o_correctness(int c_t_q_o_correctness) {
		this.c_t_q_o_correctness = c_t_q_o_correctness;
	}
	
}
