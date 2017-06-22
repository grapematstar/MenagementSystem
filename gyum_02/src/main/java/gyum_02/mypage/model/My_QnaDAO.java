package gyum_02.mypage.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

public interface My_QnaDAO {

	public int qna_Write(My_QnaDTO dto);
	
	public List<My_QnaDTO> stu_qna_List(String id, int cp,int ls);
	
	public List<My_QnaDTO> par_qna_List(String id, int cp,int ls);
	
	public List<My_QnaDTO> tea_qna_List(String id, int cp,int ls);
	
	public int stu_qna_TotalCnt(String id);
	
	public int par_qna_TotalCnt(String id);
	
	public int tea_qna_TotalCnt(String id);
	
	public My_QnaDTO qna_Content(int idx);
	
	public int qna_Update(My_QnaDTO dto);
	
	public int qna_reWrite(My_QnaDTO dto);
	
	public List<My_QnaDTO> qna_reList(int cp, int ls, int idx);
	
	public int qna_reTotalCnt(int idx);
	
	public int qna_reUpdate(My_QnaDTO dto);
}
