package gyum_02.my_student.model;

import java.util.*;

public interface my_stu_LetterDAO {
	
	public List<my_stu_LetterDTO> getMyLetter(String id, int cp);

	public List<my_stu_LetterDTO> getMySendLetter(String id, int cp);
	
	public List<Integer> getNoReadLetterList(String id, int cp);
	
	public my_stu_LetterDTO getOneLetter(int letter_idx);
	
	public void readLetter(int letter_idx);
	
	public int noReadLetterNumber(String id);
	
	public void sendLetter(my_stu_LetterDTO dto);

	public int getTotalLetter(String id);

	public int getTotalSendLetter(String id);
	
	public List<my_stu_LetterDTO> getMyLetterIndex(String id);
}
