package gyum_02.main_Search.model;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.Freebbs.model.FreebbsDTO;
import gyum_02.cybercampus.Model.CC_EpilogueDTO;
import gyum_02.member.model.My_memberTeacherDTO;
import gyum_02.mypage.model.My_ClassDTO;
import gyum_02.mypage.model.My_QnaDTO;
import gyum_02.notice.model.NoticeDTO;
import gyum_02.study.model.createStudyDTO;

public class SearchDAOImple implements SearchDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SearchDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int nowdateInteger () {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date = cal.get(Calendar.DATE);
	
		int nowdate = year*10000+month*100+date;
		
		return nowdate;
	}
	
	public List<My_ClassDTO> classSearch(int ls, String word, int ss) {
		
		List<My_ClassDTO> list = null;
		Map<String,Object> map = new HashMap<String, Object>();
		int nowdate = 0;
		nowdate = nowdateInteger();
		
		map.put("word", word);
		map.put("nowdate", nowdate);
		if(ls==5){
			map.put("ls", ls);
			list = sqlMap.selectList("classSearch", map);
		} else {
			list = sqlMap.selectList("classAllSearch", map);
		}
		return list;
	}
	
	public List<My_memberTeacherDTO> teacherSearch(String word, int ss) {
		
		List<My_memberTeacherDTO> list = null;
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("word", word);
		
		list = sqlMap.selectList("teacherAllSearch", map);
		return list;
	}
	
	public List<CC_EpilogueDTO> classReviewSearch(String word, int ss) {
		
		List<CC_EpilogueDTO> list = null;
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("word", word);
		list = sqlMap.selectList("classReviewAllSearch", map);
		return list;
	}
	
	public List<FreebbsDTO> freebbsSearch(String word, int ss) {

		List<FreebbsDTO> list = null;
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("word", word);
		switch (ss) {
		case 0:
			list = sqlMap.selectList("freebbsAllSearch", map);
			break;
			
		case 1:
			list = sqlMap.selectList("freebbsWriterSearch", map);
			break;
			
		case 2:
			list = sqlMap.selectList("freebbsSubSearch", map);
			break;
			
		case 3:
			list = sqlMap.selectList("freebbsConSearch", map);
			break;
			
		default:
			break;
		}
		return list;
	}
	
	public List<NoticeDTO> noticeSearch(String word, int ss) {
		
		List<NoticeDTO> list = null;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("word", word);
		switch (ss) {
		case 0:
			list = sqlMap.selectList("noticeAllSearch", map);
			break;
			
		case 1:
			list = null;
			break;
			
		case 2:
			list = sqlMap.selectList("noticeSubSearch", map);
			break;
			
		case 3:
			list = sqlMap.selectList("noticeConSearch", map);
			break;
			
		default:
			break;
		}
		return list;
	}
}
