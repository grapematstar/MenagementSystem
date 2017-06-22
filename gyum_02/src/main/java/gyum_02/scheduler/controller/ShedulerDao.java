package gyum_02.scheduler.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dhtmlx.planner.DHXEv;

public interface ShedulerDao {

	Iterable<DHXEv> getEvent(SchedulerVO sch);
	Iterable<DHXEv> getdayEvent(int study_idx);
	int updateEvent(SchedulerVO schedule);

	int insertEvent(SchedulerVO schedule);

	int deleteEvent(int id);

	int insertdayEvent(SchedulerVO schedule);
	int getmaxEvent_id();
	List<SchedulerVO> getevent_list(SchedulerVO sch);
}