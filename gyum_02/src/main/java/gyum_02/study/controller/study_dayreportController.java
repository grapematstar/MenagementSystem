package gyum_02.study.controller;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSecurity;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.DHXStatus;

import gyum_02.scheduler.controller.SchedulerVO;
import gyum_02.scheduler.controller.ShedulerDao;
import gyum_02.study.model.bbsnameStudyDAO;
import gyum_02.study.model.createStudyDAO;
import gyum_02.study.model.leaderStudyDAO;
import gyum_02.study.model.memberStudyDAO;
import gyum_02.study.model.study_bbsDAO;
@Controller
public class study_dayreportController {

	
	@Autowired
	private createStudyDAO createStudyDao;
	
	@Autowired
	private memberStudyDAO memberSDao;
	
	@Autowired
	private bbsnameStudyDAO bbsnameSDao;
	
	@Autowired
	private leaderStudyDAO leaderSDao;
	
	@Autowired
	private study_bbsDAO studybbsDao;
	
	@Autowired
	private ShedulerDao eventManagerDao;
	
    public static String date_format = "MM/dd/yyyy HH:mm";
    public static String filter_format = "yyyy-MM-dd";
    public DHXSecurity security;
    private HashMap attributes;
    private Date from;
    private Date to;
    private Boolean dynFilter;
    HttpServletRequest request;   
	
@RequestMapping("/studydayreportgo.do")
public String studydayreportgo(ModelMap model, HttpServletRequest request,HttpSession session) throws Exception {
	   int study_idx=(Integer)session.getAttribute("study_idx");
	   DHXPlanner planner = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
	   planner.localizations.set("cr");
	   planner.setWidth(1000);
	   planner.setHeight(650);
	   
	   planner.setInitialView("month");
	   
	   planner.config.setFirstHour(9);
	   planner.config.setLastHour(19);
	   planner.config.setStartOnMonday(false);
	   planner.config.setMonthDate("%Y년 %M월");
	   planner.config.setDefaultDate("%Y년 %M월 %j일");
	   planner.config.setDayDate("%D");
	   SchedulerVO sch=new SchedulerVO(0, null, null,null, study_idx,null, 1, null);
	   planner.data.dataprocessor.setURL("eventsday.do?study_idx="+study_idx);
	   planner.parse(eventManagerDao.getEvent(sch)); 
	   model.addAttribute("schedule", planner.render());
	   model.addAttribute("study_idx",study_idx);	
	   model.addAttribute("study_event_dayrepot","일일 일지");
      return "study/studydayreport";
   }
	   
	   @RequestMapping("/eventsday.do")
	   @ResponseBody 
	   public String events(HttpServletRequest request,HttpSession session) throws Exception {
		   int study_idx=(Integer)session.getAttribute("study_idx");
	       String value = request.getParameter("ids");       
	       String actions = "";
	       if(value != null)
	       {
	           String ids[] = value.split(",");
	           for(int i = 0; i < ids.length; i++)
	               actions = (new StringBuilder()).append(actions).append(saveOne(request,session ,ids[i], (new StringBuilder()).append(ids[i]).append("_").toString())).toString();

	       } else
	       {
	           value = request.getParameter("id");
	           if(value != null)
	               actions = (new StringBuilder()).append(actions).append(saveOne(request,session, value, "")).toString();
	       }
	       return (new StringBuilder()).append("<?xml version=\"1.0\"?><data>").append(actions).append("</data>").toString();	   
	   }
	   
	   private String saveOne(HttpServletRequest request,HttpSession session, String id, String prefix)
	   {int study_idx=(Integer)session.getAttribute("study_idx");
		    security = new DHXSecurity();
		    attributes = new HashMap();
		    from = null;
		    to = null;
		    dynFilter = Boolean.valueOf(true);
		   
	       String st = request.getParameter((new StringBuilder()).append(prefix).append("!nativeeditor_status").toString());
	       DHXStatus status = DHXStatus.UNKNOWN;
	       if(st.equals("insert") || st.equals("inserted"))
	           status = DHXStatus.INSERT;
	       else
	       if(st.equals("update") || st.equals("updated"))
	           status = DHXStatus.UPDATE;
	       else
	       if(st.equals("delete") || st.equals("deleted"))
	           status = DHXStatus.DELETE;
	       DHXEv ev = createEvent(id, status);
	       attributes.clear();
	       if(security.can(status).booleanValue())
	       {
	           Method m[] = ev.getClass().getMethods();
	           for(int i = 0; i < m.length; i++)
	           {
	               String name = m[i].getName();
	               if(status == DHXStatus.INSERT && name.equals("setId") || !name.startsWith("set"))
	                   continue;
	               String param = toLowerCase(name.substring(3));
	               String value = request.getParameter((new StringBuilder()).append(prefix).append(param).toString());
	               if(value == null)
	                   continue;
	               Class t[] = new Class[1];
	               t[0] = java.lang.String.class;
	               Method method = null;
	               try
	               {
	                   method = ev.getClass().getMethod(name, t);
	               }
	               catch(NoSuchMethodException e)
	               {
	                   e.printStackTrace();
	               }
	               catch(SecurityException e)
	               {
	                   e.printStackTrace();
	               }
	               try
	               {
	                   method.invoke(ev, new Object[] {
	                       value
	                   });
	               }
	               catch(IllegalAccessException e)
	               {
	                   e.printStackTrace();
	               }
	               catch(IllegalArgumentException e)
	               {
	                   e.printStackTrace();
	               }
	               catch(InvocationTargetException e)
	               {
	                   e.printStackTrace();
	               }
	           }

	           status = saveEvent(ev, status,session);
	       } else
	       {
	           status = DHXStatus.ERROR;
	       }
	       if(status == DHXStatus.UPDATE)
	           st = "update";
	       else
	       if(status == DHXStatus.DELETE)
	           st = "delete";
	       else
	       if(status == DHXStatus.INSERT)
	           st = "inserted";
	       else
	       if(status == DHXStatus.ERROR)
	           st = "error";
	       String attrs = "";
	       Set keys = attributes.keySet();
	       for(Iterator i$ = keys.iterator(); i$.hasNext();)
	       {
	           String key = (String)i$.next();
	           attrs = (new StringBuilder()).append(attrs).append(" ").append(key).append("=\"").append((String)attributes.get(key)).append("\"").toString();
	       }

	       return (new StringBuilder()).append("<action type=\"").append(st).append("\" sid=\"").append(id).append("\" tid=\"").append(ev.getId()).append("\"").append(attrs).append(" />").toString();
	   }

