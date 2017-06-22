package gyum_02.study.model;

import java.util.List;

public interface infoStudyDAO {
	public int studyinfoadd(infoStudyDTO dto);
		
	public List<infoStudyDTO> getstudyinfo(int stu_idx);
	public infoStudyDTO getstudymem_info(String stu_id);
	public int study_infoupdate(String stu_id);
	public int study_memdeport(String stu_id);
}
