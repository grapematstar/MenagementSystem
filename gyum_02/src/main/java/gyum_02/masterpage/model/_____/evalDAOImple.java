package gyum_02.masterpage.model._____;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.commons.testMode;

public class evalDAOImple implements evalDAO {
	private SqlSessionTemplate sqlMap;
	
	public evalDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List mpStudentEvalInfo(int class_idx, String stu_name) {
		HashMap map = new HashMap();
		map.put("class_idx", class_idx);
		map.put("stu_name", stu_name);
		if(testMode.mode){
			ArrayList<mp_EvalDTO> arr = new ArrayList<mp_EvalDTO>();
			for(int i=0; i<testMode.evalTotalNum; i++){
				int stu_idx = i+1;
				int tea_idx = stu_idx*3;
				float eval_avg =  Float.parseFloat((2+stu_idx)+"")/3;
				if(stu_name.equals("")){
					stu_name = "학생이름_"+stu_idx;
				}
				String tea_name = "선생 이름_"+stu_idx;
				String class_subject = "반 이름_"+stu_idx;
				Date c_e_writedate = new Date();
				String c_e_note = "컨텐츠_"+stu_idx;
				
				mp_EvalDTO dto = new mp_EvalDTO(stu_idx, class_idx, tea_idx,
						eval_avg, stu_name, tea_name, class_subject,
						c_e_writedate, c_e_note);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpStudentEvalInfo", map);
		}
	}

	public List mpQuestionList() {
		if(testMode.mode){
			ArrayList<mp_EvalDTO> arr = new ArrayList<mp_EvalDTO>();
			for(int i=0; i<testMode.evalQuestion; i++){
				int c_e_q_idx = i;
				String c_e_q_question = "질문_"+i+"?";
				mp_EvalDTO dto = new mp_EvalDTO(c_e_q_idx, c_e_q_question);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpQuestionList");
		}
	}

	public mp_EvalDTO mpEvalInfo(int stu_idx, int class_idx) {
		HashMap map = new HashMap();
		map.put("stu_idx", stu_idx);
		map.put("class_idx", class_idx);
		if(testMode.mode){
			mp_EvalDTO dto = new mp_EvalDTO();
			return dto;
		}else{
			return (mp_EvalDTO)sqlMap.selectList("mpEvalInfo", map).get(0);
		}
	}

	public List mpTeacherEvalList(String searchText) {
		if(testMode.mode){
			ArrayList<mp_EvalDTO> arr = new ArrayList<mp_EvalDTO>();
			for(int i=0; i<testMode.evalTotalNum; i++){
				int tea_idx = i*3;
				int class_idx = i*7;
				float eval_avg =  Float.parseFloat((2+tea_idx)+"")/3;
				String tea_name = "선생 이름_"+tea_idx;
				String class_subject = "반 이름_"+tea_idx;
				Date min_c_e_writedate = new Date();
				Date max_c_e_writedate = new Date();
				int stu_on_eval = i*3;
				int stu_total = i*7;
				
				mp_EvalDTO dto = new mp_EvalDTO(class_idx, tea_idx,
						tea_name, class_subject, eval_avg, min_c_e_writedate,
						max_c_e_writedate, stu_on_eval, stu_total);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpTeacherEvalList", searchText);
		}
	}

	public mp_EvalDTO mpEvalAvgInfo(int class_idx) {
		if(testMode.mode){
			mp_EvalDTO dto = new mp_EvalDTO();
			return dto;
		}else{
			return (mp_EvalDTO)sqlMap.selectList("mpEvalAvgInfo", class_idx).get(0);
		}
	}

}
