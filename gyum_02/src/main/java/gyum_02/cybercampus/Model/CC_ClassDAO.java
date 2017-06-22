package gyum_02.cybercampus.Model;

import java.util.List;

public interface CC_ClassDAO {
	public List<CC_ClassDTO> CC_gotoStudentCurrentClassList(int cp,int listSize,int stu_idx);
	public List<CC_ClassDTO> CC_gotoStudentOldClassList(int cp,int listSize,int stu_idx);
	public int CC_totalCntStudentCurrentClassList(int stu_idx);
	public int CC_totalCntStudentOldClassList(int stu_idx);
	public List<CC_ClassDTO> CC_gotoTeacherCurrentClassList(int cp,int listSize,int tea_idx);
	public List<CC_ClassDTO> CC_gotoTeacherOldClassList(int cp,int listSize,int tea_idx);
	public int CC_totalCntTeacherOldClassList(int tea_idx);
	public int CC_totalCntTeacherCurrentClassList(int tea_idx);
	public List<CC_ClassDTO> CC_gotoMasterOldClassList(int cp,int listSize,int master_idx);
	public List<CC_ClassDTO> CC_gotoMasterCurrentClassList(int cp,int listSize,int master_idx);
	public int CC_totalCntMasterOldClassList();
	public int CC_totalCntMasterCurrentClassList();
	
	public int CC_totalCntTeacherPlannedClassList(int tea_idx);
	public List<CC_ClassDTO> CC_gotoTeacherPlannedClassList(int cp,int listSize,int tea_idx);
	
	public int CC_totalCntStudentPlannedClassList(int stu_idx);
	public List<CC_ClassDTO> CC_gotoStudentPlannedClassList(int cp,int listSize,int stu_idx);

	public int CC_totalCntMasterPlannedClassList();
	public List<CC_ClassDTO> CC_gotoMasterPlannedClassList(int cp,int listSize,int master_idx);
	
	public String CC_getClassSubjectName(int class_idx);
	public CC_ClassDTO CC_sessionClassInfo(int class_idx);
	
	public List<CC_NoticeDTO> CC_indexNoticeList(int class_idx);
	public List<CC_FreeBBSDTO> CC_indexFreeBBSList(int class_idx);
	public List<CC_RepositoryDTO> CC_indexRepositoryList(int class_idx);
	public List<CC_TeacherNoticeDTO> CC_indexTeacherNoticeList();
	
	public CC_TeacherNoticeDTO CC_TeacherNoticeContent(int t_n_idx);
}