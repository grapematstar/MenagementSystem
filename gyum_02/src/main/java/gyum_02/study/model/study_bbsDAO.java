package gyum_02.study.model;

import java.util.List;

public interface study_bbsDAO {
	public List<study_bbsDTO> study_bbslist_get(study_bbsDTO dto,int cp,int ls);
	public int study_bbsinsert(study_bbsDTO dto);
	public List<study_bbsDTO> study_bbscontent(int study_bbsidx);
	public List<study_bbsDTO> study_bbsreply(study_bbsDTO dto);
	public int study_replyinsert(study_bbsDTO dto);
	public List<study_bbsDTO> study_bbslist(study_bbsDTO dto);
	public int get_studybbslist_total(study_bbsDTO dto);
	   public int study_bbsreplyupdate(study_bbsDTO dto);
	   public int study_bbsdel(int study_bbsidx);
}
