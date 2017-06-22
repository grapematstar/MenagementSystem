package gyum_02.cybercampus.Model;

import java.util.List;
import java.util.Map;

public interface CC_RepositoryDAO {
	public List<CC_RepositoryDTO> cc_gotoStudentCCRepositoryList(int class_idx,int stu_idx);
	public List<CC_RepositoryDTO> cc_gotoTeacherCCRepositoryList(int class_idx,int cp,int listSize);
	public int cc_submitHomeworkWrite(CC_RepositoryDTO dto);
	public CC_RepositoryDTO cc_gotoHomeworkContent(int c_h_t_idx);
	public int cc_submitStudentHomeworkFileWrite(Map<String,Object> fileMap);
	public int cc_submitStudentHomeworkWrite(Map<String,Object> homeworkMap);
	public int cc_getStudentHomeworkWriteIDX();
	public List<CC_RepositoryDTO> cc_getStudentHomeworkList(Map<String,Object> map);
	public List<CC_RepositoryDTO> cc_getStudentHomeworkFile(Map<String,Object> filemap);
	
	public List<CC_RepositoryDTO> cc_getStudentHomeworkListDownload(Map<String,Object> map);
	public List<CC_RepositoryDTO> cc_getStudentHomeworkFileDownloadList(Map<String, Object> filemap);
	
	public CC_RepositoryDTO cc_getStudentHomeworkFileDownloadPath(int c_s_idx);
	public int cc_totalCntHomeworkList(int class_idx);
	
	public int cc_deleteStudentHomeworkDB(int c_h_s_idx);
	
	public int cc_checkStudentHomeworkStatus(Map<String,Object> homeworkMap);
	public int cc_checkStudentHomeworkTimeOver(Map<String,Object> homeworkMap);

	public int cc_deleteTeacherHomeworkContent(int c_h_t_idx);
	public int cc_modifyTeacherHomeworkContent(CC_RepositoryDTO dto);
}
