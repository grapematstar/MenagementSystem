package gyum_02.study.model;

import java.util.List;

public interface filebbsDAO {
	public int makelistfilebbs(filebbsDTO dto);
	public List<filebbsDTO> getfilebbsList(int study_idx,int cp,int ls);
	public filebbsDTO getfilebbsContent(int study_filebbsidx);
	public List<filebbsDTO> getstudy_filebbsreply(filebbsDTO dto);
	public int makestudy_filebbsreply(filebbsDTO dto);
	public int study_filebbsdel(int study_filebbsidx);
	public int study_filebbsupdate(filebbsDTO dto);
	public int study_filebbsreplyupdate(filebbsDTO dto);
	public int getstudy_fileupload_s_f_idx(filebbsDTO dto);
	public int study_filebbs_gettotal(int study_idx);
}
