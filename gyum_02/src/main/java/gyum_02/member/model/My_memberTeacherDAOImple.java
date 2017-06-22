package gyum_02.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import gyum_02.member.model.*;

public class My_memberTeacherDAOImple implements My_memberTeacherDAO {

	private SqlSessionTemplate sqlMap;

	public My_memberTeacherDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public int teacherWrite(My_memberTeacherDTO dto){
		int count = sqlMap.insert("teacherWrite", dto);
		return count;
	}
	
	public int idCheck(String tea_id){
		
		String idCheck = sqlMap.selectOne("tea_idCheck",tea_id);
		if(idCheck==null){
			System.out.println("tea_�븘�씠�뵒媛� �뾾�쓬");
			return 0;
		}else{
			System.out.println("tea_�븘�씠�뵒媛� �엳�쓬");
			return 1;
		}
	}
	
	public int login(String user_id,String user_pwd,HttpSession session){
		
		String pwd = sqlMap.selectOne("tea_login", user_id);
		if(pwd==null){
			System.out.println("�븘�씠�뵒媛� �뾾�쓬");
			return 0;
		}else{
			if(pwd.equals(user_pwd)){
				System.out.println("李�");
				getInfo(user_id, session );
				return 2;
			}else{
			System.out.println("鍮꾨�踰덊샇媛� ��由�");
			return 1;
			}
		}
	}
	
	public String pwCheck(String user_id,String user_email){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_email", user_email);
		String pwd = sqlMap.selectOne("tea_pwdCheck",map);
		if(pwd==null){
			return null;
		}else{
			return pwd;
		}
	}
	
	public My_memberTeacherDTO getInfo(String id,HttpSession session){
		
		List<My_memberTeacherDTO> list= sqlMap.selectList("get_teacher",id);
		
		My_memberTeacherDTO pdto= new My_memberTeacherDTO(list.get(0).getTea_idx(), list.get(0).getTea_id(), "-", 0 ,"-", 0,list.get(0).getTea_name(), "-", "-",0,null,null,0);
		session.setAttribute("idx", pdto.getTea_idx());
		session.setAttribute("id",pdto.getTea_id());
		session.setAttribute("name",pdto.getTea_name());
		session.setAttribute("usergrade", "teacher");
		return pdto;
	}

	public My_memberTeacherDTO getteaInfo(String id){
		My_memberTeacherDTO dto = sqlMap.selectOne("tea_info",id);
		return dto;
	}
	
	public int tea_Update(My_memberTeacherDTO dto){
		int count = sqlMap.update("tea_Update",dto);
		return count;
	}
	
	public My_memberTeacherDTO tea_InfoDel(String id){
		My_memberTeacherDTO dto = sqlMap.selectOne("tea_infoDel",id);
		return dto;
	}
	public int tea_Delete(String tea_id,String tea_pwd){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tea_id", tea_id);
		map.put("tea_pwd", tea_pwd);
		int count = sqlMap.update("tea_Delete",map);
		return count;
	}
	
	public List<My_memberTeacherDTO> tea_QnaWriteForm(String id,String usergrade){
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("usergrade",usergrade);
		List<My_memberTeacherDTO> list = sqlMap.selectList("tea_QnaWriteForm",map);
		return list;
	}
	
	public int tea_idx(String tea_id){
		int tea_idx = sqlMap.selectOne("tea_idx",tea_id);
		return tea_idx;
	}
	
	public int teacherImageFileWrite(Map<String, Object> filemap) {
		filemap.put("file_idx", 0);
		int count=sqlMap.insert("teacherImageFileWrite", filemap);
		return (Integer)filemap.get("file_idx");
	}
	
	public int teacherImageFileIdxUpdate(int tea_idx, int file_idx) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("tea_idx", tea_idx);
		map.put("file_idx", file_idx);
		int count=sqlMap.update("teacherImageFileIdxUpdate", map);
		return count;
	}
	
	public List<My_memberTeacherDTO> tea_file(int tea_idx){
		List<My_memberTeacherDTO> list = sqlMap.selectList("tea_file",tea_idx);
		return list;
	}
	
	public int tea_pwCheck_up(String user_id,String tea_pwd){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("tea_pwd",tea_pwd);
		
		int count = sqlMap.update("tea_pwCheck_up",map);
		return count;
	}
}
