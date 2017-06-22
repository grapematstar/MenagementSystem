package gyum_02.main_TeacherInfo.Model;

import java.util.List;

import gyum_02.cybercampus.Model.CC_EpilogueDTO;
import gyum_02.member.model.My_memberTeacherDTO;
import gyum_02.mypage.model.My_ClassDTO;

public interface TeacherInfoDAO {
	public int nowdateInteger ();
	public int teacherGetTotal(int sub);
	public List<My_memberTeacherDTO> teacherInfoList(int cp, int ls, int sub);
	public My_memberTeacherDTO teacherInfoContent(int idx);
	public List<My_ClassDTO> nowClassContentList(int idx);
	public List<My_ClassDTO> lastClassContent(int idx);
	public List<CC_EpilogueDTO> epilContent(int cp, int ls, List<My_ClassDTO> list);
	public int totalLastEpil (List<My_ClassDTO> list);
	public My_ClassDTO classInfoContent (int class_idx);
	public List<CC_EpilogueDTO> nowepilContent(int cp, int ls, int idx);
	public int nowepilGetTotal(int idx);
	public My_ClassDTO nowClassContent(int idx);
}
