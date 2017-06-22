package gyum_02.my_student.model;

public class my_stu_TimetableDTO {
	
	private int stu_idx;
	private int class_idx;
	
	public my_stu_TimetableDTO() {
		// TODO Auto-generated constructor stub
	}

	public my_stu_TimetableDTO(int stu_idx, int class_idx) {
		super();
		this.stu_idx = stu_idx;
		this.class_idx = class_idx;
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
}
