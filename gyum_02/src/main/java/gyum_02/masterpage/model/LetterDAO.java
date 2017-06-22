package gyum_02.masterpage.model;

import java.util.List;
import java.sql.*;

public interface LetterDAO {
	public int mp_letter_insert(LetterDTO dto);
	public List<LetterDTO> mp_letter_allList(int cp,int ls);
	public int mp_letter_totalCnt();
	public LetterDTO mp_letter_content(int letter_idx);
	public List<Integer> mp_letter_dateCheck(Date min_letter_senddate,Date max_letter_senddate);
}
