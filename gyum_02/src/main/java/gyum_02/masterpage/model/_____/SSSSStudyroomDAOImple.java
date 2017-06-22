package gyum_02.masterpage.model._____;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;

import gyum_02.scheduler.controller.SchedulerVO;

public class SSSSStudyroomDAOImple implements SSSSStudyroomDAO {
	private SqlSessionTemplate sqlMap;

	
	 
	public SSSSStudyroomDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


}
