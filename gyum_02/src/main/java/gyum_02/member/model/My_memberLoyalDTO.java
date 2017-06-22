package gyum_02.member.model;

public class My_memberLoyalDTO {

	private int mas_idx;
	private String mas_id;
	private String msa_pwd;
	private String mas_name;
	private String mas_tel;
	private String mas_email;
	private String mas_level;
	public My_memberLoyalDTO() {
		super();
	}
	public My_memberLoyalDTO(int mas_idx, String mas_id, String msa_pwd, String mas_name, String mas_tel,
			String mas_email, String mas_level) {
		super();
		this.mas_idx = mas_idx;
		this.mas_id = mas_id;
		this.msa_pwd = msa_pwd;
		this.mas_name = mas_name;
		this.mas_tel = mas_tel;
		this.mas_email = mas_email;
		this.mas_level = mas_level;
	}
	public int getMas_idx() {
		return mas_idx;
	}
	public void setMas_idx(int mas_idx) {
		this.mas_idx = mas_idx;
	}
	public String getMas_id() {
		return mas_id;
	}
	public void setMas_id(String mas_id) {
		this.mas_id = mas_id;
	}
	public String getMsa_pwd() {
		return msa_pwd;
	}
	public void setMsa_pwd(String msa_pwd) {
		this.msa_pwd = msa_pwd;
	}
	public String getMas_name() {
		return mas_name;
	}
	public void setMas_name(String mas_name) {
		this.mas_name = mas_name;
	}
	public String getMas_tel() {
		return mas_tel;
	}
	public void setMas_tel(String mas_tel) {
		this.mas_tel = mas_tel;
	}
	public String getMas_email() {
		return mas_email;
	}
	public void setMas_email(String mas_email) {
		this.mas_email = mas_email;
	}
	public String getMas_level() {
		return mas_level;
	}
	public void setMas_level(String mas_level) {
		this.mas_level = mas_level;
	}
	
	
}
