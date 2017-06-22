package gyum_02.study.controller;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSecurity;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.DHXStatus;

import gyum_02.scheduler.controller.SchedulerVO;
import gyum_02.scheduler.controller.ShedulerDao;
import gyum_02.study.model.*;

@Controller
public class studyListController {
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
   
   @Autowired
   private votebbsDAO vbbsDao;
   @Autowired
   private voteconListDAO vclDao;
   @Autowired
   private voterDAO voterDao;
   @Autowired
   private filebbsDAO filebbsDao;
   @Autowired
   private fileuploadDAO fileuploadDao;
   
    public static String date_format = "MM/dd/yyyy HH:mm";
    public static String filter_format = "yyyy-MM-dd";
    public DHXSecurity security;
    private HashMap attributes;
    private Date from;
    private Date to;
    private Boolean dynFilter;
    HttpServletRequest request;   
    
   @RequestMapping("/studyListgo.do")
   public ModelAndView studygo(){      
      ModelAndView mav=new ModelAndView();
      mav.addObject("msg",null);
      mav.setViewName("study/studylist");   
      return mav;         
   }
   
   @RequestMapping("/studyList.do")
   public ModelAndView studylist(@RequestParam(value="cp",defaultValue="1")int cp){      
      int total=createStudyDao.get_study_total();
      if(total==0){
         total=1;
      }
      int ls=15;
       int ps=10;
       String page=study_paging.pageMake("studylist", total, ls, ps, cp);
      List<createStudyDTO> list=createStudyDao.studylist(cp,ls);
      ModelAndView mav=new ModelAndView();
      mav.addObject("page",page);
      mav.addObject("list",list);
      mav.setViewName("yongJson");
      return mav;
   }
   
   
   @RequestMapping("/studyadd.do")
   public ModelAndView studyadd(createStudyDTO dto,HttpSession session){      
      ModelAndView mav=new ModelAndView();      
      String usergrade=(String)session.getAttribute("usergrade");
       if(usergrade==null||usergrade.equals("")){          
          mav.addObject("msg","You need LOGIN");
             
      }else if(usergrade.equals("student")){
         String stu=(String)session.getAttribute("id");
         int result=createStudyDao.studyadd(dto,session);      
      }else{
         mav.addObject("msg","You are not a student");   
      }
         mav.setViewName("yongJson");
      
      return mav;      
   }
   @RequestMapping("/studymodi.do")
   public ModelAndView studymodi(createStudyDTO dto,HttpSession session){      
      ModelAndView mav=new ModelAndView();      
      String usergrade=(String)session.getAttribute("usergrade");
      int study_idx=(Integer)session.getAttribute("study_idx");
      dto.setStudy_idx(study_idx);
       if(usergrade==null||usergrade.equals("")){          
          mav.addObject("msg","You need LOGIN");
             
      }else if(usergrade.equals("student")){
         String stu=(String)session.getAttribute("id");
         int result=createStudyDao.studymodi(dto,session);      
      }else{
         mav.addObject("msg","You are not a student");   
      }
         mav.setViewName("yongJson");
      
      return mav;      
   }
   @RequestMapping("/study.do")
   public ModelAndView study(int study_idx,HttpSession session){      
      ModelAndView mav=new ModelAndView();
      session.setAttribute("study_idx",study_idx);      
      System.out.println("study.do study_idx="+study_idx);
    		 
      if((String)session.getAttribute("id")== null){
         mav.setViewName("index");         
            return mav;   
      }
      List<createStudyDTO> study=createStudyDao.getstudyinfo(study_idx);
      
      List<bbsnameStudyDTO> list=bbsnameSDao.bbsnamelist(session);
      session.setAttribute("bbsnamelist",list);
      
       SchedulerVO sch=new SchedulerVO(0, null, null,null, study_idx,null, 0, null);
      List<SchedulerVO> schlist=eventManagerDao.getevent_list(sch);
      for(int i=0;i<schlist.size();i++){
         schlist.get(i).setStart_date(schlist.get(i).getStart_date().substring(6,11));
         schlist.get(i).setEnd_date(schlist.get(i).getEnd_date().substring(6,11));
      }
      study_bbsDTO study_bbsdto=new study_bbsDTO();
      study_bbsdto.setStudy_idx(study_idx);
      study_bbsdto.setStudy_bbsref(0);
      List<study_bbsDTO> noticelist=studybbsDao.study_bbslist(study_bbsdto);
      
      List<votebbsDTO> votebbslist=vbbsDao.getvotebbsList(study_idx,1,15);      
      List<filebbsDTO> databbslist=filebbsDao.getfilebbsList(study_idx,1,15);
      mav.addObject("study",study.get(0));
      mav.addObject("votebbslist",votebbslist);
      mav.addObject("databbslist",databbslist);
      mav.addObject("schlist",schlist);
      mav.addObject("noticelist",noticelist);
      mav.setViewName("study/study");         
      return mav;   
   }
   
