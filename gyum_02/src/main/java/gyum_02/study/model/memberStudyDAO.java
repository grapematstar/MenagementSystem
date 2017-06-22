package gyum_02.study.model;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface memberStudyDAO {
	public int membercheck(HttpSession session,int idx);
	public List<memberStudyDTO> getstudymemberinfo(int study_idx);
	public int study_memberdel(memberStudyDTO dto);
	public int study_membercheck(String stu_id,int study_idx);
	public int study_memadd(String stu_id,int study_idx);
	public int membercount(int study_idx);
	public List<memberStudyDTO> getstudy_idx(int stu_idx);
}	

