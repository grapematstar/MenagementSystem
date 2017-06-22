package gyum_02.study.model;

import java.util.List;

public interface recruitStudyDAO {
	public int study_recruit_insert(recruitStudyDTO dto);
	public List<recruitStudyDTO> study_recruit_list(int cp,int ls);
	public List<recruitStudyDTO> getstudy_recruit(int study_recruitidx);
	public int study_recruit_req_update_plus(int study_recruitidx);
	public int study_recruit_req_update_minus(int study_recruitidx);
	public int getstudy_recruitidx(recruitStudyDTO dto);
	public List<recruitStudyDTO> getstudy_recruitlist(int stu_idx);
	public int get_study_recruit_total();
	   public int get_studyRecruit_total_theme(String theme);
	   public int get_studyRecruit_total_title(String title);
	   public List<recruitStudyDTO> studyRecruitlist_theme(int cp,int ls,String theme);
	   public List<recruitStudyDTO> studyRecruitlist_title(int cp,int ls,String title);
	   
	   public int study_recruit_del(int stu_idx,int study_recruitidx);
	   public int study_recruit_close(int stu_idx, int study_recruitidx);
   	public List<recruitStudyDTO> getstudy_make_recruitlist(String id);
   	public int rcs_close(int study_recruitidx);
 
}
