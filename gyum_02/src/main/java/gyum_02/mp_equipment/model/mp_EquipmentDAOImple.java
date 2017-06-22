package gyum_02.mp_equipment.model;

import java.util.ArrayList; 
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.commons.testMode;

public class mp_EquipmentDAOImple implements mp_EquipmentDAO {

	private SqlSessionTemplate sqlMap;
	
	public mp_EquipmentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List mpEquipmentAllList(int cp, int listeSize) {
		HashMap map = new HashMap();
		
		int startNum = (cp-1)*listeSize+1;
		int endNum = cp*listeSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		if(testMode.mode){
			ArrayList<mp_EquipmentDTO> arr = new ArrayList<mp_EquipmentDTO>();
			for(int i=startNum-1; i<endNum && i<testMode.equipmentTotalNum; i++){
				
				int equip_idx = i+1;
				String equip_code = "equip_code_"+equip_idx;
				String equip_name = "품명_"+equip_idx;
				String equip_s_size = "123*"+equip_idx+"0";
				int equip_first_num = (equip_idx*2)%5;
				int equip_last_num = (equip_idx*3)%6;
				int equip_firstdate = 20111011;
				mp_EquipmentDTO dto = new mp_EquipmentDTO(equip_idx, equip_code, equip_name, equip_s_size, 
						equip_first_num, equip_last_num, equip_firstdate);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpEquipmentAllList", map);
		}
	}
	
	public int mpEquipmentInsertList(ArrayList<mp_EquipmentDTO> list) {
		if(testMode.mode){
			return 1;
		}else{
			int result = 1;
			for(int i=0; i<list.size(); i++){
				List oneList =
						sqlMap.selectList("mpEquipmentOneList", list.get(i));
				if(oneList.isEmpty()){
					list.get(i).setEquip_first_num(list.get(i).getE_s_in_out_num());
					list.get(i).setEquip_last_num(list.get(i).getE_s_in_out_num());
					
					
					if(sqlMap.insert("mpEquipmentInsertList", list.get(i))<=0){
						result = 0;
					}
					oneList =
							sqlMap.selectList("mpEquipmentOneList", list.get(i));
					list.get(i).setEquip_idx(
							((mp_EquipmentDTO)oneList.get(0)).getEquip_idx());
					if(sqlMap.insert("mpEquipmentInsertSalList", list.get(i))<=0){
						result=0;
					}
				}else{
					list.get(i).setEquip_idx(
							((mp_EquipmentDTO)oneList.get(0)).getEquip_idx());
					int one_last_num = ((mp_EquipmentDTO)oneList.get(0)).getEquip_last_num();
					
					if(list.get(i).getE_s_in_out().equals("out")){
						list.get(i).setEquip_last_num(
							one_last_num - list.get(i).getE_s_in_out_num());
					}else if(list.get(i).getE_s_in_out().equals("in")){
						list.get(i).setEquip_last_num(
								one_last_num + list.get(i).getE_s_in_out_num());
					}
					if(sqlMap.insert("mpEquipmentInsertSalList", list.get(i))<=0){
						result=0;
					}
					result = sqlMap.update("mpEquipmentUpdateList", list.get(i));
					
				}
			}
			return result;
		}
	}

	public List mpEquipmentDayList(String modiDate) {
		HashMap map = new HashMap();
		
		map.put("e_s_modi_date", modiDate);
		
		if(testMode.mode){
			ArrayList<mp_EquipmentDTO> arr = new ArrayList<mp_EquipmentDTO>();
			for(int i=0; i<testMode.equipmentDayTotalNum; i++){
				int equip_idx = i+1;
				String equip_code = "equip_code_"+equip_idx;
				String equip_name = "품명_"+equip_idx;
				String equip_s_size = "123*"+equip_idx+"0";
				int equip_first_num = (equip_idx*2)%5;
				int equip_last_num = (equip_idx*3)%6;
				String e_s_in_out = equip_idx%5==(0|3)?"in":"out";
				int e_s_in_out_num = (equip_idx*2)%3;
				mp_EquipmentDTO dto = new mp_EquipmentDTO(equip_idx,
						equip_code, equip_name, equip_s_size, equip_first_num, equip_last_num,
						e_s_in_out, e_s_in_out_num);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpEquipmentDayList", map);
		}
	}

	public List mpEquipmentMonthlyList(int year) {
		HashMap map = new HashMap();
		
		map.put("e_s_modi_date", year+"");
		if (testMode.mode) {
			ArrayList<mp_EquipmentDTO> arr = new ArrayList<mp_EquipmentDTO>();
			for (int i = 0; i < testMode.equipmentDayTotalNum; i++) {
				int equip_idx = i + 1;
				String equip_code = "equip_code_" + equip_idx;
				String equip_name = testMode.equipmentNameList[i%testMode.equipmentNameList.length];
				String equip_s_size = "123*" + equip_idx + "0";
				int equip_first_num = (equip_idx * 2) % 5;
				int equip_last_num = (equip_idx * 3) % 6;
				String e_s_in_out = equip_idx % 5 == (0 | 3) ? "in" : "out";
				int e_s_in_out_num = (equip_idx * 2) % 3;
				Date e_s_modi_date_t = new Date();
				mp_EquipmentDTO dto = new mp_EquipmentDTO(equip_idx,
						equip_code, equip_name, equip_s_size, equip_first_num, equip_last_num,
						e_s_in_out, e_s_in_out_num, e_s_modi_date_t);
				arr.add(dto);
			}
			return arr;
		} else {
			return sqlMap.selectList("mpEquipmentMonthlyList", map);
		}
	}
	
	public List mpEquipmentNameList(){
		if (testMode.mode) {
			ArrayList<mp_EquipmentDTO> arr = new ArrayList<mp_EquipmentDTO>();
			for (int i = 0; i < testMode.equipmentTotalNum; i++) {
				int e_s_idx = i+1;
				String equip_name = testMode.equipmentNameList[i];
				String equip_code = "equip_code_" + e_s_idx;
				String equip_s_size = "123*" + e_s_idx + "0";
				int equip_first_num = (e_s_idx * 2) % 5;
				int equip_last_num = (e_s_idx * 3) % 6;
				int equip_firstdate = 20101101;
				int equip_lastdate = 20101101;
				
				mp_EquipmentDTO dto = new mp_EquipmentDTO(e_s_idx,
						equip_code, equip_name, equip_s_size, equip_first_num,
						equip_last_num, equip_firstdate, equip_lastdate);
				arr.add(dto);
			}
			return arr;
		} else {
			return sqlMap.selectList("mpEquipmentNameList");
		}
	}

	public List mpEquipmentYearlyList() {
				if (testMode.mode) {
					ArrayList<mp_EquipmentDTO> arr = new ArrayList<mp_EquipmentDTO>();
					for (int i = 0; i < testMode.equipmentDayTotalNum; i++) {
						int equip_idx = i + 1;
						String equip_code = "equip_code_" + equip_idx;
						String equip_name = testMode.equipmentNameList[i%testMode.equipmentNameList.length];
						String equip_s_size = "123*" + equip_idx + "0";
						int equip_first_num = (equip_idx * 2) % 5;
						int equip_last_num = (equip_idx * 3) % 6;
						String e_s_in_out = equip_idx % 5 == (0 | 3) ? "in" : "out";
						int e_s_in_out_num = (equip_idx * 2) % 3;
						Date e_s_modi_date = new Date();
						mp_EquipmentDTO dto = new mp_EquipmentDTO(equip_idx,
								equip_code, equip_name, equip_s_size, equip_first_num, equip_last_num,
								e_s_in_out, e_s_in_out_num, e_s_modi_date);
						arr.add(dto);
					}
					return arr;
				} else {
					return sqlMap.selectList("mpEquipmentYearlyList");
				}
	}

	public int mpEquipmentTotalCnt() {
		if(testMode.mode){
			return testMode.equipmentTotalNum;
		}else{
			return sqlMap.selectOne("mpEquipmentTotalCnt");
		}
	}

	public int mpEquipmentDayTotalCnt(Date e_s_modi_date) {
		HashMap map = new HashMap();
		
		Date e_s_modi_date2 = e_s_modi_date;
		e_s_modi_date2.setYear(e_s_modi_date.getDate()+1);
		map.put("e_s_modi_date", e_s_modi_date);
		map.put("e_s_modi_date2", e_s_modi_date2);
		if(testMode.mode){
			return testMode.equipmentDayTotalNum;
		}else{
			return sqlMap.selectOne("mpEquipmentDayTotalCnt", map);
		}
	}
	/*
	public int mpEquipmentMonthlyTotalCnt(String equip_name, int year, String e_s_in_out) {
		if(testMode.mode){
			return testMode.equipmentMonthlyTotalNum;
		}else{
			HashMap map = new HashMap();
			map.put("equip_name", equip_name);
			map.put("year", year);
			map.put("e_s_in_out", e_s_in_out);
			return sqlMap.selectOne("mpEquipmentMonthlyTotalCnt", map);
		}
	}

	public int mpEquipmentYearlyTotalCnt(String equip_name, int year, String e_s_in_out) {
		if(testMode.mode){
			return testMode.equipmentYearlyTotalNum;
		}else{
			HashMap map = new HashMap();
			map.put("equip_name", equip_name);
			map.put("year", year);
			map.put("e_s_in_out", e_s_in_out);
			return sqlMap.selectOne("mpEquipmentYearlyTotalCnt", map);
		}
	}
	*/

	public List mpEquipmentYearList(){
		if(testMode.mode){
			ArrayList<String> arr = new ArrayList<String>();
			for(int i=2012; i<=2017; i++){
				arr.add(i+"");
			}
			return arr;
		}else{
			return sqlMap.selectList("mpEquipmentYearList");
			
		}
	}


	/*
	 * this.e_s_idx = e_s_idx;
		this.equip_code = equip_code;
		this.equip_name = equip_name;
		this.equip_s_size = equip_s_size;
		this.equip_first_num = equip_first_num;
		this.equip_firstdate = equip_firstdate;
	 * 
	 * */

}
