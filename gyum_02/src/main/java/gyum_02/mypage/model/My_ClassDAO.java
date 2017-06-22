package gyum_02.mypage.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import gyum_02.member.model.My_memberTeacherDTO;

public interface My_ClassDAO {

	public int class_Open(My_ClassDTO dto);
	
	public int class_Open_Check(int class_idx);
	
	public int class_idxCheck();
	
	public My_ClassDTO class_Content(int idx);
	
	public int class_Update(My_ClassDTO dto,int idx);
}
