package gyum_02.mypage.model;

import java.util.ArrayList;
import java.util.*;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class My_StuClassDAOImple implements My_StuClassDAO {

	private SqlSessionTemplate sqlMap;

	public My_StuClassDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<My_StuClassDTO> class_check_History(int cp,int ls,int idx){
		HashMap map = new HashMap();
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("idx", idx);
		List<My_StuClassDTO> list = sqlMap.selectList("CheckHistory_List",map);
		return list;
	}
	
	public int stu_checkhisroty_TotalCnt(int idx){
		int count = sqlMap.selectOne("checkHistory_TotalCnt",idx);
		return count;
	}
	
	public List<My_StuClassDTO> stuclass_Test_List(int cp,int ls, int idx){
		HashMap<String,Object> map = new HashMap();
		int startnum = (cp-1)*ls+1;
		int endnum = cp*ls;
		
		System.out.println("�엫�뵆"+idx+"st/en"+startnum+"//"+endnum);
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("idx", idx);
		System.out.println(map.get("idx"));
		List<My_StuClassDTO> list = sqlMap.selectList("my_stuclass_test_List",map);
		return list;
	}
	
	public List<My_StuClassDTO> my_stuclass_question_list(int test_idx,int c_t_q_idx){
		HashMap<String,Object> map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("c_t_q_idx", c_t_q_idx);
		
		List<My_StuClassDTO> list = sqlMap.selectList("my_stuclass_question_list",map);
		return list;
	}
	public int stuclass_test_TotalCnt(int idx){
		int count = sqlMap.selectOne("stuclass_test_TotalCnt",idx);
		return count;
	}
	
	public My_StuClassDTO stu_Test_Reply(int idx){
		My_StuClassDTO list = sqlMap.selectOne("stu_test_reply",idx);
		return list;
	}
	
	public My_StuClassDTO stu_nextTest_Reply(int idx,int num){
		HashMap map = new HashMap();
		map.put("idx", idx);
		map.put("num", num);
		My_StuClassDTO dto = sqlMap.selectOne("stu_nexttest_reply",map);
		return dto;
	}
	
	public int class_test_student_reply(My_StuClassDTO dto){
		int count = sqlMap.insert("class_test_student_reply",dto);
		return count;
	}
	
	public int stu_test_reply_maxnum(int idx){
		int count = sqlMap.selectOne("stu_test_reply_max",idx);
		return count;
	}
	
	public List<My_StuClassDTO> class_test_student_select(int stu_idx,int test_idx){
		HashMap map = new HashMap();
		map.put("stu_idx", stu_idx);
		map.put("test_idx", test_idx);
		
		List<My_StuClassDTO> list = sqlMap.selectList("class_test_student_select",map);
		return list;
	}
	
	public int class_test_student_answer_update(int stu_idx,int c_t_q_idx){
		HashMap map = new HashMap();
		map.put("stu_idx", stu_idx);
		map.put("c_t_q_idx", c_t_q_idx);
		int count = sqlMap.update("class_test_student_answer_update",map);
		return count;
	}
	
	public int class_test_student_answer_upno(int stu_idx,int c_t_q_idx){
		HashMap map = new HashMap();
		map.put("stu_idx", stu_idx);
		map.put("c_t_q_idx", c_t_q_idx);
		int count = sqlMap.update("class_test_student_answer_upno",map);
		return count;
	}
	
	public int class_test_student_sum_count(int stu_idx){
		int count = sqlMap.selectOne("class_test_student_sum_count", stu_idx);
		return count;
	}
	
	public int class_test_student_sum_test(int stu_idx){
		int count = sqlMap.selectOne("class_test_student_sum_test",stu_idx);
		return count;
	}
	
	public int class_test_student_sum_test_score(int stu_idx){
		int count = sqlMap.selectOne("class_test_student_sum_test_score",stu_idx);
		return count;
	}
	
	public int class_test_student_rain_count(int stu_idx){
		int count = sqlMap.selectOne("class_test_student_rain_count",stu_idx);
		return count;
	}
	
	public List<My_StuClassDTO> class_test_qnaAll(int test_idx){
		List<My_StuClassDTO> list=sqlMap.selectList("class_test_qnaAll", test_idx);
		return list;
	}
	
	public List<My_StuClassDTO> class_test_solved_problem(int idx, int test_idx){
	HashMap map = new HashMap();
	
	map.put("idx", idx);
	map.put("test_idx", test_idx);
	List<My_StuClassDTO> list = sqlMap.selectList("class_test_solved_problem",map);
	return list;
	}
	
	public List<My_StuClassDTO> class_test_wrong_answer(int idx,int test_idx){
		HashMap map = new HashMap();
		
		map.put("idx", idx);
		map.put("test_idx", test_idx);
		List<My_StuClassDTO> list = sqlMap.selectList("class_test_wrong_answer",map);
		return list;
	}
	
	public int class_test_student_time(int test_idx,int stu_idx){
		HashMap map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("stu_idx", stu_idx);
		map.put("class_test_start_time", new Date());
		
		int count = sqlMap.insert("class_test_student_time",map);
		return count;
	}
	
	public String class_test_start_time(int test_idx,int stu_idx){
		HashMap map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("stu_idx", stu_idx);
		System.out.println("시작시간 불러오기");
		String list="";
		try {
			list = sqlMap.selectOne("class_test_start_time",map);
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		
		
		if(list==null||list.equals("")){
			System.out.println("저장된게 없음 ");
			My_StuClassDTO dto = new My_StuClassDTO();
			dto.setClass_test_start_time(new Date());
		}else{
			System.out.println("있는데 : "+list);
	} 
		return list;
	}
	
	public List<My_StuClassDTO> class_test_student_reply_size(int test_idx,int stu_idx){
		HashMap map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("stu_idx", stu_idx);
		
		List<My_StuClassDTO> list = sqlMap.selectList("class_test_student_reply_size",map);
		return list;
	}
	
	public List<My_StuClassDTO> class_test_qna_size(int test_idx,int stu_idx){
		HashMap map = new HashMap();
		map.put("test_idx", test_idx);
		map.put("stu_idx", stu_idx);
		
		List<My_StuClassDTO> list = sqlMap.selectList("class_test_qna_size",map);
		return list;
	}
	public int class_test_reply_timezero(int c_t_q_idx,int stu_idx){
		HashMap map = new HashMap();
		map.put("c_t_q_idx", c_t_q_idx);
		map.put("stu_idx", stu_idx);
		int count = sqlMap.insert("class_test_reply_timezero",map);
		return count;
	}
}
