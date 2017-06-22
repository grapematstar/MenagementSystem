package gyum_02.sugang.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class SgfavorDAOImple implements SgFavorDAO {

	private SqlSessionTemplate sqlMap;	
	
	public SgfavorDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<SgFavorDTO> sgFavorList(int stu_idx) {
		System.out.println("stuidx List Method:"+stu_idx);
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("stu_idx", stu_idx);
		List<SgFavorDTO> sgfavorList = sqlMap.selectList("sgFavorList", forSubmit);
		
		return sgfavorList;
	}
	
	public int sgFavorInsert(int user_idx, List<String> arrayParam){
		int count = 0;
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("user_idx", user_idx);
		
		for(int i=0;i<arrayParam.size();i++){
			int select_idx = Integer.parseInt(arrayParam.get(i));
			forSubmit.put("select_idx", select_idx);
			if(sqlMap.selectList("insertchk",forSubmit).isEmpty()){
				count += sqlMap.insert("sgFavorInsert", forSubmit);
			}
		}
		return count;
	}
	
	public int sgFavorDelete(int user_idx,List<String> arrayParam){
		int count = 0;
		Map<String,Integer> forSubmit = new HashMap<String,Integer>();
		forSubmit.put("user_idx", user_idx);
		
		for(int i=0;i<arrayParam.size();i++){
			int class_idx = Integer.parseInt(arrayParam.get(i));
			forSubmit.put("class_idx", class_idx);
			count += sqlMap.delete("sgFavorDelete", forSubmit);
		}
		return count;
	}

}
