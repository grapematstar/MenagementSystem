package gyum_02.study.model;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface bbsnameStudyDAO {
	public List<bbsnameStudyDTO> bbsnamelist(HttpSession session);
	public int bbsnameinsert(bbsnameStudyDTO dto,HttpSession session);
	public int bbsnamedel(bbsnameStudyDTO dto);
	public String bbsnameget(bbsnameStudyDTO dto);
}