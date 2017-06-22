package gyum_02.study.model;
import java.sql.*;

public class filebbsDTO {
	private int study_filebbsidx;
	private int study_idx;
	private String stu_id;
	private String stu_name;
	private String study_filebbssubject;
	private String study_filebbscontent;
	private int study_filebbslev;
	private int study_filebbssunbun;
	private int study_filebbsreply_sunbun;
	private int study_filesitu;
	private Date study_filebbswritedate;
	
	public filebbsDTO(int study_filebbsidx, int study_idx,String stu_id, String stu_name,
			String study_filebbssubject, String study_filebbscontent, int study_filebbslev, int study_filebbssunbun,
			int study_filebbsreply_sunbun, int study_filesitu, Date study_filebbswritedate) {
		super();
		this.study_filebbsidx = study_filebbsidx;
		this.study_idx = study_idx;
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.study_filebbssubject = study_filebbssubject;
		this.study_filebbscontent = study_filebbscontent;
		this.study_filebbslev = study_filebbslev;
		this.study_filebbssunbun = study_filebbssunbun;
		this.study_filebbsreply_sunbun = study_filebbsreply_sunbun;
		this.study_filesitu = study_filesitu;
		this.study_filebbswritedate = study_filebbswritedate;
	}
	public filebbsDTO() {
		super();
	}
	public int getStudy_filebbsidx() {
		return study_filebbsidx;
	}
	public void setStudy_filebbsidx(int study_filebbsidx) {
		this.study_filebbsidx = study_filebbsidx;
	}
	public int getStudy_idx() {
		return study_idx;
	}
	public void setStudy_idx(int study_idx) {
		this.study_idx = study_idx;
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
	public String getStudy_filebbssubject() {
		return study_filebbssubject;
	}
	public void setStudy_filebbssubject(String study_filebbssubject) {
		this.study_filebbssubject = study_filebbssubject;
	}
	public String getStudy_filebbscontent() {
		return study_filebbscontent;
	}
	public void setStudy_filebbscontent(String study_filebbscontent) {
		this.study_filebbscontent = study_filebbscontent;
	}
	public int getStudy_filebbslev() {
		return study_filebbslev;
	}
	public void setStudy_filebbslev(int study_filebbslev) {
		this.study_filebbslev = study_filebbslev;
	}
	public int getStudy_filebbssunbun() {
		return study_filebbssunbun;
	}
	public void setStudy_filebbssunbun(int study_filebbssunbun) {
		this.study_filebbssunbun = study_filebbssunbun;
	}
	public int getStudy_filebbsreply_sunbun() {
		return study_filebbsreply_sunbun;
	}
	public void setStudy_filebbsreply_sunbun(int study_filebbsreply_sunbun) {
		this.study_filebbsreply_sunbun = study_filebbsreply_sunbun;
	}
	public int getStudy_filesitu() {
		return study_filesitu;
	}
	public void setStudy_filesitu(int study_filesitu) {
		this.study_filesitu = study_filesitu;
	}
	public Date getStudy_filebbswritedate() {
		return study_filebbswritedate;
	}
	public void setStudy_filebbswritedate(Date study_filebbswritedate) {
		this.study_filebbswritedate = study_filebbswritedate;
	}
	
	
}
