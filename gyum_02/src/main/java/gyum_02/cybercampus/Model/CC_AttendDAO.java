package gyum_02.cybercampus.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CC_AttendDAO {
	public int cc_totalCntMyClassMate(int class_idx,int listSize,int cp);
	public List<CC_AttendDTO> cc_gotoMyClassMate(int class_idx);
	public int cc_totalCntAttendList(int class_idx);
	public List<CC_AttendDTO> cc_gotoTeacherAttendMain(int cp,int listSize,int class_idx);
	
	public int cc_totalCntScoreList(int class_idx,int stu_idx);
	public List<CC_AttendDTO> cc_gotoScoreContentList(int cp,int listSize,int class_idx,int stu_idx);
	
	public HashMap<String,Object> cc_gotoAllScoreWrite(int class_idx);
	public int cc_submitAllScoreWrite(List<CC_AttendDTO> dtolist,int class_idx);
	
	public String cc_callSubjectName(int class_idx);
	public List<CC_AttendDTO> cc_gotoAllAttendWrite(int class_idx);
	
	public int cc_countOneAttendWrite(CC_AttendDTO dto);
	public int cc_submitOneAttendWrite(CC_AttendDTO dto);
	public int cc_submitOneAttendUpdate(CC_AttendDTO dto);
	public int cc_countOneAttendNoteUpdate(CC_AttendDTO dto);
	public int cc_submitOneAttendNoteUpdate(int class_idx,int stu_idx,String attend_note,int attend_date);
	public List<CC_AttendDTO> cc_gotoDateAttendWrite(int class_idx,int attend_date);
//	public int cc_submitAllAttendWrite(List<CC_AttendDTO> list);
	public int cc_totalCntSingleAttendContentList(Map<String,Object> searchMap);
	public List<CC_AttendDTO> cc_gotoSingleAttendContentList(Map<String,Object> searchMap);
	public String cc_submitSingleStudentScoreUpdate(CC_AttendDTO dto);
}
