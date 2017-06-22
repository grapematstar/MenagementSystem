package gyum_02.study.model;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface createStudyDAO {
	public int studyadd(createStudyDTO dto,HttpSession session);
	public List<createStudyDTO> studylist(int cp,int ls);
	public List<createStudyDTO> getstudyinfo(int idx);
	public int getmaxmember(int study_idx);
	public int get_study_total();
	   public int get_study_total_theme(String theme);
	   public int get_study_total_title(String title);
	   public List<createStudyDTO> studylist_theme(int cp,int ls,String theme);
	   public List<createStudyDTO> studylist_title(int cp,int ls,String title);
	   public int study_CloseOrStart(int study_idx,int study_situ);
   public int studymodi(createStudyDTO dto,HttpSession session);
   public int get_study_idx(createStudyDTO csdto);
}
