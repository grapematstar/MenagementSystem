package gyum_02.my_student.model;

public class my_stu_ClassStudentDTO {
	
	private int class_idx;
	private int stu_idx;
	
	public my_stu_ClassStudentDTO() {
		// TODO Auto-generated constructor stub
	}

	public my_stu_ClassStudentDTO(int class_idx, int stu_idx) {
		super();
		this.class_idx = class_idx;
		this.stu_idx = stu_idx;
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
	
	
}
