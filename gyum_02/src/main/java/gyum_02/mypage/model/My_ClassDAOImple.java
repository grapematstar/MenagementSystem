package gyum_02.mypage.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.member.model.My_memberTeacherDTO;

public class My_ClassDAOImple implements My_ClassDAO {

	private SqlSessionTemplate sqlMap;
	

	public My_ClassDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public int class_Open(My_ClassDTO dto){
		int count = sqlMap.insert("class_Write",dto);	
		return count;
	}

	public int class_Open_Check(int class_idx) {
		int count=sqlMap.insert("class_Write_check",class_idx);
		return count;
	}
	
	public int class_idxCheck(){
		int class_idx = sqlMap.selectOne("class_idxcheck");
		return class_idx;
	}
	
	public My_ClassDTO class_Content(int idx){
		My_ClassDTO dto = sqlMap.selectOne("class_Content",idx);
		return dto;
	}
	
	public int class_Update(My_ClassDTO dto,int idx){
		HashMap map = new HashMap();
		map.put("dto", dto);
		map.put("idx", idx);
		int count = sqlMap.update("class_Content_Update",map);
		return count;
	}
}