   @RequestMapping("/memcheck.do")
   public ModelAndView memcheck(int study_idx,HttpSession session){
      ModelAndView mav=new ModelAndView();
      String usergrade=(String)session.getAttribute("usergrade");
      if(usergrade.equals("student")){
         String stu=(String)session.getAttribute("id");
         if(stu==null){
            mav.addObject("msg","You are not a student");
         }else{      
            int mem=memberSDao.membercheck(session,study_idx);
                  
            if(mem==0){
               mav.addObject("msg","You are not a member");
            }else{
                        
            }
         }
      }else{
         mav.addObject("msg","You need LOGIN!!!");
      }
      mav.setViewName("yongJson");
      return mav;   
   }
   @RequestMapping("/studyvotebbsgo.do")
   public ModelAndView studyvotebbsgo(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
	   session.setAttribute("study_votebbs_cp", cp);     
      session.setAttribute("votebbsgo_check", 0);
	   ModelAndView mav=new ModelAndView();      
      mav.setViewName("study/studyvotebbs");      
      return mav;
   }
   

   
   
   @RequestMapping("/studydatabbsgo.do")
   public ModelAndView study_databbsgo(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
	   session.setAttribute("study_filebbs_cp", cp);     
	      session.setAttribute("filebbsgo_check", 0);
      ModelAndView mav=new ModelAndView();
      
      mav.setViewName("study/study_filebbs");      
      return mav;      
   }

   @RequestMapping("/studybbsgo.do")   
   public ModelAndView studybbsgo(int study_bbsref,HttpSession session){
      session.setAttribute("study_bbsref", study_bbsref);
      ModelAndView mav=new ModelAndView();   
      mav.setViewName("study/studybbs");      
      return mav;   
   }   
   
   @RequestMapping("/studybbsList.do")
   public ModelAndView studybbslist(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){      
      int study_idx=(Integer)session.getAttribute("study_idx");
      int study_bbsref=(Integer)session.getAttribute("study_bbsref");
      study_bbsDTO study_bbsdto=new study_bbsDTO();
      study_bbsdto.setStudy_idx(study_idx);
      study_bbsdto.setStudy_bbsref(study_bbsref);
      bbsnameStudyDTO bbsnamedto=new bbsnameStudyDTO(study_idx, "-", study_bbsref);
      session.setAttribute("studybbs_cp", cp);      
      int total=studybbsDao.get_studybbslist_total(study_bbsdto);
      if(total==0){
         total=1;
      }
      int ls=15;
       int ps=10;
       String page=study_paging.pageMake("studybbslist", total, ls, ps, cp);
      
      List<study_bbsDTO> study_bbslist=studybbsDao.study_bbslist_get(study_bbsdto,cp,ls);
      ModelAndView mav=new ModelAndView();
      String study_bbsname=bbsnameSDao.bbsnameget(bbsnamedto);
      if(study_bbsname==null){
         mav.addObject("study_bbsname","Study Place");
      }else{
         mav.addObject("study_bbsname",study_bbsname);
      }      
      mav.addObject("study_bbslist",study_bbslist);
      mav.addObject("page",page);
      mav.setViewName("yongJson");      
      return mav;
   } 
   @RequestMapping("/studybbsnameadd.do")
   public ModelAndView studybbsnameadd(bbsnameListDTO dto,HttpSession session){   
      int result=0;
      for(int i=0;i<dto.getBbsnameStudyDTO().size();i++){
         if(dto.getBbsnameStudyDTO().get(i).getStudy_bbsname().equals("")||dto.getBbsnameStudyDTO().get(i).getStudy_bbsname().equals(null)){
            
         }else{
            result+=bbsnameSDao.bbsnameinsert(dto.getBbsnameStudyDTO().get(i),session);
         }
      }   
      
      ModelAndView mav=new ModelAndView();
      if(result==dto.getBbsnameStudyDTO().size()){
         List<bbsnameStudyDTO> list=bbsnameSDao.bbsnamelist(session);
         session.setAttribute("bbsnamelist",list);
      }
      mav.setViewName("yongJson");      
      return mav;
   }
      /*�뿬湲곗뿬湲�*/
      @RequestMapping("/goSearching.do")
      public ModelAndView goSearching(@RequestParam(value="cp",defaultValue="1")int cp,String title,String theme){
         ModelAndView mav=new ModelAndView();
         System.out.println(title+" //// "+ theme);
         int total=0;
         if(title==null||title.equals("")){
            total=createStudyDao.get_study_total_theme(theme);
         }else{
            total=createStudyDao.get_study_total_title(title);
         }
         if(total==0){
            total=1;
         }
         int ls=15;
          int ps=10;
          List<createStudyDTO> list = new ArrayList<createStudyDTO>();
          if(title.equals(null) || title.equals("")){
            list = createStudyDao.studylist_theme(cp, ls,theme);
         }else{
            list = createStudyDao.studylist_title(cp, ls,title);
           }
          String page=study_paging.pageMake("goSearching", total, ls, ps, cp);
         mav.addObject("page",page);
         mav.addObject("list",list);
         mav.setViewName("yongJson");      
         return mav;
      }
   
}