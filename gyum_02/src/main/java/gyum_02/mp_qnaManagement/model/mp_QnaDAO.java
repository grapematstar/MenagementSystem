package gyum_02.mp_qnaManagement.model;

import java.util.*;

public interface mp_QnaDAO {
	public int mpQnaTotalCnt();
	public List mpQnaAllList(int cp, int listSize);
	public List mpQnaContent(int idx);
	public int mpQnaDelete(int qna_idx, int qna_row);
	public int mpQnaReWrite(mp_QnaDTO dto);

}
