package gyum_02.study.model;

import java.util.List;

public interface reqStudyDAO {
	public int study_req_add(reqStudyDTO dto);
	public List<reqStudyDTO> study_req_check(reqStudyDTO dto);
	public List<reqStudyDTO> study_req_list(int idx);
	public int sutdy_req_del(reqStudyDTO reqdto);
	public List<reqStudyDTO> study_recru_reqlist(int study_recruitidx);

	
	public int study_req_del(int stu_idx,int study_recruitidx);
    public int study_recruit_accept(int stu_idx,int study_recruitidx);
	public int study_recruit_cancle(int stu_idx,int study_recruitidx);
	public int study_req_del2(int study_recruitidx);
}
