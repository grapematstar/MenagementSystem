package gyum_02.mypage.model;

public class My_ClassCheckDTO {

	private int class_idx;
	private int class_check;
	public My_ClassCheckDTO() {
		super();
	}
	public My_ClassCheckDTO(int class_idx, int class_check) {
		super();
		this.class_idx = class_idx;
		this.class_check = class_check;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public int getClass_check() {
		return class_check;
	}
	public void setClass_check(int class_check) {
		this.class_check = class_check;
	}
	
}