	   private String toLowerCase(String value)
	   {
	       String first = value.substring(0, 1);
	       String last = value.substring(1);
	       return (new StringBuilder()).append(first.toLowerCase()).append(last).toString();
	   }
	   
	  	public DHXEv createEvent(String id, DHXStatus status) {
	      	return new DHXEvent();
	}
	  	
	   	public DHXStatus saveEvent(DHXEv event, DHXStatus status,HttpSession session) {

			String start_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(event.getStart_date());
			String end_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(event.getEnd_date());
			int study_idx=(Integer)session.getAttribute("study_idx");          	
			SchedulerVO schedulervo= new SchedulerVO();
			schedulervo.setStudy_idx(study_idx);
			String stu_id=(String)session.getAttribute("id");
			schedulervo.setStu_name(stu_id);
			schedulervo.setEvent_name(event.getText());
			schedulervo.setStart_date(start_date);
			schedulervo.setEnd_date(end_date);
			
			int maxEvent_id=0;
			try {
				maxEvent_id=eventManagerDao.getmaxEvent_id();
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(event.getId()!=null){
				schedulervo.setEvent_id(event.getId());
			}else{
				schedulervo.setEvent_id((maxEvent_id+1));
			}
			
			
	        if (status == DHXStatus.UPDATE) {
	        	eventManagerDao.updateEvent(schedulervo);

	        } else if (status == DHXStatus.INSERT) {
	        	String content=stu_id+"　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　\n";
	        	content+=schedulervo.getEvent_name();
	        	schedulervo.setEvent_name(content);	        	
	        	schedulervo.setStudy_event_dayrepot(1);
	        	eventManagerDao.insertdayEvent(schedulervo);
	        	event.setId(schedulervo.getEvent_id());
	        	event.setText(content);
	        } else if (status == DHXStatus.DELETE) {
	        	eventManagerDao.deleteEvent(event.getId());
	 
	        }

	      	return status;
	}
	   	
	    protected void parseRequest()
	    {
	        if(request == null)
	            return;
	        String fromValue = request.getParameter("from");
	        String toValue = request.getParameter("to");
	        try
	        {
	            if(fromValue != null)
	                from = (new SimpleDateFormat(filter_format)).parse(fromValue);
	            if(toValue != null)
	                to = (new SimpleDateFormat(filter_format)).parse(toValue);
	        }
	        catch(ParseException e)
	        {
	            e.printStackTrace();
	        }
	    }

	    protected Boolean filterEvent(DHXEv ev)
	    {
	        if(!dynFilter.booleanValue())
	            return Boolean.valueOf(true);
	        if(from == null && to == null)
	            return Boolean.valueOf(true);
	        if(from != null && !ev.getStart_date().after(from))
	            return Boolean.valueOf(false);
	        if(to != null && !ev.getEnd_date().before(to))
	            return Boolean.valueOf(false);
	        else
	            return Boolean.valueOf(true);
	    }

	    public Date getFilterFrom()
	    {
	        return from;
	    }

	    public Date getFilterTo()
	    {
	        return to;
	    }

	    public void setDynFilter(Boolean value)
	    {
	        dynFilter = value;
	    }

	    public Date getFrom()
	    {
	        return from;
	    }

	    public void setFrom(Date from)
	    {
	        this.from = from;
	    }

	    public Date getTo()
	    {
	        return to;
	    }

	    public void setTo(Date to)
	    {
	        this.to = to;
	    }

	    public Boolean getDynFilter()
	    {
	        return dynFilter;
	    }

	    public void addResponseAttribute(String name, String value){    
	        attributes.put(name, value);
	    }
}
