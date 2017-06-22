package gyum_02.scheduler.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;

public class SchedulerImple implements ShedulerDao {
	
	private SqlSessionTemplate sqlMap;
	HttpServletRequest request;

	
	 
	public SchedulerImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public Iterable<DHXEv> getEvent(SchedulerVO sch) {
		
		DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
      	List evs = new ArrayList();      		
		    List<SchedulerVO> resultset = sqlMap.selectList("scheduler.getEvent",sch);
		    
		    for(int i = 0; i < resultset.size(); i++){
		      	DHXEvent e = new DHXEvent();
		      	e.setId(resultset.get(i).getEvent_id());
		          e.setText(resultset.get(i).getEvent_name());
		          e.setStart_date(resultset.get(i).getStart_date());
		          e.setEnd_date(resultset.get(i).getEnd_date());
		      	evs.add(e);
		    }
      	DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";
		return evs;
	}

	public  List<SchedulerVO> getevent_list(SchedulerVO sch){
		 List<SchedulerVO> resultset = sqlMap.selectList("scheduler.getEvent",sch);
		 return resultset;
	}
	
	
	public Iterable<DHXEv> getdayEvent(int study_idx) {	
		DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
      	List evs = new ArrayList();      		
		    List<SchedulerVO> resultset = sqlMap.selectList("scheduler.getdayEvent",study_idx);
		    
		    for(int i = 0; i < resultset.size(); i++){
		      	DHXEvent e = new DHXEvent();
		      	e.setId(resultset.get(i).getEvent_id());
		          e.setText(resultset.get(i).getEvent_name());
		          e.setStart_date(resultset.get(i).getStart_date());
		          e.setEnd_date(resultset.get(i).getEnd_date());
		      	evs.add(e);
		    }
      	DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";
		return evs;
	}
	
	
	public int updateEvent(SchedulerVO schedule) {
		int count=sqlMap.update("scheduler.updateEvent", schedule); 
		return count;

	}

	public int insertEvent(SchedulerVO schedule) {
		int count=sqlMap.insert("scheduler.insertEvent", schedule);
		return count;
	}
 
	public int deleteEvent(int id) {
		int count=sqlMap.delete("scheduler.deleteEvent", id);
		return count;
		

	}
	
	public int insertdayEvent(SchedulerVO schedule) {
		int count=sqlMap.insert("scheduler.insertdayEvent", schedule);
		return count;
	}

	public int getmaxEvent_id(){
		int event_id=sqlMap.selectOne("getMaxEvent_id");
		return event_id;
	}

}
