package gyum_02.study.model;

public class infoStudyDTO {
	private int stu_idx;
	private String stu_id;
	private String stu_name;
	private int study_info_alltime;
	private int study_info_deportnum;//Ãß¹æ
	private int study_info_playing;
	private int study_info_comple;
	public infoStudyDTO() {
		super();
	}
	public infoStudyDTO(int stu_idx, String stu_id, String stu_name, int study_info_alltime, int study_info_deportnum,
			int study_info_playing, int study_info_comple) {
		super();
		this.stu_idx = stu_idx;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.study_info_alltime = study_info_alltime;
		this.study_info_deportnum = study_info_deportnum;
		this.study_info_playing = study_info_playing;
		this.study_info_comple = study_info_comple;
	}
	public int getStu_idx() {
		return stu_idx;
	}
	public void setStu_idx(int stu_idx) {
		this.stu_idx = stu_idx;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public int getStudy_info_alltime() {
		return study_info_alltime;
	}
	public void setStudy_info_alltime(int study_info_alltime) {
		this.study_info_alltime = study_info_alltime;
	}
	public int getStudy_info_deportnum() {
		return study_info_deportnum;
	}
	public void setStudy_info_deportnum(int study_info_deportnum) {
		this.study_info_deportnum = study_info_deportnum;
	}
	public int getStudy_info_playing() {
		return study_info_playing;
	}
	public void setStudy_info_playing(int study_info_playing) {
		this.study_info_playing = study_info_playing;
	}
	public int getStudy_info_comple() {
		return study_info_comple;
	}
	public void setStudy_info_comple(int study_info_comple) {
		this.study_info_comple = study_info_comple;
	}
	
	
	
	
	
}
