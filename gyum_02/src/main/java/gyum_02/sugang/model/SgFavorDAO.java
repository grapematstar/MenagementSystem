package gyum_02.sugang.model;

import java.util.List;

public interface SgFavorDAO {
	public List<SgFavorDTO> sgFavorList(int stu_idx);
	public int sgFavorInsert(int user_idx,List<String> arrayParam);
	public int sgFavorDelete(int user_idx,List<String> arrayParam);
}
