package gyum_02.member.model;

import java.util.Date;

public class My_memberStuTeaDTO {

	private Date stu_in_date;
	private Date stu_out_date;
	private Date tea_in_date;
	private Date tea_out_date;
	public My_memberStuTeaDTO() {
		super();
	}
	public My_memberStuTeaDTO(Date stu_in_date, Date stu_out_date, Date tea_in_date, Date tea_out_date) {
		super();
		this.stu_in_date = stu_in_date;
		this.stu_out_date = stu_out_date;
		this.tea_in_date = tea_in_date;
		this.tea_out_date = tea_out_date;
	}
	public Date getStu_in_date() {
		return stu_in_date;
	}
	public void setStu_in_date(Date stu_in_date) {
		this.stu_in_date = stu_in_date;
	}
	public Date getStu_out_date() {
		return stu_out_date;
	}
	public void setStu_out_date(Date stu_out_date) {
		this.stu_out_date = stu_out_date;
	}
	public Date getTea_in_date() {
		return tea_in_date;
	}
	public void setTea_in_date(Date tea_in_date) {
		this.tea_in_date = tea_in_date;
	}
	public Date getTea_out_date() {
		return tea_out_date;
	}
	public void setTea_out_date(Date tea_out_date) {
		this.tea_out_date = tea_out_date;
	}
	
}
