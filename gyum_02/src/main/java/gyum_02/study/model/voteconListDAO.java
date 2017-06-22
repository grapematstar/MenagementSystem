package gyum_02.study.model;

import java.util.List;

public interface voteconListDAO {
	public int voteconListinsert(voteconStudyDTO vcsdto);
	public List<voteconStudyDTO> getvoteconlist(int study_idx,int study_votebbsidx);
	public int updatevotenum(int study_voteidx);
	public int vote_cancel(int study_voteidx,int study_votebbsidx);
}
