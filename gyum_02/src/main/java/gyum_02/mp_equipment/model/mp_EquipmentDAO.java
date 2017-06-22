package gyum_02.mp_equipment.model;

import java.util.*;

public interface mp_EquipmentDAO {
	public int mpEquipmentTotalCnt();
	public int mpEquipmentDayTotalCnt(Date e_s_modi_date);
//	public int mpEquipmentMonthlyTotalCnt(String name, int year, String in_out);
//	public int mpEquipmentYearlyTotalCnt(String name, int year, String in_out);
	
	public List mpEquipmentAllList(int cp, int listSize);
	public int mpEquipmentInsertList(ArrayList<mp_EquipmentDTO> list);
	public List mpEquipmentDayList(String modiDate);
	public List mpEquipmentMonthlyList(int year);
	public List mpEquipmentNameList();
	public List mpEquipmentYearlyList();
	public List mpEquipmentYearList();
	
}
