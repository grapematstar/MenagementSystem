package gyum_02.member.model;

import javax.servlet.http.HttpSession;

public interface My_memberLoyalDAO {

	public int login(String user_id,String user_pwd,HttpSession session);
	
	public My_memberLoyalDTO getInfo(String id,HttpSession session);
}
