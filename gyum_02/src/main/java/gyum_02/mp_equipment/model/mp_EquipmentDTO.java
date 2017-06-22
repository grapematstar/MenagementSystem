package gyum_02.mp_equipment.model;

import java.util.*;

public class mp_EquipmentDTO {

	private int e_s_idx;
	private int equip_idx;
	private String equip_code;
	private String equip_name;
	private String equip_s_size;
	private int equip_first_num;
	private int equip_last_num;
	private int equip_firstdate;
	private int equip_lastdate;
	
	private String e_s_in_out;
	private int e_s_in_out_num;
	private Date e_s_modi_date;
	
	
	public mp_EquipmentDTO() {
		super();
	}
	
	/**
	 * mp_equipment_status.jsp
	 * 비품 현황
	 * */
	public mp_EquipmentDTO(int equip_idx, String equip_code, String equip_name, String equip_s_size, int equip_first_num, int equip_last_num,
			int equip_firstdate) {
		super();
		this.equip_idx = equip_idx;
		this.equip_code = equip_code;
		this.equip_name = equip_name;
		this.equip_s_size = equip_s_size;
		this.equip_first_num = equip_first_num;
		this.equip_last_num = equip_last_num;
		this.equip_firstdate = equip_firstdate;
	}
	
	/**
	 * mp_equipment_IO.jsp
	 * 비품 입출고
	 * */
	public mp_EquipmentDTO(String equip_code, String equip_name, 
			String equip_s_size, int equip_lastdate, String e_s_in_out,
			int e_s_in_out_num, Date e_s_modi_date) {
		super();
		this.equip_code = equip_code;
		this.equip_name = equip_name;
		this.equip_s_size = equip_s_size;
		this.equip_lastdate = equip_lastdate;
		this.e_s_modi_date = e_s_modi_date;
		this.e_s_in_out = e_s_in_out;
		this.e_s_in_out_num = e_s_in_out_num;
	}
	
	/**
	 * mp_equipment_management.jsp
	 * 비품 관리대장
	 * */
	public mp_EquipmentDTO(int equip_idx, String equip_code, String equip_name, String equip_s_size, int equip_first_num, int equip_last_num,
			String e_s_in_out, int e_s_in_out_num) {
		super();
		this.equip_idx = equip_idx;
		this.equip_code = equip_code;
		this.equip_name = equip_name;
		this.equip_s_size = equip_s_size;
		this.equip_first_num = equip_first_num;
		this.equip_last_num = equip_last_num;
		this.e_s_in_out = e_s_in_out;
		this.e_s_in_out_num = e_s_in_out_num;
	}
	
	/**
	 * mp_equipment_monthly.jsp
	 * 월별 현황
	 * */
	public mp_EquipmentDTO(int equip_idx, String equip_code, String equip_name, String equip_s_size, int equip_first_num, int equip_last_num,
			String e_s_in_out, int e_s_in_out_num, Date e_s_modi_date) {
		super();
		this.equip_idx = equip_idx;
		this.equip_code = equip_code;
		this.equip_name = equip_name;
		this.equip_s_size = equip_s_size;
		this.equip_first_num = equip_first_num;
		this.equip_last_num = equip_last_num;
		this.e_s_in_out = e_s_in_out;
		this.e_s_in_out_num = e_s_in_out_num;
		this.e_s_modi_date = e_s_modi_date;
	}
	
	/** 비품 종류 */
	public mp_EquipmentDTO(int e_s_idx, String equip_code, String equip_name, String equip_s_size, int equip_first_num, int equip_last_num,
			int equip_firstdate, int equip_lastdate) {
		super();
		this.e_s_idx = e_s_idx;
		this.equip_code = equip_code;
		this.equip_name = equip_name;
		this.equip_s_size = equip_s_size;
		this.equip_first_num = equip_first_num;
		this.equip_last_num = equip_last_num;
		this.equip_firstdate = equip_firstdate;
		this.equip_lastdate = equip_lastdate;
	}

	public int getE_s_idx() {
		return e_s_idx;
	}

	public void setE_s_idx(int e_s_idx) {
		this.e_s_idx = e_s_idx;
	}

	public int getEquip_idx() {
		return equip_idx;
	}

	public void setEquip_idx(int equip_idx) {
		this.equip_idx = equip_idx;
	}

	public String getEquip_code() {
		return equip_code;
	}

	public void setEquip_code(String equip_code) {
		this.equip_code = equip_code;
	}

	public String getEquip_name() {
		return equip_name;
	}

	public void setEquip_name(String equip_name) {
		this.equip_name = equip_name;
	}

	public String getEquip_s_size() {
		return equip_s_size;
	}

	public void setEquip_s_size(String equip_s_size) {
		this.equip_s_size = equip_s_size;
	}

	public int getEquip_first_num() {
		return equip_first_num;
	}

	public void setEquip_first_num(int equip_first_num) {
		this.equip_first_num = equip_first_num;
	}

	public int getEquip_last_num() {
		return equip_last_num;
	}

	public void setEquip_last_num(int equip_last_num) {
		this.equip_last_num = equip_last_num;
	}

	public int getEquip_firstdate() {
		return equip_firstdate;
	}

	public void setEquip_firstdate(int equip_firstdate) {
		this.equip_firstdate = equip_firstdate;
	}

	public int getEquip_lastdate() {
		return equip_lastdate;
	}

	public void setEquip_lastdate(int equip_lastdate) {
		this.equip_lastdate = equip_lastdate;
	}

	public String getE_s_in_out() {
		return e_s_in_out;
	}

	public void setE_s_in_out(String e_s_in_out) {
		this.e_s_in_out = e_s_in_out;
	}

	public int getE_s_in_out_num() {
		return e_s_in_out_num;
	}

	public void setE_s_in_out_num(int e_s_in_out_num) {
		this.e_s_in_out_num = e_s_in_out_num;
	}

	public Date getE_s_modi_date() {
		return e_s_modi_date;
	}

	public void setE_s_modi_date(Date e_s_modi_date) {
		this.e_s_modi_date = e_s_modi_date;
	}

	
}
