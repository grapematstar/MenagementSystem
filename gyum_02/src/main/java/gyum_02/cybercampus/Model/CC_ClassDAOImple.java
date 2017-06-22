package gyum_02.cybercampus.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CC_ClassDAOImple implements CC_ClassDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public CC_ClassDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//Student part
	public List<CC_ClassDTO> CC_gotoStudentCurrentClassList(int cp,int listSize,int stu_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		System.out.println(stu_idx);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("stu_idx", stu_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoStudentCurrentClassList", map);
		return list;
	}
	public List<CC_ClassDTO> CC_gotoStudentOldClassList(int cp,int listSize,int stu_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("stu_idx", stu_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoStudentOldClassList", map);
		return list;
	}
	public int CC_totalCntStudentOldClassList(int stu_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntStudentOldClassList", stu_idx);
		return totalCnt;
	}
	public int CC_totalCntStudentCurrentClassList(int stu_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntStudentCurrentClassList", stu_idx);
		return totalCnt;
	}
	
	public int CC_totalCntStudentPlannedClassList(int stu_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntStudentPlannedClassList", stu_idx);
		return totalCnt;
	}
	public List<CC_ClassDTO> CC_gotoStudentPlannedClassList(int cp, int listSize, int stu_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("stu_idx", stu_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoStudentPlannedClassList", map);
		return list;
	}
	
	//Teacher part
	public List<CC_ClassDTO> CC_gotoTeacherCurrentClassList(int cp,int listSize,int tea_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("tea_idx", tea_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoTeacherCurrentClassList", map);
		return list;
	}
	public List<CC_ClassDTO> CC_gotoTeacherOldClassList(int cp,int listSize,int tea_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("tea_idx", tea_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoTeacherOldClassList", map);
		return list;
	}
	public int CC_totalCntTeacherCurrentClassList(int tea_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalTeacherOldClassList", tea_idx);
		return totalCnt;
	}
	public int CC_totalCntTeacherOldClassList(int tea_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntTeacherCurrentClassList", tea_idx);
		return totalCnt;
	}
	public int CC_totalCntTeacherPlannedClassList(int tea_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntTeacherPlannedClassList",tea_idx);
		return totalCnt;
	}
	public List<CC_ClassDTO> CC_gotoTeacherPlannedClassList(int cp, int listSize, int tea_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("tea_idx", tea_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoTeacherPlannedClassList", map);
		return list;
	}
	
	//Master part
	public List<CC_ClassDTO> CC_gotoMasterOldClassList(int cp, int listSize, int master_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("master_idx", master_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoMasterOldClassList", map);
		return list;
	}
	public List<CC_ClassDTO> CC_gotoMasterCurrentClassList(int cp, int listSize, int master_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("master_idx", master_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoMasterCurrentClassList", map);
		return list;
	}	
	public int CC_totalCntMasterOldClassList(){
		int totalCnt=sqlMap.selectOne("cc_totalCntMasterOldClassList");
		return totalCnt;
	}
	public int CC_totalCntMasterCurrentClassList(){
		int totalCnt=sqlMap.selectOne("cc_totalCntMasterCurrentClassList");
		return totalCnt;
	}
	
	public int CC_totalCntMasterPlannedClassList() {
		int totalCnt=sqlMap.selectOne("cc_totalCntMasterPlannedClassList");
		return totalCnt;
	}
	
	public List<CC_ClassDTO> CC_gotoMasterPlannedClassList(int cp, int listSize, int master_idx) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("master_idx", master_idx);
		List<CC_ClassDTO> list=sqlMap.selectList("cc_gotoMasterPlannedClassList", map);
		return list;
	}
	
	//Common part
	public String CC_getClassSubjectName(int class_idx) {
		String class_subject=sqlMap.selectOne("cc_getClassSubjectName", class_idx);
		return class_subject;
	}
	public CC_ClassDTO CC_sessionClassInfo(int class_idx){
		CC_ClassDTO classInfo=sqlMap.selectOne("cc_sessionClassInfo", class_idx);
		return classInfo;
	}
	
	
	//Teacher&Master Index part
	public List<CC_TeacherNoticeDTO> CC_indexTeacherNoticeList() {
		List<CC_TeacherNoticeDTO> list=sqlMap.selectList("cc_indexTeacherNoticeList");
		return list;
	}
	
	public List<CC_FreeBBSDTO> CC_indexFreeBBSList(int class_idx) {
		List<CC_FreeBBSDTO> list=sqlMap.selectList("cc_indexFreeBBSList", class_idx);
		return list;
	}
	
	public List<CC_NoticeDTO> CC_indexNoticeList(int class_idx) {
		List<CC_NoticeDTO> list=sqlMap.selectList("cc_indexNoticeList", class_idx);
		return list;
	}
	public List<CC_RepositoryDTO> CC_indexRepositoryList(int class_idx) {
		List<CC_RepositoryDTO> list=sqlMap.selectList("cc_indexRepositoryList", class_idx);
		return list;
	}
	
	public CC_TeacherNoticeDTO CC_TeacherNoticeContent(int t_n_idx) {
		CC_TeacherNoticeDTO dto=sqlMap.selectOne("cc_TeacherNoticeContent", t_n_idx);
		return dto;
	}
	
}
