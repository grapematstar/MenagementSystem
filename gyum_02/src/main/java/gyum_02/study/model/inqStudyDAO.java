package gyum_02.study.model;

import java.util.List;

public interface inqStudyDAO {
	public int study_recruit_inq_send(inqStudyDTO dto);
	public List<inqStudyDTO> study_reciv_list(String stu_id);
	public List<inqStudyDTO> study_inq_list(inqStudyDTO inqdto);
	public int update_study_readcheck(inqStudyDTO inqdto);
	public List<inqStudyDTO> study_send_list(String stu_id);

}

