package gyum_02.cybercampus.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CC_RepositoryDAOImple implements CC_RepositoryDAO {

	private SqlSessionTemplate sqlMap;	
	
	public CC_RepositoryDAOImple(){
		super();
	}
	
	public CC_RepositoryDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<CC_RepositoryDTO> cc_gotoStudentCCRepositoryList(int class_idx,int stu_idx) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("class_idx", class_idx);
		map.put("stu_idx", stu_idx);
		return sqlMap.selectList("cc_gotoStudentCCRepositoryList",map);
	}

	public List<CC_RepositoryDTO> cc_gotoTeacherCCRepositoryList(int class_idx,int cp,int listSize) {
		int startnum=(cp-1)*listSize+1;
		int endnum=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("class_idx", class_idx);
		return sqlMap.selectList("cc_gotoTeacherCCRepositoryList",map);
	}

	public int cc_submitHomeworkWrite(CC_RepositoryDTO dto) {
		int count = sqlMap.insert("cc_submitHomeworkWrite", dto);
		return count;
	}

	public CC_RepositoryDTO cc_gotoHomeworkContent(int c_h_t_idx) {
		return sqlMap.selectOne("cc_gotoHomeworkContent", c_h_t_idx);
	}
	
	public int cc_submitStudentHomeworkFileWrite(Map<String,Object> fileMap){
		int count=sqlMap.insert("cc_submitStudentHomeworkFileWrite",fileMap);
		return count;
	}
	
	public int cc_submitStudentHomeworkWrite(Map<String, Object> homeworkMap) {
		int count=sqlMap.insert("cc_submitStudentHomeworkWrite", homeworkMap);
		return count;
	}

	public int cc_getStudentHomeworkWriteIDX() {
		int c_h_s_idx=sqlMap.selectOne("cc_getStudentHomeworkWriteIDX");
		return c_h_s_idx;
	}
	
	public List<CC_RepositoryDTO> cc_getStudentHomeworkList(Map<String, Object> map) {
		List<CC_RepositoryDTO> list=sqlMap.selectList("cc_getStudentHomeworkList", map);
		return list;
	}
	
	public List<CC_RepositoryDTO> cc_getStudentHomeworkFile(Map<String, Object> filemap) {
		List<CC_RepositoryDTO> filelist=sqlMap.selectList("cc_getStudentHomeworkFile",filemap);
		return filelist;
	}
	public CC_RepositoryDTO cc_getStudentHomeworkFileDownloadPath(int c_s_idx) {
		CC_RepositoryDTO dto=sqlMap.selectOne("cc_getStudentHomeworkFileDownloadPath", c_s_idx);
		return dto;
	}
	//Teacher's HomeworkContent Sidebar
	public List<CC_RepositoryDTO> cc_getStudentHomeworkListDownload(Map<String, Object> map) {
		List<CC_RepositoryDTO> list=sqlMap.selectList("cc_getStudentHomeworkListDownload", map);
		return list;
	}
	//Teacher's HomeworkContent Sidebar + students' list
	public List<CC_RepositoryDTO> cc_getStudentHomeworkFileDownloadList(Map<String, Object> filemap) {
		List<CC_RepositoryDTO> filelist=sqlMap.selectList("cc_getStudentHomeworkFileDownloadList",filemap);
		return filelist;
	}
	
	public int cc_deleteStudentHomeworkDB(int c_h_s_idx) {
		int count =sqlMap.delete("cc_deleteStudentHomeworkFileDB", c_h_s_idx);
		count+=sqlMap.delete("cc_deleteStudentHomeworkContent", c_h_s_idx);
		return count;
	}

	public int cc_totalCntHomeworkList(int class_idx) {
		int totalCnt=sqlMap.selectOne("cc_totalCntHomeworkList", class_idx);
		return totalCnt;
	}
	
	public int cc_checkStudentHomeworkStatus(Map<String, Object> homeworkMap) {
		int result=sqlMap.selectOne("cc_checkStudentHomeworkStatus", homeworkMap);
		return result;
	}
	
	public int cc_checkStudentHomeworkTimeOver(Map<String, Object> homeworkMap) {
		int result=sqlMap.selectOne("cc_checkStudentHomeworkTimeOver", homeworkMap);
		return result;
	}
	
	public int cc_deleteTeacherHomeworkContent(int c_h_t_idx) {
		Map<String,Object> map=new HashMap<String,Object>();
		List<Integer> chsIdxList=sqlMap.selectList("cc_fetchForDeleteTeacherHomeworkContent", c_h_t_idx);
		map.put("c_h_t_idx", c_h_t_idx);
		map.put("chsIdxList", chsIdxList);
		int count=sqlMap.delete("cc_deleteTeacherHomeworkContentStudentsFile", map);
		count+=sqlMap.delete("cc_deleteTeacherHomeworkContentStudentList", c_h_t_idx);
		count+=sqlMap.delete("cc_deleteTeacherHomeworkContent", c_h_t_idx);
		return count;
	}
	public int cc_modifyTeacherHomeworkContent(CC_RepositoryDTO dto) {
		int count=sqlMap.update("cc_modifyTeacherHomeworkContent", dto);
		return count;
	}
}
