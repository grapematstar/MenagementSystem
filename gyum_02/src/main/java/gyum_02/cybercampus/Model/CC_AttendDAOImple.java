package gyum_02.cybercampus.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CC_AttendDAOImple implements CC_AttendDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public CC_AttendDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int cc_totalCntMyClassMate(int class_idx,int listSize,int cp) {
		int totalCnt=sqlMap.selectOne("cc_totalCntMyClassMate",class_idx);
		return totalCnt;
	}
	public List<CC_AttendDTO> cc_gotoMyClassMate(int class_idx){
		System.out.println(class_idx);
		List<CC_AttendDTO> list=sqlMap.selectList("cc_gotoMyClassMate", class_idx);
		return list;
	}
	
	public int cc_totalCntAttendList(int class_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntAttendList",class_idx);
		return totalCnt;
	}
	
	public List<CC_AttendDTO> cc_gotoTeacherAttendMain(int cp, int listSize, int class_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("class_idx", class_idx);
		List<CC_AttendDTO> list=sqlMap.selectList("cc_gotoTeacherAttendMain", map);
		return list;
	}
	
	public int cc_totalCntScoreList(int class_idx,int stu_idx) {
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		int totalCnt=sqlMap.selectOne("cc_totalCntScoreList", map);
		return totalCnt;
	}
	
	public List<CC_AttendDTO> cc_gotoScoreContentList(int cp, int listSize, int class_idx, int stu_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		List<CC_AttendDTO> list=sqlMap.selectList("cc_gotoScoreContentList", map);
		return list;
	}
	
	
	
	public HashMap<String,Object> cc_gotoAllScoreWrite(int class_idx) {
		String class_subject=sqlMap.selectOne("cc_callClassSubject",class_idx);
		List<CC_AttendDTO> list=sqlMap.selectList("cc_gotoAllScoreWrite", class_idx);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("class_subject", class_subject);
		map.put("list", list);
		return map;
	}
	
	public int cc_submitAllScoreWrite(List<CC_AttendDTO> dtolist,int class_idx){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("dtolist", dtolist);
		map.put("class_idx", class_idx);
		int count=sqlMap.insert("cc_submitAllScoreWrite", map);
		return count;
	}
	
	public String cc_callSubjectName(int class_idx) {
		String subject_name=sqlMap.selectOne("cc_callSubjectName",class_idx);
		return subject_name;
	}
	
	public List<CC_AttendDTO> cc_gotoAllAttendWrite(int class_idx){
		List<CC_AttendDTO> list=sqlMap.selectList("cc_gotoAllAttendWrite", class_idx);
		return list;
	}
	
	public int cc_countOneAttendWrite(CC_AttendDTO dto) {
		int count=sqlMap.selectOne("cc_countOneAttendWrite", dto);
		return count;
	}
	
	public int cc_submitOneAttendWrite(CC_AttendDTO dto) {
		int count=sqlMap.insert("cc_submitOneAttendWrite", dto);
		return count;
	}
	
	public int cc_submitOneAttendUpdate(CC_AttendDTO dto) {
		int count=sqlMap.update("cc_submitOneAttendUpdate", dto);
		return count;
	}
	public int cc_countOneAttendNoteUpdate(CC_AttendDTO dto) {
		int a_a_idx=sqlMap.selectOne("cc_countOneAttendNoteUpdate", dto);
		return a_a_idx;
	}
	public int cc_submitOneAttendNoteUpdate(int class_idx,int stu_idx, String attend_note,int attend_date) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		map.put("attend_note", attend_note);
		map.put("attend_date", attend_date);
		int count=sqlMap.update("cc_submitOneAttendNoteUpdate", map);
		return count;
	}
	
	public List<CC_AttendDTO> cc_gotoDateAttendWrite(int class_idx, int attend_date) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("class_idx", class_idx);
		map.put("attend_date", attend_date);
		List<CC_AttendDTO> list=sqlMap.selectList("cc_gotoDateAttendWrite", map);
		return list;
	}
	
//	public int cc_submitAllAttendWrite(List<CC_AttendDTO> list) {
////		int count=sqlMap.insert("cc_submitAllAttendwrite",list);
//		for(int i=0;i<list.size();i++){
//			CC_AttendDTO dto=new CC_AttendDTO();
//			dto=list.get(i);
//			int count=cc_countOneAttendWrite(dto);
//			if(count>0){
//				cc_submitOneAttendUpdate(dto);
//			}else{
//				cc_submitOneAttendWrite(dto);
//			}
//		}
//		return 1;
//	}
	public int cc_totalCntSingleAttendContentList(Map<String, Object> searchMap) {
		int totalCnt=sqlMap.selectOne("cc_totalCntSingleAttendContentList", searchMap);
		return totalCnt;
	}
	public List<CC_AttendDTO> cc_gotoSingleAttendContentList(Map<String, Object> searchMap) {
		List<CC_AttendDTO> list=sqlMap.selectList("cc_gotoSingleScoreContentList", searchMap);
		return list;
	}
	
	public String cc_submitSingleStudentScoreUpdate(CC_AttendDTO dto) {
		sqlMap.update("cc_submitSingleStudentScoreUpdate", dto);
		String stu_name=sqlMap.selectOne("cc_selectSingleStudentName", dto);
		return stu_name;
	}
	
}
