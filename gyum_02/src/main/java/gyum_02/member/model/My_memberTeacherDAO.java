package gyum_02.member.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface My_memberTeacherDAO {

	public int teacherWrite(My_memberTeacherDTO dto);
	
	public int idCheck(String tea_id);
	
	public int login(String tea_id,String tea_pwd,HttpSession session);
	
	public String pwCheck(String user_id,String user_email);
	
	public My_memberTeacherDTO getInfo(String id,HttpSession session);
	
	public My_memberTeacherDTO getteaInfo(String id);
	
	public int tea_Update(My_memberTeacherDTO dto);
	
	public My_memberTeacherDTO tea_InfoDel(String id);
	
	public int tea_Delete(String tea_id,String tea_pwd);
	
	public List<My_memberTeacherDTO> tea_QnaWriteForm(String id,String usergrade);

	public int tea_idx(String tea_id);
	
	public int teacherImageFileWrite(Map<String,Object> filemap);
	
	public int teacherImageFileIdxUpdate(int tea_idx,int file_idx);
	
	public List<My_memberTeacherDTO> tea_file(int tea_idx);
	
	public int tea_pwCheck_up(String user_id,String tea_pwd);
}
