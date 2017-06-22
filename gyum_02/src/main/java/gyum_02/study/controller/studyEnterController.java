package gyum_02.study.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.masterpage.model.StudentDAO;
import gyum_02.study.model.bbsnameStudyDAO;
import gyum_02.study.model.createStudyDAO;
import gyum_02.study.model.createStudyDTO;
import gyum_02.study.model.infoStudyDAO;
import gyum_02.study.model.infoStudyDTO;
import gyum_02.study.model.inqStudyDAO;
import gyum_02.study.model.leaderStudyDAO;
import gyum_02.study.model.memberStudyDAO;
import gyum_02.study.model.memberStudyDTO;
import gyum_02.study.model.recruitStudyDAO;
import gyum_02.study.model.recruitStudyDTO;
import gyum_02.study.model.reqStudyDAO;
import gyum_02.study.model.reqStudyDTO;
import gyum_02.study.model.study_bbsDAO;
import gyum_02.study.model.votebbsDAO;
import gyum_02.study.model.voteconListDAO;
import gyum_02.study.model.voterDAO;

@Controller
public class studyEnterController {
   @Autowired
   private createStudyDAO createStudyDao;
   
   @Autowired
   private memberStudyDAO memberSDao;

   @Autowired
   private recruitStudyDAO rsDao;

   @Autowired
   private infoStudyDAO infoSDao;
   @Autowired
   private reqStudyDAO reqDao;
   
   @Autowired
   private StudentDAO studentDao;
   
   @RequestMapping("/study_reqlist_go")
   public ModelAndView study_reqlist_go(){
      ModelAndView mav=new ModelAndView();
      mav.setViewName("study/mypage/study_reqlist");
      return mav;
   }
      @RequestMapping("/study_req_recivlist_go.do")
   public ModelAndView study_req_recivlist_go(){
      ModelAndView mav=new ModelAndView();
      mav.setViewName("study/mypage/study_req_recivlist");
      return mav;
   }
   @RequestMapping("/study_enter_go.do")
   public ModelAndView study_enter_go(){
      ModelAndView mav=new ModelAndView();
      mav.setViewName("study/mypage/study_enter");
      return mav;
   }
   
   @RequestMapping("/study_req_add.do")
   public ModelAndView study_req_add(reqStudyDTO dto,HttpSession session){
      ModelAndView mav=new ModelAndView();
      int idx=(Integer)session.getAttribute("idx");
      dto.setStu_idx(idx);
      dto.setStudy_req_accept(0);
      List<reqStudyDTO> list=reqDao.study_req_check(dto);
      if(list.size()<1){
         reqDao.study_req_add(dto);
         rsDao.study_recruit_req_update_plus(dto.getStudy_recruitidx());
      }else{
      }      
      mav.setViewName("yongJson");
      return mav;
   }
   
   @RequestMapping("/study_req_list.do")
   public ModelAndView study_req_list(HttpSession session){
      ModelAndView mav=new ModelAndView();
      int idx=(Integer)session.getAttribute("idx");
      List<reqStudyDTO> reqlist=reqDao.study_req_list(idx);
      List<Map<String, Object>> listmap=new ArrayList<Map<String,Object>>();
      for(int i=0;i<reqlist.size();i++){
         int recidx=reqlist.get(i).getStudy_recruitidx();
         List<recruitStudyDTO> rcsdto=rsDao.getstudy_recruit(recidx);
         Map<String , Object> map=new HashMap<String , Object>();
         if(rcsdto.size()>0){
            map.put("sub",rcsdto.get(0).getStudy_recruit_subject());
            map.put("writer", rcsdto.get(0).getStu_id());
            map.put("directory",rcsdto.get(0).getStudy_recruit_directory());
            map.put("recidx", recidx);
            
            int req_i=reqlist.get(i).getStudy_req_accept();
            String req_s="";
            if(req_i==0){
               req_s="신청중";   
               map.put("situ",req_s);
               listmap.add(map);
            }else if(req_i==1){
               req_s="수락됨";
               if(idx==rcsdto.get(0).getStu_idx()){
                  
               }else{
                  map.put("situ",req_s);
                  listmap.add(map);
               }
            }else{
               req_s="거절됨";
               map.put("situ",req_s);
               listmap.add(map);
            }
            
         }
      }
      mav.addObject("reqlist",listmap);
      mav.setViewName("yongJson");
      return mav;
   }
   @RequestMapping("/study_req_cancel.do")
   public ModelAndView study_req_cancel(reqStudyDTO reqdto,HttpSession session){
      ModelAndView mav=new ModelAndView();
      int idx=(Integer)session.getAttribute("idx");
      reqdto.setStu_idx(idx);
      reqDao.sutdy_req_del(reqdto);
      rsDao.study_recruit_req_update_minus(reqdto.getStudy_recruitidx());
      mav.setViewName("yongJson");
      return mav;      
   }
   
