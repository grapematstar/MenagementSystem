package gyum_02.mypage.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

public class My_ClassCheckDAOImple implements My_ClassCheckDAO {

private SqlSessionTemplate sqlMap;
	

	public My_ClassCheckDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public int class_checkWrite(int class_idx){
		int count = sqlMap.insert("class_checkWrite",class_idx);
		return count;
	}
	
	public List<My_ClassDTO> c_class_CheckList(int cp,int ls,int idx){
		
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("idx",idx);
		List<My_ClassDTO> list = sqlMap.selectList("class_c_checkList",map);
		return list;
	}
	
	public List<My_ClassDTO> nc_class_CheckList(int cp,int ls,int idx){
		
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("idx",idx);
		List<My_ClassDTO> list = sqlMap.selectList("class_nc_checkList",map);
		return list;
	}
	
	public int c_ck_TotalCnt(int idx){	
		int count = sqlMap.selectOne("c_ck_TotalCnt",idx);
		return count;
	}
	
	public int nc_ck_TotalCnt(int idx){	
		int count = sqlMap.selectOne("nc_ck_TotalCnt",idx);
		return count;
	}
}
