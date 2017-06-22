package gyum_02.study.model;

import java.util.List;

public interface votebbsDAO {
	public int votebbsinsert(votebbsDTO dto);
	public List<votebbsDTO> getvotebbsList(int study_idx,int cp,int ls);
	public votebbsDTO getvotecon(int studybbsvoteidx);
	   public int study_votebbsreplyupdate(votebbsDTO dto);
	   public List<votebbsDTO> getstudy_votebbsreply(votebbsDTO dto);
	   public int makestudy_votebbsreply(votebbsDTO dto);
	   public int study_votebbsdel(int study_votebbsidx);
   public int study_votebbs_gettotal(int study_idx);
}
