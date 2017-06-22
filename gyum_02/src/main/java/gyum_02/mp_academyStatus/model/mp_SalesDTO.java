package gyum_02.mp_academyStatus.model;

import java.util.*;

public class mp_SalesDTO {
	private int i_e_idx;
	private Date i_e_date;
	private Date i_e_r_date;
	private int i_e_money;
	private int mas_idx;
	private String i_e_in_out;
	private String i_e_content;
	
	public mp_SalesDTO() {
		super();
	}

	public mp_SalesDTO(int i_e_idx, Date i_e_date, Date i_e_r_date, int i_e_money, int mas_idx, String i_e_in_out,
			String i_e_content) {
		super();
		this.i_e_idx = i_e_idx;
		this.i_e_date = i_e_date;
		this.i_e_r_date = i_e_r_date;
		this.i_e_money = i_e_money;
		this.mas_idx = mas_idx;
		this.i_e_in_out = i_e_in_out;
		this.i_e_content = i_e_content;
	}

	public int getI_e_idx() {
		return i_e_idx;
	}

	public void setI_e_idx(int i_e_idx) {
		this.i_e_idx = i_e_idx;
	}

	public Date getI_e_date() {
		return i_e_date;
	}

	public void setI_e_date(Date i_e_date) {
		this.i_e_date = i_e_date;
	}

	public Date getI_e_r_date() {
		return i_e_r_date;
	}

	public void setI_e_r_date(Date i_e_r_date) {
		this.i_e_r_date = i_e_r_date;
	}

	public int getI_e_money() {
		return i_e_money;
	}

	public void setI_e_money(int i_e_money) {
		this.i_e_money = i_e_money;
	}

	public int getMas_idx() {
		return mas_idx;
	}

	public void setMas_idx(int mas_idx) {
		this.mas_idx = mas_idx;
	}

	public String getI_e_in_out() {
		return i_e_in_out;
	}

	public void setI_e_in_out(String i_e_in_out) {
		this.i_e_in_out = i_e_in_out;
	}

	public String getI_e_content() {
		return i_e_content;
	}

	public void setI_e_content(String i_e_content) {
		this.i_e_content = i_e_content;
	}
	
}
