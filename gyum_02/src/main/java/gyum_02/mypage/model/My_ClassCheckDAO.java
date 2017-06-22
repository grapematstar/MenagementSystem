package gyum_02.mypage.model;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface My_ClassCheckDAO {

	public int class_checkWrite(int class_idx);
	
	public List<My_ClassDTO> c_class_CheckList(int cp,int ls,int idx);
	
	public List<My_ClassDTO> nc_class_CheckList(int cp,int ls,int idx);
	
	public int c_ck_TotalCnt(int idx);
	
	public int nc_ck_TotalCnt(int idx);
}
