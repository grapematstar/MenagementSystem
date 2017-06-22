package gyum_02.masterpage.model._____;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.commons.testMode;

public class mp_ClassManagementDAOImple implements mp_ClassManagementDAO {

	private SqlSessionTemplate sqlMap;
	
	public mp_ClassManagementDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List mpClassSearchList(mp_ClassManagementDTO dto) {
		
		if(testMode.mode){
			ArrayList<mp_ClassManagementDTO> arr = new ArrayList<mp_ClassManagementDTO>();
			for(int i=0; i<testMode.evalQuestion; i++){
				
//				mp_ClassManagementDTO dto = new mp_ClassManagementDTO(
//						class_idx, subject_name, class_subject, tea_name,
//						class_day, class_check, class_startdate, class_enddate);
//				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpClassSearchList", dto);
		}
	}

	public int mpClassCheckUpdate(HashMap map) {
		if(testMode.mode){
			return 1;
		}else{
			return sqlMap.update("mpClassCheckUpdate",map);
		}
	}

	public int mpClassUpdate(mp_ClassManagementDTO dto) {
		if(testMode.mode){
			return 1;
		}else{
			return sqlMap.update("mpClassUpdate",dto);
		}
	}

}
