package gyum_02.member.model;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.member.model.*;
public class My_memberParentDAOImple implements My_memberParentDAO {

	private SqlSessionTemplate sqlMap;
	

	public My_memberParentDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public int parentWrite(My_memberParentDTO dto){
		int count = sqlMap.insert("parentWrite", dto);
		return count;
	}
	
	public int idCheck(String par_id){
		
		String idCheck = sqlMap.selectOne("par_idCheck",par_id);
		if(idCheck==null){
			return 0;
		}else{
			return 1;
		}
	}
	public int login(String user_id,String user_pwd,HttpSession session){
		
		String pwd = sqlMap.selectOne("par_login", user_id);
		if(pwd==null){
			return 0;
		}else{
			if(pwd.equals(user_pwd)){
				getInfo(user_id, session );
				return 2;
			}else{
			return 1;
			}
		}
	}
	
	public String pwCheck(String user_id,String user_email){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_email", user_email);
		String pwd = sqlMap.selectOne("par_pwdCheck",map);
		if(pwd==null){
			return null;
		}else{
			return pwd;
		}
	}
	public My_memberParentDTO getInfo(String id,HttpSession session){
		
		List<My_memberParentDTO> list= sqlMap.selectList("get_parent",id);
			
		My_memberParentDTO pdto= new My_memberParentDTO(list.get(0).getPar_idx(), list.get(0).getPar_id(), "-", 0 ,"-", list.get(0).getPar_name(), "-", "-", null);
		session.setAttribute("idx", pdto.getPar_idx());
		session.setAttribute("id",pdto.getPar_id());
		session.setAttribute("name",pdto.getPar_name());
		session.setAttribute("usergrade", "parent");
		System.out.println("�엫�뵆"+id);
		return pdto;
	}
	
	public My_memberParentDTO getparInfo(String id){
		My_memberParentDTO dto = sqlMap.selectOne("par_info",id);
		return dto;
	}
	
	public int par_Update(My_memberParentDTO dto){
		int count = sqlMap.update("par_Update",dto);
		return count;
	}
	
	public My_memberParentDTO par_InfoDel(String id){
		My_memberParentDTO dto = sqlMap.selectOne("par_infoDel",id);
		return dto;
	}
	public int par_Delete(String par_id,String par_pwd){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("par_id", par_id);
		map.put("par_pwd", par_pwd);
		int count = sqlMap.update("par_Delete",map);
		return count;
	}
	
	public List<My_memberParentDTO> par_QnaWriteForm(String id,String usergrade){
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("usergrade",usergrade);
		List<My_memberParentDTO> list = sqlMap.selectList("par_QnaWriteForm",map);
		return list;
	}
	
	public My_memberParentDTO par_in_out_date(String user_id){
		My_memberParentDTO dto = sqlMap.selectOne("par_in_out_date",user_id);
		return dto;
	}
	
	public int par_pwCheck_up(String user_id,String par_pwd){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("par_pwd",par_pwd);
		
		int count = sqlMap.update("par_pwCheck_up",map);
		return count;
	}
}
