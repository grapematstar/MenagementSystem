package gyum_02.masterpage.model;

import java.sql.Date;

public class ParentDTO {
	private int par_idx;
	private String par_id;
	private String par_pwd;
	private int pwd_q_idx;
	private String par_pwd_a;
	private String par_name;
	private String par_tel;
	private String par_email;
	private Date par_in_date;
	
	public ParentDTO() {
		super();
	}
	
	public ParentDTO(int par_idx, String par_id, String par_pwd, int pwd_q_idx, String par_pwd_a, String par_name,
			String par_tel, String par_email, Date par_in_date) {
		super();
		this.par_idx = par_idx;
		this.par_id = par_id;
		this.par_pwd = par_pwd;
		this.pwd_q_idx = pwd_q_idx;
		this.par_pwd_a = par_pwd_a;
		this.par_name = par_name;
		this.par_tel = par_tel;
		this.par_email = par_email;
		this.par_in_date = par_in_date;
	}
	
	public Date getPar_in_date() {
		return par_in_date;
	}
	public void setPar_in_date(Date par_in_date) {
		this.par_in_date = par_in_date;
	}
	public int getPar_idx() {
		return par_idx;
	}
	public void setPar_idx(int par_idx) {
		this.par_idx = par_idx;
	}
	public String getPar_id() {
		return par_id;
	}
	public void setPar_id(String par_id) {
		this.par_id = par_id;
	}
	public String getPar_pwd() {
		return par_pwd;
	}
	public void setPar_pwd(String par_pwd) {
		this.par_pwd = par_pwd;
	}
	public int getPwd_q_idx() {
		return pwd_q_idx;
	}
	public void setPwd_q_idx(int pwd_q_idx) {
		this.pwd_q_idx = pwd_q_idx;
	}
	public String getPar_pwd_a() {
		return par_pwd_a;
	}
	public void setPar_pwd_a(String par_pwd_a) {
		this.par_pwd_a = par_pwd_a;
	}
	public String getPar_name() {
		return par_name;
	}
	public void setPar_name(String par_name) {
		this.par_name = par_name;
	}
	public String getPar_tel() {
		return par_tel;
	}
	public void setPar_tel(String par_tel) {
		this.par_tel = par_tel;
	}
	public String getPar_email() {
		return par_email;
	}
	public void setPar_email(String par_email) {
		this.par_email = par_email;
	}
	
}
