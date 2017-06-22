package gyum_02.cybercampus.Model;

import java.util.List;
import java.util.Map;

public interface CC_InfoPlanDAO {
	 public int cc_submitInfoPlanWrite(CC_InfoPlanDTO dto,List<CC_PlanDTO> planList);
	 public Map<String,Object> cc_gotoInfoPlanContent(int club_idx);
	 public int cc_submitInfoPlanUpdate(CC_InfoPlanDTO dto,List<CC_PlanDTO> planList);
}
