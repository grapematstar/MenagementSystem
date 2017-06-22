package gyum_02.study.model;

public class fileuploadDTO {
	private int s_f_idx;	
	private int study_idx;
	private int s_f_filebbssunbun;
	private String s_f_filepath;
	private String s_f_filename;
	
	public fileuploadDTO() {
		super();
	}
	public fileuploadDTO(int s_f_idx, int study_idx, int s_f_filebbssunbun, String s_f_filepath, String s_f_filename) {
		super();
		this.s_f_idx = s_f_idx;
		this.study_idx = study_idx;
		this.s_f_filebbssunbun = s_f_filebbssunbun;
		this.s_f_filepath = s_f_filepath;
		this.s_f_filename = s_f_filename;
	}
	public int getS_f_idx() {
		return s_f_idx;
	}
	public void setS_f_idx(int s_f_idx) {
		this.s_f_idx = s_f_idx;
	}
	public int getStudy_idx() {
		return study_idx;
	}
	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
	}
	public int getS_f_filebbssunbun() {
		return s_f_filebbssunbun;
	}
	public void setS_f_filebbssunbun(int s_f_filebbssunbun) {
		this.s_f_filebbssunbun = s_f_filebbssunbun;
	}
	public String getS_f_filepath() {
		return s_f_filepath;
	}
	public void setS_f_filepath(String s_f_filepath) {
		this.s_f_filepath = s_f_filepath;
	}
	public String getS_f_filename() {
		return s_f_filename;
	}
	public void setS_f_filename(String s_f_filename) {
		this.s_f_filename = s_f_filename;
	}
	
	
	
}
