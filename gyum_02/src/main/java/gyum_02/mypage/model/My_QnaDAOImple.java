package gyum_02.mypage.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
public class My_QnaDAOImple implements My_QnaDAO {

private SqlSessionTemplate sqlMap;
	
	public My_QnaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public int qna_Write(My_QnaDTO dto){
		int count = sqlMap.insert("qna_Write",dto);
		return count;
	}
	
	public List<My_QnaDTO> stu_qna_List(String id, int cp,int ls){
		HashMap map = new HashMap();
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		map.put("id", id);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List list = sqlMap.selectList("stu_qna_List",map);
		return list;
	}

	public List<My_QnaDTO> par_qna_List(String id, int cp,int ls){
		HashMap map = new HashMap();
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("id", id);
		List<My_QnaDTO> list = sqlMap.selectList("par_qna_List",map);
		return list;
	}
	
	public List<My_QnaDTO> tea_qna_List(String id, int cp,int ls){
		HashMap map = new HashMap();
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("id", id);
		List<My_QnaDTO> list = sqlMap.selectList("tea_qna_List",map);
		return list;
	}
	
	public int stu_qna_TotalCnt(String id){	
		int count = sqlMap.selectOne("stu_qna_TotalCnt",id);
		return count;
	}
	
	public int par_qna_TotalCnt(String id){	
		int count = sqlMap.selectOne("par_qna_TotalCnt",id);
		return count;
	}
	
	public int tea_qna_TotalCnt(String id){	
		int count = sqlMap.selectOne("tea_qna_TotalCnt",id);
		return count;
	}
	
	public My_QnaDTO qna_Content(int idx){
		My_QnaDTO list = sqlMap.selectOne("qna_Content",idx+"");
		return list;
	}

	public int qna_Update(My_QnaDTO dto){
		int count = sqlMap.update("qna_Update",dto);
		return count;
	}

	public int qna_reWrite(My_QnaDTO dto){
		int count = sqlMap.insert("qna_reWrite",dto);
		return count;
	}
	
	public List<My_QnaDTO> qna_reList(int cp, int ls, int idx){
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		HashMap map = new HashMap();
		map.put("idx", idx);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<My_QnaDTO> list = sqlMap.selectList("qna_reList",map);
		return list;
	}
	
	public int qna_reTotalCnt(int idx){	
		System.out.println("임플 :"+idx);
		int count = sqlMap.selectOne("qna_reTotalCnt",idx+"");
		return count;
	}
	
	public int qna_reUpdate(My_QnaDTO dto){
		int count = sqlMap.update("qna_reUpdate",dto);
		return count;
	}
}
