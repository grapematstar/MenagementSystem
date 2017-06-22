package gyum_02.mypage.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.member.model.My_memberTeacherDTO;

public class My_ClassTestDAOImple implements My_ClassTestDAO {

private SqlSessionTemplate sqlMap;
	

	public My_ClassTestDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public int class_Workbook_Write(My_ClassTestDTO dto) {
		int count=sqlMap.insert("class_Workbook_Write",dto);
		return count;
	}
	
	public List<My_ClassTestDTO> class_Workbook_List(int cp,int ls,int idx){
		
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		HashMap map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("idx",idx);
		List<My_ClassTestDTO> list = sqlMap.selectList("class_Workbook_List",map);
		return list;
	}
	
	public int workbook_TotalCnt(int idx){	
		int count = sqlMap.selectOne("workbook_TotalCnt",idx);
		return count;
	}
	
	public int class_Question_Write(My_ClassTestDTO dto) {
		int count=sqlMap.insert("class_Question_Write",dto);
		return count;
	}
	
	public int question_Delete(My_ClassTestDTO dto){
		int count = sqlMap.delete("question_Delete",dto);
		return count;
	}
	
	public int workbook_Question_Count(int test_idx,int c_t_testnum){	
		HashMap map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("c_t_testnum", c_t_testnum);
		int count = sqlMap.selectOne("workbook_question_count",map);
		return count;
	}
	public List<My_ClassTestDTO> class_workbook_Sel(int idx){
		List<My_ClassTestDTO> list = sqlMap.selectList("workbook_question_Sel",idx);
		return list;
	}
	
	public List<My_ClassTestDTO> workbook_Question_List(HashMap map,int cp,int ls){
		
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<My_ClassTestDTO> list = sqlMap.selectList("workbook_question_List",map);
		return list;
	}

	public int workbook_Question_TotalCnt(int test_idx,int c_t_testnum,int class_idx){
		HashMap map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("c_t_testnum", c_t_testnum);
		map.put("class_idx", class_idx);
		int count = sqlMap.selectOne("question_TotalCnt",map);
		return count;
	}
	
	public int woorkbook_question_Delete(My_ClassTestDTO dto){
		int count = sqlMap.delete("woorkbook_question_Delete",dto);
		return count;
	}
	
	public int class_test_qna_option(My_ClassTestDTO dto){
		int count = sqlMap.insert("class_test_qna_option",dto);
		return count;
	}
	
	public int class_Question_Option_Write(My_ClassTestDTO dto,List<My_ClassTestDTO> list){
		int count=0;
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getTest_idx());
			System.out.println(list.get(i).getC_t_q_idx());
			System.out.println(list.get(i).getC_t_q_o_num());
			System.out.println(list.get(i).getC_t_q_o_option());
			My_ClassTestDTO tdto = list.get(i);
			count += sqlMap.insert("class_Question_Option_Write",tdto);
		}
		
		return count;
	}
	
	public int class_test_qna_c_t_q_idx(int test_idx, int c_t_q_num){
		HashMap map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("c_t_q_num", c_t_q_num);
		int count = sqlMap.selectOne("getclass_test_qna_c_t_q_idx",map);
		System.out.println(count);
		return count;
	}
	
	public List<My_ClassTestDTO> my_stuclass_question_list(int test_idx,int c_t_q_idx){
		HashMap<String,Object> map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("c_t_q_idx", c_t_q_idx);
		
		List<My_ClassTestDTO> list = sqlMap.selectList("my_stuclass_question_list",map);
		return list;
	}
	
	public My_ClassTestDTO class_question_update_select(int c_t_q_idx){
		My_ClassTestDTO dto = sqlMap.selectOne("class_qna_update_select",c_t_q_idx);
		return dto;
	}
	
	public List<My_ClassTestDTO> class_question_option_update_select(int c_t_q_idx){
		List<My_ClassTestDTO> dto = sqlMap.selectList("class_qna_option_update_select",c_t_q_idx);
		return dto;
	}
	
	public int class_question_qna_update(My_ClassTestDTO dto){
		int count = sqlMap.update("class_question_qna_update",dto);
		return count;
	}

	public int class_question_option_update(List<My_ClassTestDTO> list){
		int count = 0;
		for(int i=0;i<list.size();i++){
			My_ClassTestDTO tdto = list.get(i);
			count += sqlMap.update("class_question_option_update",tdto);			
			System.out.println("1:"+tdto.getC_t_q_o_num()+" 2:"+tdto.getC_t_q_o_option()+" 3:"+tdto.getC_t_q_idx());
		}
		return count;
	}
	
	public int class_question_delete(int c_t_q_idx){
		int count = sqlMap.delete("class_question_delete",c_t_q_idx);
		return count;
	}
	
	public int class_question_option_delete(int c_t_q_idx){
		int count = sqlMap.delete("class_question_option_delete",c_t_q_idx);
		return count;
	}
	public int class_test_qna_option_update_delete(int test_idx,int c_t_q_idx){
		HashMap map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("c_t_q_idx", c_t_q_idx);
		int count = sqlMap.delete("class_question_option_update_delete",map);
		return count;
	}
}
