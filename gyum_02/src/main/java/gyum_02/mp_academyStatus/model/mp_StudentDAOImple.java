package gyum_02.mp_academyStatus.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.commons.testMode;

public class mp_StudentDAOImple implements mp_StudentDAO,testMode {
	private SqlSessionTemplate sqlMap;
	
	public mp_StudentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<mp_StudentDTO> mpStudentAllList(int cp, int listSize) {
		HashMap map = new HashMap();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		if(testMode.mode){
			ArrayList<mp_StudentDTO> arr = new ArrayList<mp_StudentDTO>();
			for(int i=startNum-1, j=0; i<endNum && i<testMode.studentTotalNum; i++, j++){
				int stu_idx = i+1;
				String stu_id = "stu_id_"+stu_idx;
				String stu_name = "길동_"+stu_idx;
				String stu_tel = "010111122"+stu_idx;
				String stu_email = "e_"+stu_idx+"@naver.com";
				Date stu_in_date = new Date();
				Date stu_out_date = new Date();
				String stu_school = stu_idx+"_학교";
				String class_subject = (char) ('A'+j)+"";
				
				mp_StudentDTO dto = new mp_StudentDTO(stu_idx, stu_id, stu_name, stu_tel, stu_email, stu_in_date, stu_out_date, stu_school, class_subject);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpStudentAllList", map);
		}
	}

	public int mpStudentTotalCnt() {
		if(testMode.mode){
			return testMode.studentTotalNum;
		}else{
			return sqlMap.selectOne("mpStudentTotalCnt");
		}
	}

	public List mpStudentClassList(int cp, int listSize, int class_idx) {
		HashMap map = new HashMap();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("class_idx", class_idx);
		if(testMode.mode){
			ArrayList<mp_StudentDTO> arr = new ArrayList<mp_StudentDTO>();
			for(int i=startNum-1, j=0; i<endNum && i<testMode.studentTotalNum; i++, j++){
				int stu_idx = i+1;
				String stu_id = "stu_id_"+stu_idx;
				String stu_name = "길동_"+stu_idx;
				String stu_tel = "010111122"+stu_idx;
				String stu_email = "e_"+stu_idx+"@naver.com";
				Date stu_in_date = new Date();
				Date stu_out_date = new Date();
				String stu_school = stu_idx+"_학교";
				
				mp_StudentDTO dto = new mp_StudentDTO(stu_idx, stu_id, stu_name, stu_tel, stu_email, stu_in_date, stu_out_date, stu_school, class_idx);
				arr.add(dto); 
			}
			return arr;
		}else{
			return sqlMap.selectList("mpStudentClassList", map);
		}
	}
	
	public List mpStudentClassNameList() {
		if(testMode.mode){
			ArrayList<mp_StudentDTO> arr = new ArrayList<mp_StudentDTO>();
			return arr;
		}else{
			return sqlMap.selectList("mpStudentClassNameList");
		}
	}

	public mp_ClassDTO mpClassInfo(int splits_class_idx) {
		if(testMode.mode){
			System.out.println("사용 안하는 코드입니다. err ~ err ~");
			return null;
		}else{
			List list = sqlMap.selectList("mpClassInfo", splits_class_idx);
			return list.size()>0?(mp_ClassDTO)list.get(0):null;
		}
	}

	public int mpStudentClassTotalCnt() {
		if(testMode.mode){
			return 99;
		}else{
			return sqlMap.selectOne("mpStudentClassTotalCnt");
		}
	}

	public int mpStudentClassTotalCnt(int class_idx) {
		if(testMode.mode){
			return 99;
		}else{
			return sqlMap.selectOne("mpStudentClassTotalCnt", class_idx);
		}
	}
}
