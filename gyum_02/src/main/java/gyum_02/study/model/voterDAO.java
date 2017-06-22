package gyum_02.study.model;

import java.util.List;

public interface voterDAO {
	public int voterinsert(int study_voteidx,int study_votebbsidx,int stu_idx,String stu_id);
	public List<voterDTO> getvoterstu_id(int Study_votebbsidx,String stu_id);
	public int votercheck(int study_votebbsidx,String id);
	public int voter_cancel(int study_voteidx,int study_votebbsidx,String id); 
}
