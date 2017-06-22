package gyum_02.cybercampus.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CC_InfoPlanDAOImple implements CC_InfoPlanDAO {

	private SqlSessionTemplate sqlMap;
	
	public CC_InfoPlanDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int cc_submitInfoPlanWrite(CC_InfoPlanDTO dto, List<CC_PlanDTO> planList) {
		int count=sqlMap.insert("cc_submitInfoPlanWrite", dto);
		if(count>0){
			for(int i=0;i<planList.size();i++){
				count+=sqlMap.insert("cc_submitPlanWrite", planList.get(i));
			}
		}
		return count;
	}

	public Map<String,Object> cc_gotoInfoPlanContent(int club_idx) {
		Map<String,Object> infoPlanMap=new HashMap<String,Object>();
		CC_InfoPlanDTO dto=sqlMap.selectOne("cc_gotoInfoPlanContent", club_idx);
		List<CC_PlanDTO> list=new ArrayList<CC_PlanDTO>();
		list=sqlMap.selectList("cc_gotoPlanContent",club_idx);
		infoPlanMap.put("dto", dto);
		infoPlanMap.put("list", list);
		
		return infoPlanMap;
	}

	public int cc_submitInfoPlanUpdate(CC_InfoPlanDTO dto, List<CC_PlanDTO> planList) {
		int count=sqlMap.update("cc_submitInfoPlanUpdate", dto);
		if(count>0){
			for(int i=0;i<planList.size();i++){
				count+=sqlMap.insert("cc_submitPlanUpdate",planList.get(i));
			}
		}
		return count;
	}
}