   @RequestMapping("/rcs_cancel.do")
   public ModelAndView rcs_cancel(int study_recruitidx){
      ModelAndView mav=new ModelAndView();      
      reqDao.study_req_del2(study_recruitidx);
      mav.setViewName("yongJson");
      return mav;            
   }
   
   
   
   
   @RequestMapping("/study_my_recruit_list.do")
   public ModelAndView study_my_recruit_list(HttpSession session){
      ModelAndView mav=new ModelAndView();
      int stu_idx=(Integer)session.getAttribute("idx");
      String id=(String)session.getAttribute("id");
      List<reqStudyDTO> reqlist=reqDao.study_req_list(stu_idx); 
      List<recruitStudyDTO> rcs_list=new ArrayList<recruitStudyDTO>();
      List<recruitStudyDTO> rcs_make_list=rsDao.getstudy_make_recruitlist(id);      
      mav.addObject("rcs_make_list",rcs_make_list); 
      for(int i=0;i<reqlist.size();i++){         
         if(reqlist.get(i).getStudy_req_accept()==1){         
            int study_recruitidx=reqlist.get(i).getStudy_recruitidx();            
            List<recruitStudyDTO> rcslist=rsDao.getstudy_recruit(study_recruitidx);
            if(rcslist.size()>0){            
               rcs_list.add(rcslist.get(0));
            }
         }
      }
      mav.addObject("rcslist",rcs_list);
      
      List<createStudyDTO> cslist_ing=new ArrayList<createStudyDTO>();
      List<createStudyDTO> cslist_close=new ArrayList<createStudyDTO>();
      List<memberStudyDTO> mlist=memberSDao.getstudy_idx(stu_idx);
      for(int i=0;i<mlist.size();i++){
         List<createStudyDTO> cslist=createStudyDao.getstudyinfo(mlist.get(i).getStudy_idx());
         if(cslist.size()>0){
            if(cslist.get(0).getStudy_situ()==0){
               cslist_ing.add(cslist.get(0));
            }else{
               cslist_close.add(cslist.get(0));
            }
         }
      }   
      mav.addObject("ing",cslist_ing);
      mav.addObject("close",cslist_close);
      mav.setViewName("yongJson");
      return mav;            
   }

   @RequestMapping("/study_req_recivlist.do")
   public ModelAndView study_req_recivlist(HttpSession session){
      ModelAndView mav=new ModelAndView();
      int stu_idx=(Integer)session.getAttribute("idx");
      List<recruitStudyDTO> rcslist=rsDao.getstudy_recruitlist(stu_idx);
      List<Map<String, Object>> listmap=new ArrayList<Map<String,Object>>();
      List<List<infoStudyDTO>> infollist=new ArrayList<List<infoStudyDTO>>();
      System.out.println("�궗�씠利� "+rcslist.size());
      for(int i=0;i<rcslist.size();i++){
         Map<String ,Object> map=new HashMap<String ,Object>();         
         List<reqStudyDTO> reqlist=reqDao.study_recru_reqlist(rcslist.get(i).getStudy_recruitidx());
         System.out.println("reqsize : "+reqlist.size());
         for(int j=0;j<reqlist.size();j++){
            List<infoStudyDTO> infolist=infoSDao.getstudyinfo(reqlist.get(j).getStu_idx());      
            if(infolist.size()>0){
            map.put("sub", rcslist.get(i).getStudy_recruit_subject());
            map.put("rcidx", rcslist.get(i).getStudy_recruitidx());
            map.put("stu_idx",reqlist.get(j).getStu_idx());
                  
            infollist.add(infolist);
            listmap.add(map);
            }
         }               
         
      }      
      System.out.println(listmap.size());
      mav.addObject("info_",infollist);
      mav.addObject("listmap",listmap);
      mav.setViewName("yongJson");
      return mav;   
   }
   @RequestMapping("/rcs_close.do") 
   public ModelAndView rcs_close(int study_recruitidx,boolean close_check,HttpSession session){
      ModelAndView mav=new ModelAndView();
      rsDao.rcs_close(study_recruitidx);
      List<recruitStudyDTO> rslist=rsDao.getstudy_recruit(study_recruitidx);
      String study_subject=rslist.get(0).getStudy_recruit_subject();
      String study_content=rslist.get(0).getStudy_recruit_content();      
      String study_directory=rslist.get(0).getStudy_recruit_directory();
      int study_maxnum=rslist.get(0).getStudy_recruit_maxnum();      
      int term=rslist.get(0).getStudy_recruit_term();
      
      
      Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
      SimpleDateFormat cal_format = new SimpleDateFormat();
      cal_format.applyPattern("yyyy-MM-dd");
      
      String cal_time=cal_format.format(cal.getTime());
      System.out.println(cal_time);
      int year=Integer.valueOf(cal_time.substring(0, 4));
      int month=Integer.valueOf(cal_time.substring(5, 7));
      int day=Integer.valueOf(cal_time.substring(8, 10));
      System.out.println(year+"/"+month+"/"+day);
      
      Calendar c = Calendar.getInstance();       
           c.set(Calendar.YEAR, year);
           c.set(Calendar.MONTH, month -1);
           c.set(Calendar.DATE, day);           
           c.set(Calendar.DATE, c.get(Calendar.DATE)+(term*7));      
           String lastday=c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+ c.get(Calendar.DATE);    
      String study_id=(String)session.getAttribute("String");
      if(close_check){
         createStudyDTO csdto=new createStudyDTO(0, study_subject, study_content, study_id, study_directory, "-", study_maxnum,lastday, 0, 0, null);
         createStudyDao.studyadd(csdto, session);
         int study_idx=createStudyDao.get_study_idx(csdto);
         List<reqStudyDTO>  reqlist=reqDao.study_recru_reqlist(study_recruitidx);
         for(int i=0;i<reqlist.size();i++){
            String stu_id=(studentDao.mp_student_info(reqlist.get(i).getStu_idx())).get(0).getStu_id();
            memberSDao.study_memadd(stu_id,study_idx); 
         }
      }
      reqDao.study_req_del2(study_recruitidx);
      mav.setViewName("yongJson");
      return mav;   
   }
}