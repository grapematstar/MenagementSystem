package gyum_02.main_TeacherInfo.Model;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.cybercampus.Model.CC_EpilogueDTO;
import gyum_02.member.model.My_memberTeacherDTO;
import gyum_02.mypage.model.My_ClassDTO;

public class TeacherInfoDAOImple implements TeacherInfoDAO {

	private SqlSessionTemplate sqlMap;
	
	public TeacherInfoDAOImple(SqlSessionTemplate sqlMap) {
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
	
	public int teacherGetTotal(int sub) {
		Map map = new HashMap();
		map.put("sub", sub);
		int total = sqlMap.selectOne("teacherGetTotal", map);
		return total;
	}

	public List<My_memberTeacherDTO> teacherInfoList(int cp, int ls, int sub) {
		int startnum = (cp-1)*ls+1;
		int endnum = (cp*ls);

		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("sub", sub);
		
		List<My_memberTeacherDTO> list = sqlMap.selectList("teacherList", map);
		return list;
	}

	public My_memberTeacherDTO teacherInfoContent(int idx) {
		List<My_memberTeacherDTO> list = sqlMap.selectList("teacherInfoCon", idx);
		
		My_memberTeacherDTO dto = null;
		if(!(list==null||list.size()==0)) {
			dto = list.get(0);
		}
		return dto;
	}
	
	public List<My_ClassDTO> nowClassContentList(int idx) {
		int nowdate = nowdateInteger();
		Map map = new HashMap();
		map.put("nowdate", nowdate);
		map.put("idx", idx);
		List<My_ClassDTO> list = sqlMap.selectList("classInfoCon", map);

		return list;
	}
	
	public List<My_ClassDTO> lastClassContent(int idx) {
		int nowdate = nowdateInteger();
		Map map = new HashMap();
		map.put("nowdate", nowdate);
		map.put("idx", idx);
		List<My_ClassDTO> list = sqlMap.selectList("lastclassInfoCon", map);
		return list;
	}
	
	public List<CC_EpilogueDTO> epilContent(int cp, int ls, List<My_ClassDTO> list) {
		
		int startnum = (cp-1)*ls+1;
		int endnum = (cp*ls);
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("list", list);
		List<CC_EpilogueDTO> epil = sqlMap.selectList("lastclass_review", map);
		return epil;
	}
	
	public int totalLastEpil (List<My_ClassDTO> list){
		Map<String,Object> map = new HashMap();
		map.put("list", list);
		int total = sqlMap.selectOne("lastclass_reviewTotal", map);
		return total;
	}

	public My_ClassDTO classInfoContent(int class_idx) {
		
		Map map = new HashMap();
		map.put("idx", class_idx);
		List<My_ClassDTO> list = sqlMap.selectList("nowclassInfo", map);

		My_ClassDTO dto = null;
		
		if(!(list==null||list.size()==0)) {
			dto = list.get(0);
		}
		return dto;
	}
	
	public List<CC_EpilogueDTO> nowepilContent(int cp, int ls, int idx) {
		
		int startnum = (cp-1)*ls+1;
		int endnum = (cp*ls);
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("idx", idx);
		List<CC_EpilogueDTO> epil = sqlMap.selectList("nowepilCon", map);
		
		return epil;
	}
	
	public int nowepilGetTotal(int idx) {
		System.out.println(idx);
		int total = sqlMap.selectOne("nowepilGetTotal", idx);
		System.out.println("222");
		return total;
	}
	
	public My_ClassDTO nowClassContent(int idx) {
		int nowdate = nowdateInteger();
		List<My_ClassDTO> list = sqlMap.selectList("nowclassinfo", idx);

		My_ClassDTO dto = null;
		if(!(list==null||list.size()==0)) {
			dto = list.get(0);
		}
		return dto;
	}
}
