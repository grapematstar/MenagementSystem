package gyum_02.masterpage.model;

public class Class_studentDTO {
	private int class_idx;
	private int stu_idx;
	
	public Class_studentDTO(int class_idx, int stu_idx) {
		super();
		this.class_idx = class_idx;
		this.stu_idx = stu_idx;
	}
	public Class_studentDTO() {
		super();
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
