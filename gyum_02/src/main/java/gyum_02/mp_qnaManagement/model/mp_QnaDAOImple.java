package gyum_02.mp_qnaManagement.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.commons.testMode;
import gyum_02.mp_academyStatus.model.mp_TeacherDTO;

public class mp_QnaDAOImple implements mp_QnaDAO {

	private SqlSessionTemplate sqlMap;
	
	public mp_QnaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List mpQnaAllList(int cp, int listSize) {
		HashMap map = new HashMap();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		if(testMode.mode){
			ArrayList<mp_QnaDTO> arr = new ArrayList<mp_QnaDTO>();
			for(int i=startNum-1, j=0; i<endNum && i<testMode.qnaTotalNum; i++, j++){
				int qna_idx = i+1;
				String qna_subject = "이것은 제목_"+qna_idx;
				String qna_writer = "idddsd"+qna_idx;
				Date qna_writedate = new Date();
				String q_k_kind = "idddsd"+qna_idx;
				int qna_reply = qna_idx%2;
				
				mp_QnaDTO dto = new mp_QnaDTO(qna_idx, qna_subject,
						qna_writer, qna_writedate, q_k_kind, qna_reply);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpQnaAllList", map);
		}
	}

	public List mpQnaContent(int qna_idx) {
		if(testMode.mode){
			String qna_subject = "이것은 제목_"+qna_idx;
			String qna_writer = "idddsd"+qna_idx;
			Date qna_writedate = new Date();
			String q_k_kind = "idddsd"+qna_idx;
			int qna_reply = qna_idx%2;
			String qna_content = "이것은 내용_"+qna_idx+"___이것은 내용_"+qna_idx+"___이것은 내용_"+qna_idx+
					"___이것은 내용_"+qna_idx+"___이것은 내용_"+qna_idx+"___이것은 내용_"+qna_idx+
					"___이것은 내용_"+qna_idx+"___이것은 내용_"+qna_idx+"___이것은 내용_"+qna_idx+
					"___이것은 내용_"+qna_idx+"___이것은 내용_"+qna_idx+"___이것은 내용_"+qna_idx;
				
			mp_QnaDTO dto = new mp_QnaDTO(qna_idx, qna_subject, qna_writer, qna_writedate, 
					qna_content, q_k_kind, qna_reply);
			ArrayList<mp_QnaDTO> arr = new ArrayList<mp_QnaDTO>();
			arr.add(dto);
			return arr;
		}else{
			return sqlMap.selectList("mpQnaContent", qna_idx);
		}
	}

	public int mpQnaDelete(int qna_idx, int qna_row) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("qna_idx", qna_idx);
		if(qna_row != 1) map.put("qna_row", qna_row);
		
		if(testMode.mode){
			return 1;
		}else{
			return sqlMap.delete("mpQnaDelete", map);
		}
	}

	public int mpQnaReWrite(mp_QnaDTO dto) {
		if(testMode.mode){
			return 1;
		}else{
			return sqlMap.insert("mpQnaReWrite", dto);
		}
	}

	public int mpQnaTotalCnt() {
		if(testMode.mode){
			return testMode.qnaTotalNum;
		}else{
			return sqlMap.selectOne("mpQnaTotalCnt");
		}
	}

}
