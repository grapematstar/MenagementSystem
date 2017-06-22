package gyum_02.member.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

public class My_memberLoyalDAOImple implements My_memberLoyalDAO {

private SqlSessionTemplate sqlMap;
	

	public My_memberLoyalDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public int login(String user_id,String user_pwd,HttpSession session){
		
		String pwd = sqlMap.selectOne("mas_login", user_id);
		if(pwd==null){
			System.out.println("아이디가 없음");
			return 0;
		}else{
			if(pwd.equals(user_pwd)){
				System.out.println("참");
				getInfo(user_id, session );
				return 2;
			}else{
			System.out.println("비밀번호가 틀림");
			return 1;
			}
		}
	}
	
	public My_memberLoyalDTO getInfo(String id,HttpSession session){
		
		List<My_memberLoyalDTO> list= sqlMap.selectList("get_master",id);
			
		My_memberLoyalDTO pdto= new My_memberLoyalDTO(list.get(0).getMas_idx(), list.get(0).getMas_id(), "-" , list.get(0).getMas_name(), "-", "-", null);
		session.setAttribute("idx", pdto.getMas_idx());
		session.setAttribute("id",pdto.getMas_id());
		session.setAttribute("name",pdto.getMas_name());
		session.setAttribute("usergrade", "master");
		System.out.println("임플"+id);
		return pdto;
	}
}
