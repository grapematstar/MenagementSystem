package gyum_02.mp_academyStatus.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.commons.testMode;

public class mp_TeacherDAOImple implements mp_TeacherDAO {

	private SqlSessionTemplate sqlMap;
	
	public mp_TeacherDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List mpTeacherAllList(int cp, int listSize) {
		HashMap map = new HashMap();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		if(testMode.mode){
			ArrayList<mp_TeacherDTO> arr = new ArrayList<mp_TeacherDTO>();
			for(int i=startNum-1; i<endNum && i<testMode.teacherTotalNum; i++){
				int tea_idx = i+1;
				String tea_id = "tea_id_"+tea_idx;
				String tea_name = "길동_"+tea_idx;
				String tea_tel = "010111122"+tea_idx;
				String tea_email = "e_"+tea_idx+"@naver.com";
				Date tea_in_date = new Date();
				int file_tea_idx = 1;
				
				mp_TeacherDTO dto = new mp_TeacherDTO(tea_idx,
						tea_id, tea_name, tea_tel, tea_email, tea_in_date, file_tea_idx);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpTeacherAllList", map);
		}
	}

	public int mpTeacherTotalCnt() {
		if(testMode.mode){
			return testMode.teacherTotalNum;
		}else{
			return sqlMap.selectOne("mpTeacherTotalCnt");
		}
	}

}
