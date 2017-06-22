package gyum_02.masterpage.model;

import java.util.*;

public class C_s_c_idxDTO {
	private List<Class_studentDTO> class_idx;
	private int stu_idx;
	
	public List<Class_studentDTO> getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(List<Class_studentDTO> class_idx) {
		this.class_idx = class_idx;
	}
	public int getStu_idx() {
		return stu_idx;
	}
	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}
	public C_s_c_idxDTO(List<Class_studentDTO> class_idx, int stu_idx) {
		super();
		this.class_idx = class_idx;
		this.stu_idx = stu_idx;
	}
	public C_s_c_idxDTO() {
		super();
	}
	
	
	
	
	
	
}
