package gyum_02.member.model;

import java.sql.Date;

public class StudentMemberDTO {

	private int idx;
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String email;
	private Date in_date;
	private Date out_date;
	private String school;
	
	public StudentMemberDTO() {
		super();
	}

	public StudentMemberDTO(int idx, String id, String pwd, String name, String tel, String email, Date in_date,
			Date out_date, String school) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.in_date = in_date;
		this.out_date = out_date;
		this.school = school;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getIn_date() {
		return in_date;
	}

	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}

	public Date getOut_date() {
		return out_date;
	}

	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}
	
	
}
