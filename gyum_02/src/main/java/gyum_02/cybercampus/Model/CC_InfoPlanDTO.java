package gyum_02.cybercampus.Model;

public class CC_InfoPlanDTO {
	private int c_i_p_idx;
	private int club_idx;
	private int tea_idx;
	private int subject_num;
	private int c_i_p_startdate;
	private int c_i_p_enddate;
	private String c_i_p_purpose;
	private String c_i_p_overview;
	private int c_i_p_writedate;
	private String class_num;
	private int class_startdate;
	private int class_enddate;
	private String tea_name;
	public CC_InfoPlanDTO(int c_i_p_idx, int club_idx, int tea_idx, int subject_num, int c_i_p_startdate,
			int c_i_p_enddate, String c_i_p_purpose, String c_i_p_overview, int c_i_p_writedate, String class_num,
			int class_startdate, int class_enddate, String tea_name) {
		super();
		this.c_i_p_idx = c_i_p_idx;
		this.club_idx = club_idx;
		this.tea_idx = tea_idx;
		this.subject_num = subject_num;
		this.c_i_p_startdate = c_i_p_startdate;
		this.c_i_p_enddate = c_i_p_enddate;
		this.c_i_p_purpose = c_i_p_purpose;
		this.c_i_p_overview = c_i_p_overview;
		this.c_i_p_writedate = c_i_p_writedate;
		this.class_num = class_num;
		this.class_startdate = class_startdate;
		this.class_enddate = class_enddate;
		this.tea_name = tea_name;
	}
	public CC_InfoPlanDTO() {
		super();
	}
	public int getC_i_p_idx() {
		return c_i_p_idx;
	}
	public void setC_i_p_idx(int c_i_p_idx) {
		this.c_i_p_idx = c_i_p_idx;
	}
	public int getClub_idx() {
		return club_idx;
	}
	public void setClub_idx(int club_idx) {
		this.club_idx = club_idx;
	}
	public int getTea_idx() {
		return tea_idx;
	}
	public void setTea_idx(int tea_idx) {
		this.tea_idx = tea_idx;
	}
	public int getSubject_num() {
		return subject_num;
	}
	public void setSubject_num(int subject_num) {
		this.subject_num = subject_num;
	}
	public int getC_i_p_startdate() {
		return c_i_p_startdate;
	}
	public void setC_i_p_startdate(int c_i_p_startdate) {
		this.c_i_p_startdate = c_i_p_startdate;
	}
	public int getC_i_p_enddate() {
		return c_i_p_enddate;
	}
	public void setC_i_p_enddate(int c_i_p_enddate) {
		this.c_i_p_enddate = c_i_p_enddate;
	}
	public String getC_i_p_purpose() {
		return c_i_p_purpose;
	}
	public void setC_i_p_purpose(String c_i_p_purpose) {
		this.c_i_p_purpose = c_i_p_purpose;
	}
	public String getC_i_p_overview() {
		return c_i_p_overview;
	}
	public void setC_i_p_overview(String c_i_p_overview) {
		this.c_i_p_overview = c_i_p_overview;
	}
	public int getC_i_p_writedate() {
		return c_i_p_writedate;
	}
	public void setC_i_p_writedate(int c_i_p_writedate) {
		this.c_i_p_writedate = c_i_p_writedate;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public int getClass_startdate() {
		return class_startdate;
	}
	public void setClass_startdate(int class_startdate) {
		this.class_startdate = class_startdate;
	}
	public int getClass_enddate() {
		return class_enddate;
	}
	public void setClass_enddate(int class_enddate) {
		this.class_enddate = class_enddate;
	}
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
}
