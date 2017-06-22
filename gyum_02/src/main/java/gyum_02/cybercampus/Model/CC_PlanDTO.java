package gyum_02.cybercampus.Model;

public class CC_PlanDTO {
	private int c_plan_idx;
	private int c_i_p_idx;
	private int c_plan_unit;
	private String c_plan_content;
	public CC_PlanDTO() {
		super();
	}
	public CC_PlanDTO(int c_plan_idx, int c_i_p_idx, int c_plan_unit, String c_plan_content) {
		super();
		this.c_plan_idx = c_plan_idx;
		this.c_i_p_idx = c_i_p_idx;
		this.c_plan_unit = c_plan_unit;
		this.c_plan_content = c_plan_content;
	}
	public int getC_plan_idx() {
		return c_plan_idx;
	}
	public void setC_plan_idx(int c_plan_idx) {
		this.c_plan_idx = c_plan_idx;
	}
	public int getC_i_p_idx() {
		return c_i_p_idx;
	}
	public void setC_i_p_idx(int c_i_p_idx) {
		this.c_i_p_idx = c_i_p_idx;
	}
	public int getC_plan_unit() {
		return c_plan_unit;
	}
	public void setC_plan_unit(int c_plan_unit) {
		this.c_plan_unit = c_plan_unit;
	}
	public String getC_plan_content() {
		return c_plan_content;
	}
	public void setC_plan_content(String c_plan_content) {
		this.c_plan_content = c_plan_content;
	}
}
