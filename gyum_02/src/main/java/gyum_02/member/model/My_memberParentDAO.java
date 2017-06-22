package gyum_02.member.model;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;


public interface My_memberParentDAO<Properties> {
	
	public int parentWrite(My_memberParentDTO dto);
		
	public int idCheck(String par_id);
	
	public int login(String par_id,String par_pwd,HttpSession session);
	
	public String pwCheck(String user_id,String user_email);
	
	public My_memberParentDTO getInfo(String idx,HttpSession session);
	
	public My_memberParentDTO getparInfo(String id);
	
	public int par_Update(My_memberParentDTO dto);
	
	public My_memberParentDTO par_InfoDel(String id);
	
	public int par_Delete(String par_id,String par_pwd);
	
	public List<My_memberParentDTO> par_QnaWriteForm(String id,String usergrade);
	
	public My_memberParentDTO par_in_out_date(String user_id);
	
	public int par_pwCheck_up(String user_id,String par_pwd);
}
